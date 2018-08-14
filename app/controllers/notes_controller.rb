class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_note, except: [:new, :create]

  def new
    @note = Note.new
    @report = Report.find(params[:report_id])
  end

  def create
    @note = Note.new(note_params)
    @report = Report.find(params[:report_id])
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
    @note.update(note_params)
    if @note.save
      redirect_to note_path(@note)
    else
      render "edit"
    end
  end


  private

  def find_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :description)
  end
end
