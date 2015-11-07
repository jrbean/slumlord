class MailersController < ApplicationController
skip_before_action :verify_authenticity_token

  def manager_mail
    if current_user
      if current_user.is_manager
        @recipient_email = current_user.all_tenant_mail.join(", ")
        body = params[:mail_body]
        Mailer.request(@recipient_email).deliver
      else
        render json: { error: "Only managers can do that." }
      end
    else
      render json: { error: "Error 666: You must login or sacrifice more goats." }
    end
  end

  def tenant_mail
    if current_user
      if current_user.is_manager == false || nil
        @recipient_email = current_user.management_mail.join(", ")
        body = params[:mail_body]
        Mailer.request(@recipient_email).deliver
      else
        render json: { error: "Only tenants can do that."}
      end
    else
      render json: { error: "You must login."}
    end
  end
end
