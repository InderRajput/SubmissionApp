class SubmissionsController < ApplicationController
  respond_to :html, :json

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submissions_params)
    if @submission.save
      respond_to do |format|
        format.html { redirect_to root_path}
        format.json { render json: root_path }
      end
    else
      redirect_to root_path
    end
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def index
    @submissions = Submission.all
    @submission = Submission.new
  end

  def update
    @submission = Submission.find(params[:id])
    if @submission.update_attributes(submissions_params)
      respond_to do |format|
        format.html { redirect_to root_path}
        format.json { render json: root_path }
      end
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    if @submission.destroy
      respond_to do |format|
        format.html { redirect_to root_path}
        format.js   { render :nothing => true }
      end
    end
  end

  private
  def submissions_params
    params.require(:submission).permit(:name, :skill, :email, :phone, :location, :visa, :rate, :availability, :relocation)
  end
end