class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :force_json

private

  def force_json
    request.format = :json
  end


  # def body_params
  #   request.body.rewind
  #   JSON.parse(request.body.read).with_indifferent_access
  # end

end
