class BugsController < ApplicationController
  before_action :set_project
  def new
    @bug = @project.bugs.new
  end

  def create
    @bug = Bug.create(bug_params)
    #@bug.deadline = DateTime.new(params[:bug]["deadline(1i)"].to_i,params[:bug]["deadline(2i)"].to_i,params[:bug]["deadline(3i)"].to_i,params[:bug]["deadline(4i)"].to_i,params[:bug]["deadline(5i)"].to_i)
    #@bug.title = params[:bug][:title]
    #@bug.description = params[:bug][:description]
    #@bug.project = Project.find(params[:bug][:project_id])
    #@bug.creater = current_user
    ##@bug.asigned = current_user
    #@bug.bug_type = params[:bug][:bug_type]
    #@bug.status = params[:bug][:status]
    #puts(@bug.inspect)
    if @bug.save
      flash[:success] = "Bug created  "
      render 'show'
    else
      flash[:failure] = "Please fix given errors "
      render 'new'
    end


  end

  def update
    @bug = Bug.find(params[:id])
    @bug.deadline = DateTime.new(params[:bug]["deadline(1i)"].to_i,params[:bug]["deadline(2i)"].to_i,params[:bug]["deadline(3i)"].to_i,params[:bug]["deadline(4i)"].to_i,params[:bug]["deadline(5i)"].to_i)
    @bug.title = params[:bug][:title]
    @bug.description = params[:bug][:description]
    @bug.project = Project.find(params[:project][:project_id])
    @bug.asigned_to = params[:bug][:asigned_to]
    @bug.created_by = params[:bug][:created_by]
    @bug.type = params[:bug][:type]
    @bug.status = params[:bug][:status]
    @bug.screenshot = params[:bug][:status]

    if @bug.save
      flash[:success] = "Bug updated  "
    else
      flash[:failure] = "Please fix given errors "
    end
  end

  def edit
    @bug = Bug.find(params[:id])
  end

  def destroy
    Bug.find(params[:id]).destroy
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
