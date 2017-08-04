class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create

    @project = Project.new
    @project.title = params[:project][:title]
    @project.description = params[:project][:description]
    puts(current_user)


    #@project.users =
    if @project.save
      flash[:success] = "Project Created successfully!"
      @up = UserProject.new
      @up.user = current_user
      @up.project = @project
      @up.save

    else
    flash[:failure] = "Please fix given errors "
    render 'new'


    end

  end

  def update
    @project = Project.find(params[:id])
    @project.title = params[:project][:title]
    @project.description = params[:project][:description]


    if @project.save
      flash[:success] = "Project Information updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
  end

  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.paginate(page: params[:page])
  end
end
