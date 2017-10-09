class Admin::SettingsController < AdminController
  
  include CrudConcern

  before_action :find_setting, only: [:edit, :update, :destroy]
  

  def index
    # @settings = Setting.all
    @settings = index_helper("Setting")
  end

  def new
    @setting = Setting.new
  end

  def create
    @setting = Setting.new(setting_params)
    create_helper(@setting, "edit_admin_setting_path")
  end

  def update
    update_helper(@setting, "edit_admin_setting_path", setting_params)
  end

  def edit
  end

  def destroy
    destroy_helper(@setting, "admin_settings_path")
  end

  private

  def find_setting
    @setting = Setting.find(params[:id])
  end

  def setting_params
    params.require(:setting).permit(Setting.attribute_names.map(&:to_sym))
  end

end