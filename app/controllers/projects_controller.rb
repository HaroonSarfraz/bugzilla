class ProjectsController < ApplicationController
  before_action :authenticate_user!
   after_action :verify_authorized, only: [:create , :update, :destroy ]
  def new
    @users = User.all;
    @project = Project.new
  end
  def create
    @project = Project.new(project_params)
    authorize @project
    if @project.save
      flash[:success] = "Project Created successfully!"
      render 'show'
    else
    flash[:failure] = "Please fix given errors "
    render 'new'
    end

  end

  def update
    @project = Project.find(params[:id])
    authorize @project
    if @project.update_attributes(project_params)
      flash[:success] = "Project Information updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def edit
    @project = Project.find(params[:id])
    @users = User.all;
  end

  def destroy
    @p = Project.find(params[:id])
    authorize @p
    @p.destroy
    redirect_to projects_url
  end

  def show
    @project = Project.find(params[:id])
    end

  def index
    @projects = Project.paginate(page: params[:page])
    #authorize Project
  end
  def project_params
    params.require(:project).permit(:title, :description, user_projects_attributes: [:access, user_attributes: [:id]], :user_ids => [])
  end

public
  def admin?
    if !user_signed_in?
      return false
    elsif current_user.admin.nil?
      return false
    else
      return current_user.admin
    end
  end
  def canchange?(project)
    current_user.projects.include? project
  end




end

