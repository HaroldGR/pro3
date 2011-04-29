class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  
  def new
    @user = User.new
    @title = "Regístrate"
  end

  def show
      @user = User.find(params[:id])
      @microposts = @user.microposts.paginate(:page => params[:page])
      @title = @user.name
  end
  
  def index
    @title = "Todos los Usuarios"
    @users = User.paginate(:page => params[:page])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
        sign_in @user
        flash[:success] = "Ya puedes Post-ear..!"
        redirect_to @user
    else
      @title = "Regístrate"
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "Editar usuario"
  end
  
  def destroy
      User.find(params[:id]).destroy
      flash[:success] = "Usuario Eliminado"
      redirect_to users_path
  end  
  
  def update
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        flash[:success] = "Perfil Actualizado"
        redirect_to @user
      else
        @title = "Editar usuario"
        render 'edit'
      end
  end
  
  def following
    @title = "Siguiendo"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Seguidores"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end

  private
        
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
          redirect_to(root_path) unless current_user.admin?
    end

end
