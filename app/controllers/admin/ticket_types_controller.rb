class Admin::TicketTypesController < AdminController
  
  include CrudConcern

  before_action :find_ticket_type, only: [:edit, :update, :destroy]
  

  def index
    @ticket_types = index_helper("TicketType").order(created_at: :desc)
  end

  def new
    @ticket_type = TicketType.new
  end

  def create
    @ticket_type = TicketType.new(ticket_type_params)
    create_helper(@ticket_type, "edit_admin_ticket_type_path")
  end

  def update
    update_helper(@ticket_type, "edit_admin_ticket_type_path", ticket_type_params)
  end

  def edit
    
  end

  def destroy
    destroy_helper(@ticket_type, "admin_ticket_types_path")
  end

  private

  def find_ticket_type
    @ticket_type = TicketType.find(params[:id])
  end

  def ticket_type_params
    params.require(:ticket_type).permit(TicketType.attribute_names.map(&:to_sym))
  end

end


