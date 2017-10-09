class Admin::ArchivesController < AdminController
  include CrudConcern

  before_action :find_archive, only: [:edit, :update, :destroy]
  

  def index
    @archives = index_helper("Archive").order(created_at: :desc)
  end

  def new
    @archive = Archive.new
  end

  def create
    @archive = Archive.new(archive_params)
    begin
      if @archive.save

        if params[:pictures]
          params[:pictures].each { |image| @archive.pictures.create(image: image)}
        end

        respond_to do |format|
          format.html {
            redirect_to edit_admin_archive_path
            flash[:primary] = "Well done!"
          }
        end
      else
        flash[:danger] = "Something not quite right"
        render :new
        # redirect_to send("new_admin_#{object.class.name.downcase}_path")
      end
    rescue => e
      flash[:danger] = e.message
      render :new
    end

    # create_helper(@archive, "edit_admin_archive_path")
  end

  def update
    if @archive.update(archive_params)
      if params[:pictures]
        params[:pictures].each { |image| @archive.pictures.create(image: image)}
      end

      respond_to do |format|
        format.html {
          redirect_to edit_admin_archive_path
          flash[:primary] = "Well done!"
        }
      end
    end
    # update_helper(@archive, "edit_admin_archive_path", archive_params)
  end

  def edit
    
  end

  def destroy
    destroy_helper(@archive, "admin_archives_path")
  end

  private

  def find_archive
    @archive = Archive.find(params[:id])
  end

  def archive_params
    params.require(:archive).permit(Archive.attribute_names.map(&:to_sym).push(
      pictures_attributes: [ :id, :image, :archive_id, :_destroy ]))
  end

end


