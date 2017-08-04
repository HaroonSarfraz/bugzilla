class BugsController < ApplicationController
  def new
     @bug = Bug.new
  end

  def create
    @bug = Bug.new
    @bug.deadline = DateTime.new(params[:bug]["deadline(1i)"].to_i,params[:bug]["deadline(2i)"].to_i,params[:bug]["deadline(3i)"].to_i,params[:bug]["deadline(4i)"].to_i,params[:bug]["deadline(5i)"].to_i)
    puts("yo yo      yo")
    puts(@bug.deadline)
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  def index
  end
end
