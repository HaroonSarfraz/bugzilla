class BugsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_project , :authenticate_user!
  after_action :verify_authorized, only: [:create , :update, :destroy ]

  def new
    @bug = @project.bugs.new
  end

  def create
    @bug = Bug.create(bug_params)
    @bug.project = Project.find(params[:bug][:project_id])
    @bug.creater = current_user
    authorize @bug
    if @bug.save
      flash[:success] = "Bug created  "
      render 'show'
    else
      flash[:failure] = "Please fix given errors "
      render 'new'
    end
  end
  def assign_bug
    @p = Project.find(params[:project_id])
    @b = Bug.find(params[:bug_id])
    authorize @b , :create?
    @b.asigned = current_user
    puts(current_user.name)
    @b.save
    render json: current_user
  end
  def change_status
    @b = Bug.find(params[:bug_id])
    authorize @b , :update?
    @b.status = params[:status]
    @b.save
    redirect_to project_bug_path(project_id: @b.project.id ,id: @b.id)
  end



  def update
    @bug = Bug.find(params[:id])
    @bug.deadline = DateTime.new(params[:bug]["deadline(1i)"].to_i,params[:bug]["deadline(2i)"].to_i,params[:bug]["deadline(3i)"].to_i,params[:bug]["deadline(4i)"].to_i,params[:bug]["deadline(5i)"].to_i)
    @bug.title = params[:bug][:title]
    @bug.description = params[:bug][:description]
    @bug.screenshot = params[:bug][:screenshot]
    authorize @bug
    #authorize @bug
    if @bug.save
      flash[:success] = "Bug updated  "
      render 'show'
    else
      flash[:failure] = "Please fix given errors "
      render 'edit'
    end
  end

  def edit
    @bug = Bug.find(params[:id])
  end

  def destroy
    b = authorize Bug.find(params[:id])
    b.destroy
  end

  def show
     @bug = Bug.find(params[:id])
  end

  def index
    if params[:project_id]
      @bugs = Project.find(params[:project_id]).bugs
      #@bugs = @bugs.paginate(page: params[:page])
      #Bug.paginate(page: params[:page])
    else
      @bugs = Bug.paginate(page: params[:page])
    end
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end
    def bug_params
      params.require(:bug).permit(:screenshot,:deadline,:title,:description,:bug_type,:status,:created_by,:project_id)
    end
end
