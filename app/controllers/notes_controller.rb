class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_note, except: [:new, :create]
  before_action :find_report, only: [:new, :create, :edit, :update]
  before_action :set_user, only: [:new, :index, :show, :update]

  def new
    @note = Note.new
    @report = Report.find(params[:report_id])
  end

  def create
    @note = Note.new(note_params)
    @note.report = @report
    if @note.save
      redirect_to report_path(@report)
    else
      render "new"
    end
  end

  def show

  end

  def destroy
    @report = @note.report
    @note.destroy
    redirect_to report_path(@report)
  end

  def edit
  end

  def update
    @note.update(note_params)
    if @note.save
      redirect_to report_note_path(@report, @note)
    else
      render "edit"
    end
  end


  private

  def find_note
    @note = Note.find(params[:id])
  end

  def find_report
    @report = Report.find(params[:report_id])
  end

  def note_params
    params.require(:note).permit(:title, :description, :photo, :time)
  end

  def set_user
    if user_signed_in?
      @user = current_user
    end
  end
end
