class Admin::SpeakersController < AdminController

  include CrudConcern

  before_action :find_speaker, only: [:edit, :update, :destroy]
  

  def index
    # @speakers = Speaker.all
    @speakers = index_helper("Speaker")
  end

  def new
    @speaker = Speaker.new
  end

  def create
    @speaker = Speaker.new(speaker_params)
    create_helper(@speaker, "edit_admin_speaker_path")
  end

  def update
    update_helper(@speaker, "edit_admin_speaker_path", speaker_params)
  end

  def edit
  end

  def destroy
    destroy_helper(@speaker, "admin_speakers_path")
  end

  private

  def find_speaker
    @speaker = Speaker.find(params[:id])
  end

  def speaker_params
    params.require(:speaker).permit(Speaker.attribute_names.map(&:to_sym))
  end

end

