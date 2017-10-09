class Admin::UsersController < AdminController

  include CrudConcern

  before_action :find_user, only: [:update, :destroy]
  

  def index
    # @users = User.all
    if params[:current]
      # User.joins(:events).where(events: {id: 4})
      @users = index_helper("User").joins(:events).where(events: {id: Event.last.id}).order(created_at: :desc)
    else
      @users = index_helper("User").order(created_at: :desc)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    create_helper(@user, "edit_admin_user_path")
  end

  def update
    update_helper(@user, "edit_admin_user_path", user_params)
  end

  def edit
    @user = User.includes(:tickets).find(params[:id])
    @ticket_groups = @user.tickets.group_by(&:event_id)
  end

  def destroy
    destroy_helper(@user, "admin_users_path")
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(User.attribute_names.map(&:to_sym))
  end

end

