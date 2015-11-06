class MailersController < ApplicationController

  def manager_mail
  end

  def tenant_mail
    mgmt = User.where(is_manager: true)
    @recipient_email = params[:recipient_email]
    body = params[:invitation]
    Mailer.invitation(@recipient_email).deliver
  end
end
