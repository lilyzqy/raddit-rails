class SubsController < ApplicationController
  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = current_user.subs.find_by(id: params[:id])
  end

  def update
    @sub = current_user.subs.find_by(id: params[:id])
    if @sub && @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = ["Invalid"]
      render :edit
    end
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find_by(id: params[:id])
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end