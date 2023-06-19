class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.string :recipient_handle
      t.string :text
      t.string :tweet_url
      t.string :tweet_id

      t.timestamps
    end
  end
end
