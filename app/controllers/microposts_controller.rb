class MicropostsController < ApplicationController
  before_action :check_current_user, except: [:index]

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(micropost_params)
    @micropost.user = current_user
    @micropost.save
    redirect_to @micropost
  end

  def index
    @microposts = Micropost.all.order('created_at DESC')
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  private
  def micropost_params
    params[:micropost].permit(:content)
  end

  def check_current_user
    unless current_user
      flash[:error] = "you need to be logged in"
      redirect_to(root_path)
    end
  end

end
