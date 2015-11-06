class RepairsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def show
    @repairs = Repair.find params[:id]
  end

  def index
    if current_user
      if current_user.is_manager
        @repairs = Repair.all
      else
        @repairs = current_user.tenant_repairs
      end
    else
      render json: { error: "You must login."}
    end
  end

  def create
    @repair = Repair.create(
      tenant: current_user,
      description: params[:description],
      submitted_at: Time.now
    )
    head :ok
  end

  def update
    if current_user
      if current_user.is_manager
        @repair = Repair.find params[:id]
        @repair.update(
          completed_at: Time.now,
          manager_id: current_user.id
          )
      else
        render json: { error: "Only managers can do that." }
      end
    else
      render json: { error: "You must login." }
    end
    head :ok
  end

end
