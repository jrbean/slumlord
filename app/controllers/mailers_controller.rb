class MailersController < ApplicationController

  def manager_mail
    if current_user
      if current_user.is_manager
        @recipient_email = current_user.all_tenant_mail.join(", ")
        body = params[:mail_body]
        Mailer.invitation(@recipient_email).deliver
      else
        render json: { error: "Only managers can do that." }
      end
    else
      render json: { error: "You must login." }
  end

  def tenant_mail
    @recipient_email = current_user.management_mail.join(", ")
    body = params[:mail_body]
    Mailer.invitation(@recipient_email).deliver
  end
end
