class SupportController < ApplicationController

    def new
        @error_messages = []
    end

    def create
        help_category = params[:help_category]
        from_email = params[:email]
        message = params[:message]
        name = params[:name]

        @error_messages = []
        @error_messages << "Please enter your name" if name.blank?
        @error_messages << "Please enter your email" if from_email.blank?
        @error_messages << "Please enter your message" if message.blank?

        if @error_messages.empty?
            # Send message to support email address
            SupportMailer.contact_support(help_category, name, from_email, message).deliver_now
            # Show success message
            render :success
        else
            # Show the user the errors
            render :new
        end
    end
end
