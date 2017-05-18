class AddUniqueIndexToSummarisable < ActiveRecord::Migration
  def change
    add_index :request_summaries,
              [:summarisable_type, :summarisable_id],
              :unique => true,
              :name => "index_request_summaries_on_summarisable"
  end
end
