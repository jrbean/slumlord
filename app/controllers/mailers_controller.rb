class MailersController < ApplicationController
skip_before_action :verify_authenticity_token

  def manager_mail
    if current_user
      if current_user.is_manager
        @recipient_email = current_user.all_tenant_mail.join(", ")
        body = params[:mail_body]
        UserMailer.request(current_user, @recipient_email, body).deliver
      else
        render json: { error: "Only managers can do that." }
      end
    else
      render json: { error: "Error 666: You must login or sacrifice more goats." }
    end
    head :ok
  end

  def tenant_mail
    if current_user
      if current_user.is_manager == false
        @recipient_email = current_user.management_mail.join(", ")
        body = params[:mail_body]
        UserMailer.request(current_user, @recipient_email, body).deliver
      else
        render json: { error: "Only tenants can do that."}
      end
    else
      render json: { error: "You must login."}
    end
    head :ok
  end
end
