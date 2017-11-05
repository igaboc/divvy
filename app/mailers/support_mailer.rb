class SupportMailer < ApplicationMailer
    def contact_support(help_category, from_email, message, name)
        @help_category = help_category
        @from_email = from_email
        @message = message
        @name = name
        support_email = ENV.fetch('SUPPORT_EMAIL')
        mail(to: support_email, subject: "Support request from #{@from_email}")
    end
end
