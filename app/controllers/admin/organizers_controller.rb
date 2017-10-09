class Admin::OrganizersController < AdminController
  include CrudConcern

  before_action :find_organizer, only: [:edit, :update, :destroy]
  

  def index
    # @organizers = Organizer.all
    @organizers = index_helper("Organizer")
  end

  def new
    @organizer = Organizer.new
  end

  def create
    @organizer = Organizer.new(organizer_params)
    create_helper(@organizer, "edit_admin_organizer_path")
  end

  def update
    update_helper(@organizer, "edit_admin_organizer_path", organizer_params)
  end

  def edit
  end

  def destroy
    destroy_helper(@organizer, "admin_organizers_path")
  end

  private

  def find_organizer
    @organizer = Organizer.find(params[:id])
  end

  def organizer_params
    params.require(:organizer).permit(Organizer.attribute_names.map(&:to_sym))
  end

end

