class SessionsController < ApplicationController
  skip_before_action :login_required, :only => [:new, :create]
  
  def new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:alert] = "ログインに失敗しました"
      render :action => 'new'
    end
  end
  
  def destroy
    reset_session
    flash[:alert] = "ログインしました"
    redirect_to login_path
  end
end
