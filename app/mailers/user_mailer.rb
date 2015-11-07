class UserMailer < ApplicationMailer

  def request(user, recipient_email, body)
    mail(
     to: recipient_email,
     body: body,
     content_type: "text/plain",
     subject: "Request from #{user.name}"
     )
  end

end
