class UserMailer < ApplicationMailer

  def request(recipient_email, body, subject)
    @recipient_email = recipient_email
    @body = body
    mail(to: recipient_email,
     body: body
     subject: 'Request from #{current_user}')
  end

end
