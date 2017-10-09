module CrudConcern 
  extend ActiveSupport::Concern

  included do
    helper_method :create_helper, :update_helper, :destroy_helper, :index_helper
  end

  def index_helper(object, options = {})
    cat_id = params[:category_id]
    manu_id = params[:manufacturer_id]
    keywords = params[:keywords]
    show = params[:incomplete]
    scope = options[:scope] || 'all'

    page_size = Rails.application.config.page_size

    begin
      @objects = object.constantize.includes(:category).includes(:manufacturer).search(keywords).incomplete(show).manufacturer_scope(manu_id).category_scope(cat_id).send(scope).paginate(:page => params[:page], :per_page => page_size)
    rescue NoMethodError => e
      logger.debug "Warnings encountered - #{e.message}."
      @objects = object.constantize.send(scope).paginate(:page => params[:page], :per_page => page_size)
    end
  end

  def create_helper(object, path)
    begin
      if object.save
        respond_to do |format|
          format.html {
            redirect_to send(path, object)
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
  end

  def update_helper(object, path, params)
    if object.update(params)
      if params[:pictures]
        params[:pictures].each { |image| object.pictures.create(image: image) }
      end
      respond_to do |format|
        format.html {
          redirect_to send(path, object)
          flash[:primary] = "Well done!"
        }
      end
    else
      logger.debug "Encountered errors:"
      logger.debug object.errors.full_messages
      flash[:danger] = "Something's not quite right"
      render :edit
    end
  end

  def destroy_helper(object, path)
    begin
      if object.destroy
        respond_to do |format|
          format.html {
            redirect_to send(path)
            flash[:primary] = "Well done"    
          }
        end
      else
        flash[:danger] = "Something's not quite right"
        render :index
      end
    rescue ActiveRecord::InvalidForeignKey => e
    # Flash and render, render API json error... whatever
    # Possible error output:
    # Can't delete! PG::ForeignKeyViolation: ERROR: update or delete on table "labels" violates 
    # foreign key constraint "fk_rails_5a55c39b94" on table "products" DETAIL: Key (id)=(2) is 
    # still referenced from table "products". : DELETE FROM "labels" WHERE "labels"."id" = $1

      begin
        redirect_to send(path)
        # redirect_to send(path)
        matched = /(?<=from table)(.*?)(?=\.)/.match(e.message)
        array_of_record_ids = error_record_lookup(matched[0], object)
        flash[:danger] = "Can't delete record because #{object.class.name.downcase} with id #{object.id} is referenced in table #{matched[0]}, records with id(s) - #{array_of_record_ids}"
      rescue
        # redirect_to send(path)
        flash[:danger] = "Эта родительская сущность. Так как у нее присутствуют дочерние записи, её нельзя удалить на данный момент. Сначала нужно удалить дочерние записи. Полный текст ошибки: #{e.message}"
      end
    end
  end

  def error_record_lookup(class_as_string, object_as_instance_variable)
    # We receive class name as downcase string
    # "products".singularize.capitalize.constantize
    class_as_string.tr('^A-Za-z', '').singularize.capitalize.constantize.where("#{object_as_instance_variable.class.name.downcase}_id = ?", object_as_instance_variable.id).map{ |item| item.id}
    # this returns an array of all records where intial record is mentioned
  end

end