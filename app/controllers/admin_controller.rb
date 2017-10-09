class AdminController < ApplicationController
	protect_from_forgery prepend: true
	
	layout 'admin'

  before_action :authenticate_user!, :verify_is_admin

	before_action :set_locale
	before_action :get_breadcrumbs

	private

	def get_breadcrumbs
		splitted_url = request.original_fullpath.split("/")
		# Remove first object
		splitted_url.shift
		p result = splitted_url.map { |element| element.humanize.capitalize }
		session[:breadcrumbs] = result
		# debug
	end

	def set_locale
		I18n.locale =  params[:locale] || session[:locale] || I18n.default_locale
		# session[:locale] = I18n.locale
	end

  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end

end
