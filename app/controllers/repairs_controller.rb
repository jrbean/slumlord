class RepairsController < ApplicationController

  def show
    binding.pry
    @repairs = Repair.all
  end

  def index
    @repairs = current_user.repairs
  end

  def create
    @repair = Repair.new
  end

  def update
  end

end
