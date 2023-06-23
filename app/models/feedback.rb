class Feedback < ApplicationRecord
    after_create :send_tweet
    before_create :sanitize

    validates :text, length: { maximum: 250 }
    validates :recipient_handle, :text, presence: true

    def sanitize
        self.recipient_handle = self.recipient_handle.gsub('@', '')
    end

    def send_tweet
        TwitterService.tweet!(self)
    end

end