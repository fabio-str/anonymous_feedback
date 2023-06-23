class FeedbacksController < ApplicationController
    
    def new
        @feedback = Feedback.new
    end

    def create
        @feedback = Feedback.create(feedback_params)

        if @feedback.save
            redirect_to '/', notice: "Tweet sent successfully!"
        else
            render :home
        end
    end

    private

    def feedback_params
        params.require(:feedback).permit(:text, :recipient_handle)
    end
    
end