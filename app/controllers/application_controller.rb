class ApplicationController < ActionController::Base
  layout 'admin', if: :devise_controller?
  
end
