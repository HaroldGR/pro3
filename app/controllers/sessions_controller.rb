class SessionsController < ApplicationController
  def new
     @title = "Ingresar"
  end

  def create
    user = User.authenticate(params[:session][:email],
                              params[:session][:password])
     if user.nil?
       flash.now[:error] = "Email/Password, combinación erronea."
       @title = "Ingresar"
       render 'new'
     else
       sign_in user
       redirect_back_or user
     end
  end

  def destroy
    sign_out
    redirect_to :controller=>'home', :action=>'index'
  end

end
