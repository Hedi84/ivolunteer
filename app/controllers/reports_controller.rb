class ReportsController < ApplicationController
  before_action :find_report, only: [:show, :delete]
  before_action :authenticate_user!


  def new
    @report = Report.new
  end

  def create
    @user = current_user
    @report = Report.new(report_params)
    @report.user_id = @user.id
    if @report.save
      redirect_to report_path(@report)
    else
      render "new"
    end
  end

  def index
    @reports = Report.all.order(created_at: :asc)
  end

  def show

  end

  def destroy
    @report.destroy
    redirect_to reports_path
  end


  private

  def find_report
    @report = Report.find(params[:id])
  end

  def report_params
     params.require(:report).permit(:month)
  end

  # def only_see_own_page
  #   @user = User.find(params[:id])
  #   if current_user != @user
  #     redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
  #   end
  # end
end
