class ReportsController < ApplicationController
  before_action :find_report, only: [:show, :delete]


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
end
