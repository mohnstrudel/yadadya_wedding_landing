class FrontController < ApplicationController
  layout 'front'

  before_action :find_settings

  private

  def find_settings
    @settings = Setting.first
  end
end
