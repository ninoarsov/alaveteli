##
# Controller to serve FoiAttachment records in both raw and as HTML.
#
class AttachmentsController < ApplicationController
  include FragmentCachable
  include InfoRequestHelper
  include PublicTokenable

  around_action :cache_attachments

  before_action :find_info_request, :find_incoming_message, :find_attachment
  before_action :authenticate_attachment
  before_action :authenticate_attachment_as_html, only: :show_as_html

  helper_method :info_request, :incoming_message, :attachment

  def show
    # Prevent spam to magic request address. Note that the binary
    # substitution method used depends on the content type
    body = @incoming_message.apply_masks(
      @attachment.default_body,
      @attachment.content_type
    )

    if content_type == 'text/html'
      body =
        Loofah.scrub_document(body, :prune).
        to_html(encoding: 'UTF-8').
        try(:html_safe)
    end

    render body: body, content_type: content_type
  end

  def show_as_html
    # images made during conversion (e.g. images in PDF files) are put in the
    # cache directory, so the same cache code in cache_attachments above will
    # display them.
    key = params.merge(only_path: true)
    key_path = foi_fragment_cache_path(key)
    image_dir = File.dirname(key_path)
    FileUtils.mkdir_p(image_dir)

    html = @attachment.body_as_html(
      image_dir,
      attachment_url: Rack::Utils.escape(attachment_url(@attachment)),
      content_for: {
        head_suffix: render_to_string(
          partial: 'request/view_html_stylesheet',
          formats: [:html]
        ),
        body_prefix: render_to_string(
          partial: 'request/view_html_prefix'
        )
      }
    )

    html = @incoming_message.apply_masks(html, response.content_type)

    render html: html.html_safe
  end

  private

  def find_info_request
    if public_token
      @info_request = InfoRequest.find_by!(public_token: public_token)
    else
      @info_request = InfoRequest.find(params[:id])
    end
  end

  def find_incoming_message
    @incoming_message = @info_request.incoming_messages.find(
      params[:incoming_message_id]
    )
  end

  def find_attachment
    @attachment = (
      @incoming_message.parse_raw_email!

      IncomingMessage.get_attachment_by_url_part_number_and_filename!(
        @incoming_message.get_attachments_for_display,
        part_number,
        original_filename
      )
    )
  end

  def authenticate_attachment
    # Test for hidden
    if cannot?(:read, @info_request)
      request.format = :html
      return render_hidden
    end
    if cannot?(:read, @incoming_message)
      request.format = :html
      return render_hidden('request/hidden_correspondence')
    end

    return if @attachment

    # If we can't find the right attachment, redirect to the incoming message:
    redirect_to incoming_message_url(@incoming_message), status: 303
  end

  def authenticate_attachment_as_html
    # The conversion process can generate files in the cache directory that can
    # be served up directly by the webserver according to httpd.conf, so don't
    # allow it unless that's OK.
    return if message_is_public?

    raise ActiveRecord::RecordNotFound, 'Attachment HTML not found.'
  end

  # special caching code so mime types are handled right
  def cache_attachments
    if !params[:skip_cache].nil?
      yield
    else
      key = params.merge(only_path: true)
      key_path = foi_fragment_cache_path(key)
      if foi_fragment_cache_exists?(key_path)
        logger.info("Reading cache for #{key_path}")

        if File.directory?(key_path)
          render plain: 'Directory listing not allowed', status: 403
        else
          render body: foi_fragment_cache_read(key_path),
                 content_type: content_type
        end
        return
      end

      yield

      if params[:skip_cache].nil? && response.status == 200
        # write it to the filesystem ourselves, so is just a plain file. (The
        # various fragment cache functions using Ruby Marshall to write the file
        # which adds a header, so isn't compatible with images that have been
        # extracted elsewhere from PDFs)
        if message_is_public?
          logger.info("Writing cache for #{key_path}")
          foi_fragment_cache_write(key_path, response.body)
        end
      end
    end
  end

  def part_number
    params[:part].to_i
  end

  def original_filename
    filename = params[:file_name]
    if action_name == 'show_as_html'
      filename.gsub(/\.html$/, '')
    else
      filename
    end
  end

  def content_type
    # we don't use @attachment.content_type here, as we want same mime type
    # when cached in cache_attachments above
    AlaveteliFileTypes.filename_to_mimetype(params[:file_name]) ||
      'application/octet-stream'
  end

  def message_is_public?
    # Is this a completely public request that we can cache attachments for
    # to be served up without authentication?
    @incoming_message.info_request.prominence(decorate: true).is_public? &&
      @incoming_message.is_public?
  end
end
