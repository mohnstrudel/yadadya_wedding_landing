class Front::Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  respond_to :html, :js

  # GET /resource/sign_up
  def new
    # @user = User.new
    
    super
  end

  # POST /resource
  def create
    super

    # begin
    #   @user = User.new(configure_sign_up_params)

    #   respond_to do |format|
    #     if @user.save
    #       format.js
    #     else
    #       format.js { render partial: 'fail' }
    #     end
    #   end
    # rescue=>e
    #   logger.debug "Error occured while creating new user. Message: #{e.message}"
    #   super
    # end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :company, :position, :phone, :facebook])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
