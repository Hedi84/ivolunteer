class ReportsController < ApplicationController
  before_action :find_report, only: [:show, :delete]
  before_action :set_user, only: [:new, :index, :show]


  def new
    @report = Report.new
  end

  def create
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
    @notes = @report.notes

    time = []
    @notes.each do |note|
      time << note.time.to_f
      @time = time.inject(0){|sum,x| sum + x }
    end
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

  def set_user
    if user_signed_in?
     @user = current_user
   end
  end
end
