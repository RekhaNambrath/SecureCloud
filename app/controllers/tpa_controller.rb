class TpaController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def audit
  end
  def index
    @req=RequestMessage.all
  end
  def show
    @user=User.find(params[:id])
  end
end
