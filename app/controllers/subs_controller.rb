class SubsController < ApplicationController
  before_action :moderator_edit_sub, only: [:edit, :update]

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.create(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def moderator_edit_sub
    @sub = Sub.find(params[:id])
    unless @sub.moderator_id == current_user.id
      flash[:errors] = ["You are not the moderator of this sub."]
      redirect_to subs_url
    end
  end

end
