class ApplicationController < ActionController::Base

  before_action :authenticate_user!


  def set_listing
    @listing = Listing.find(params[:id]) if params[:id]
  end




  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :users])
  end
end
