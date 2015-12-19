class ControlPanelController < ApplicationController

  http_basic_authenticate_with :name => ENV['CP_USER'], :password => ENV['CP_PASSWORD']
  def index
  end

  def new
  end

  def create
  end

  def destroy
  end
end
