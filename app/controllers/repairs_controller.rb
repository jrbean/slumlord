class RepairsController < ApplicationController

  def show
    @repairs = Repair.all
  end

  def index
    if current_user.is_manager
      @repairs = Repair.all
    else
      @repairs = current_user.tenant_repairs
    end
  end

  def create
    @repair = Repair.create(
      tenant: current_user,
      description: params[:description],
      submitted_at: Time.now
    )
  end

  def update
    @repair = Repair.update(completed_at: Time.now)
  end

end
