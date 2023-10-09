# frozen_string_literal: true

require 'mailtrap'

class MaillingService < BaseService
  def execute
    mail = Mailtrap::Mail::Base.new(
      from: { email: 'mailtrap@example.com', name: 'Mailtrap Test' },
      to: [
        { email: 'your@email.com' }
      ],
      subject: 'Hello there',
      text: 'Congrats for sending test email'
    )
    client = Mailtrap::Sending::Client.new(api_key: Rails.application.credentials.dig(:smtp, :api_key))
    client.send(mail)
  end
end
