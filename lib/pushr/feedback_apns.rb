module Pushr
  class FeedbackApns < Pushr::Feedback
    attr_accessor :type, :app, :device, :follow_up, :failed_at

    validates :device, format: { with: /\A[a-z0-9]{64}\z/ }
    validates :follow_up, inclusion: { in: %w(delete), message: '%{value} is not a valid follow-up' }

    def to_json
      MultiJson.dump(type: 'Pushr::FeedbackApns', app: app, device: device, follow_up: follow_up, failed_at: failed_at)
    end
  end
end
