class Bigint < ActiveRecord::Migration[5.0]
  def up
    change_column :acts_as_xapian_jobs, :id, :bigint
    change_column :acts_as_xapian_jobs, :model_id, :bigint
    change_column :announcement_dismissals, :announcement_id, :bigint
    change_column :announcement_dismissals, :id, :bigint
    change_column :announcement_dismissals, :user_id, :bigint
    change_column :announcement_translations, :announcement_id, :bigint
    change_column :announcement_translations, :id, :bigint
    change_column :announcements, :id, :bigint
    change_column :announcements, :user_id, :bigint
    change_column :censor_rules, :id, :bigint
    change_column :censor_rules, :info_request_id, :bigint
    change_column :censor_rules, :public_body_id, :bigint
    change_column :censor_rules, :user_id, :bigint
    change_column :comments, :id, :bigint
    change_column :comments, :info_request_id, :bigint
    change_column :comments, :user_id, :bigint
    change_column :draft_info_request_batches, :id, :bigint
    change_column :draft_info_request_batches, :user_id, :bigint
    change_column :draft_info_request_batches_public_bodies, :draft_info_request_batch_id, :bigint
    change_column :draft_info_request_batches_public_bodies, :public_body_id, :bigint
    change_column :draft_info_requests, :id, :bigint
    change_column :draft_info_requests, :public_body_id, :bigint
    change_column :draft_info_requests, :user_id, :bigint
    change_column :embargo_extensions, :embargo_id, :bigint
    change_column :embargo_extensions, :id, :bigint
    change_column :embargoes, :id, :bigint
    change_column :embargoes, :info_request_id, :bigint
    change_column :flipper_features, :id, :bigint
    change_column :flipper_gates, :id, :bigint
    change_column :foi_attachments, :id, :bigint
    change_column :foi_attachments, :incoming_message_id, :bigint
    change_column :has_tag_string_tags, :id, :bigint
    change_column :has_tag_string_tags, :model_id, :bigint
    change_column :holidays, :id, :bigint
    change_column :incoming_message_errors, :id, :bigint
    change_column :incoming_messages, :id, :bigint
    change_column :incoming_messages, :info_request_id, :bigint
    change_column :incoming_messages, :raw_email_id, :bigint
    change_column :info_request_batches, :id, :bigint
    change_column :info_request_batches, :user_id, :bigint
    change_column :info_request_batches_public_bodies, :info_request_batch_id, :bigint
    change_column :info_request_batches_public_bodies, :public_body_id, :bigint
    change_column :info_request_events, :comment_id, :bigint
    change_column :info_request_events, :id, :bigint
    change_column :info_request_events, :incoming_message_id, :bigint
    change_column :info_request_events, :info_request_id, :bigint
    change_column :info_request_events, :outgoing_message_id, :bigint
    change_column :info_requests, :id, :bigint
    change_column :info_requests, :info_request_batch_id, :bigint
    change_column :info_requests, :last_event_forming_initial_request_id, :bigint
    change_column :info_requests, :public_body_id, :bigint
    change_column :info_requests, :user_id, :bigint
    change_column :mail_server_log_dones, :id, :bigint
    change_column :mail_server_logs, :id, :bigint
    change_column :mail_server_logs, :info_request_id, :bigint
    change_column :mail_server_logs, :mail_server_log_done_id, :bigint
    change_column :notifications, :id, :bigint
    change_column :notifications, :info_request_event_id, :bigint
    change_column :notifications, :user_id, :bigint
    change_column :outgoing_messages, :id, :bigint
    change_column :outgoing_messages, :incoming_message_followup_id, :bigint
    change_column :outgoing_messages, :info_request_id, :bigint
    change_column :post_redirects, :id, :bigint
    change_column :post_redirects, :user_id, :bigint
    change_column :pro_accounts, :id, :bigint
    change_column :pro_accounts, :user_id, :bigint
    change_column :profile_photos, :id, :bigint
    change_column :profile_photos, :user_id, :bigint
    change_column :public_bodies, :id, :bigint
    change_column :public_body_categories, :id, :bigint
    change_column :public_body_category_links, :category_display_order, :bigint
    change_column :public_body_category_links, :public_body_category_id, :bigint
    change_column :public_body_category_links, :public_body_heading_id, :bigint
    change_column :public_body_category_translations, :public_body_category_id, :bigint
    change_column :public_body_change_requests, :id, :bigint
    change_column :public_body_change_requests, :public_body_id, :bigint
    change_column :public_body_change_requests, :user_id, :bigint
    change_column :public_body_heading_translations, :public_body_heading_id, :bigint
    change_column :public_body_headings, :id, :bigint
    change_column :public_body_translations, :public_body_id, :bigint
    change_column :public_body_versions, :public_body_id, :bigint
    change_column :raw_emails, :id, :bigint
    change_column :request_classifications, :id, :bigint
    change_column :request_classifications, :info_request_event_id, :bigint
    change_column :request_classifications, :user_id, :bigint
    change_column :request_summaries, :id, :bigint
    change_column :request_summaries, :summarisable_id, :bigint
    change_column :request_summaries, :user_id, :bigint
    change_column :request_summaries_summary_categories, :request_summary_category_id, :bigint
    change_column :request_summaries_summary_categories, :request_summary_id, :bigint
    change_column :request_summary_categories, :id, :bigint
    change_column :roles, :id, :bigint
    change_column :roles, :resource_id, :bigint
    change_column :spam_addresses, :id, :bigint
    change_column :track_things, :id, :bigint
    change_column :track_things, :info_request_id, :bigint
    change_column :track_things, :public_body_id, :bigint
    change_column :track_things, :tracked_user_id, :bigint
    change_column :track_things, :tracking_user_id, :bigint
    change_column :track_things_sent_emails, :id, :bigint
    change_column :track_things_sent_emails, :info_request_event_id, :bigint
    change_column :track_things_sent_emails, :public_body_id, :bigint
    change_column :track_things_sent_emails, :track_thing_id, :bigint
    change_column :track_things_sent_emails, :user_id, :bigint
    change_column :user_info_request_sent_alerts, :id, :bigint
    change_column :user_info_request_sent_alerts, :info_request_event_id, :bigint
    change_column :user_info_request_sent_alerts, :info_request_id, :bigint
    change_column :user_info_request_sent_alerts, :user_id, :bigint
    change_column :users, :id, :bigint
    change_column :users_roles, :role_id, :bigint
    change_column :users_roles, :user_id, :bigint
    change_column :webhooks, :id, :bigint
    change_column :widget_votes, :id, :bigint
    change_column :widget_votes, :info_request_id, :bigint
  end

  def down
    change_column :acts_as_xapian_jobs, :id, :integer
    change_column :acts_as_xapian_jobs, :model_id, :integer
    change_column :announcement_dismissals, :announcement_id, :integer
    change_column :announcement_dismissals, :id, :integer
    change_column :announcement_dismissals, :user_id, :integer
    change_column :announcement_translations, :announcement_id, :integer
    change_column :announcement_translations, :id, :integer
    change_column :announcements, :id, :integer
    change_column :announcements, :user_id, :integer
    change_column :censor_rules, :id, :integer
    change_column :censor_rules, :info_request_id, :integer
    change_column :censor_rules, :public_body_id, :integer
    change_column :censor_rules, :user_id, :integer
    change_column :comments, :id, :integer
    change_column :comments, :info_request_id, :integer
    change_column :comments, :user_id, :integer
    change_column :draft_info_request_batches, :id, :integer
    change_column :draft_info_request_batches, :user_id, :integer
    change_column :draft_info_request_batches_public_bodies, :draft_info_request_batch_id, :integer
    change_column :draft_info_request_batches_public_bodies, :public_body_id, :integer
    change_column :draft_info_requests, :id, :integer
    change_column :draft_info_requests, :public_body_id, :integer
    change_column :draft_info_requests, :user_id, :integer
    change_column :embargo_extensions, :embargo_id, :integer
    change_column :embargo_extensions, :id, :integer
    change_column :embargoes, :id, :integer
    change_column :embargoes, :info_request_id, :integer
    change_column :flipper_features, :id, :integer
    change_column :flipper_gates, :id, :integer
    change_column :foi_attachments, :id, :integer
    change_column :foi_attachments, :incoming_message_id, :integer
    change_column :has_tag_string_tags, :id, :integer
    change_column :has_tag_string_tags, :model_id, :integer
    change_column :holidays, :id, :integer
    change_column :incoming_message_errors, :id, :integer
    change_column :incoming_messages, :id, :integer
    change_column :incoming_messages, :info_request_id, :integer
    change_column :incoming_messages, :raw_email_id, :integer
    change_column :info_request_batches, :id, :integer
    change_column :info_request_batches, :user_id, :integer
    change_column :info_request_batches_public_bodies, :info_request_batch_id, :integer
    change_column :info_request_batches_public_bodies, :public_body_id, :integer
    change_column :info_request_events, :comment_id, :integer
    change_column :info_request_events, :id, :integer
    change_column :info_request_events, :incoming_message_id, :integer
    change_column :info_request_events, :info_request_id, :integer
    change_column :info_request_events, :outgoing_message_id, :integer
    change_column :info_requests, :id, :integer
    change_column :info_requests, :info_request_batch_id, :integer
    change_column :info_requests, :last_event_forming_initial_request_id, :integer
    change_column :info_requests, :public_body_id, :integer
    change_column :info_requests, :user_id, :integer
    change_column :mail_server_log_dones, :id, :integer
    change_column :mail_server_logs, :id, :integer
    change_column :mail_server_logs, :info_request_id, :integer
    change_column :mail_server_logs, :mail_server_log_done_id, :integer
    change_column :notifications, :id, :integer
    change_column :notifications, :info_request_event_id, :integer
    change_column :notifications, :user_id, :integer
    change_column :outgoing_messages, :id, :integer
    change_column :outgoing_messages, :incoming_message_followup_id, :integer
    change_column :outgoing_messages, :info_request_id, :integer
    change_column :post_redirects, :id, :integer
    change_column :post_redirects, :user_id, :integer
    change_column :pro_accounts, :id, :integer
    change_column :pro_accounts, :user_id, :integer
    change_column :profile_photos, :id, :integer
    change_column :profile_photos, :user_id, :integer
    change_column :public_bodies, :id, :integer
    change_column :public_body_categories, :id, :integer
    change_column :public_body_category_links, :category_display_order, :integer
    change_column :public_body_category_links, :public_body_category_id, :integer
    change_column :public_body_category_links, :public_body_heading_id, :integer
    change_column :public_body_category_translations, :public_body_category_id, :integer
    change_column :public_body_change_requests, :id, :integer
    change_column :public_body_change_requests, :public_body_id, :integer
    change_column :public_body_change_requests, :user_id, :integer
    change_column :public_body_heading_translations, :public_body_heading_id, :integer
    change_column :public_body_headings, :id, :integer
    change_column :public_body_translations, :public_body_id, :integer
    change_column :public_body_versions, :public_body_id, :integer
    change_column :raw_emails, :id, :integer
    change_column :request_classifications, :id, :integer
    change_column :request_classifications, :info_request_event_id, :integer
    change_column :request_classifications, :user_id, :integer
    change_column :request_summaries, :id, :integer
    change_column :request_summaries, :summarisable_id, :integer
    change_column :request_summaries, :user_id, :integer
    change_column :request_summaries_summary_categories, :request_summary_category_id, :integer
    change_column :request_summaries_summary_categories, :request_summary_id, :integer
    change_column :request_summary_categories, :id, :integer
    change_column :roles, :id, :integer
    change_column :roles, :resource_id, :integer
    change_column :spam_addresses, :id, :integer
    change_column :track_things, :id, :integer
    change_column :track_things, :info_request_id, :integer
    change_column :track_things, :public_body_id, :integer
    change_column :track_things, :tracked_user_id, :integer
    change_column :track_things, :tracking_user_id, :integer
    change_column :track_things_sent_emails, :id, :integer
    change_column :track_things_sent_emails, :info_request_event_id, :integer
    change_column :track_things_sent_emails, :public_body_id, :integer
    change_column :track_things_sent_emails, :track_thing_id, :integer
    change_column :track_things_sent_emails, :user_id, :integer
    change_column :user_info_request_sent_alerts, :id, :integer
    change_column :user_info_request_sent_alerts, :info_request_event_id, :integer
    change_column :user_info_request_sent_alerts, :info_request_id, :integer
    change_column :user_info_request_sent_alerts, :user_id, :integer
    change_column :users, :id, :integer
    change_column :users_roles, :role_id, :integer
    change_column :users_roles, :user_id, :integer
    change_column :webhooks, :id, :integer
    change_column :widget_votes, :id, :integer
    change_column :widget_votes, :info_request_id, :integer
  end
end