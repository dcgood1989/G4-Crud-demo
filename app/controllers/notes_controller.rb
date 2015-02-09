class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def show
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new(note_params)
    @note.save
    redirect_to note_path(@note),
    notice: "Your note was successfully updated"
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
    redirect_to note_path
    else
      render :edit
    end
  end
  def destroy
    note = Note.find(params[:id])
    note.destroy
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:date, :location, :description, :capacity, :requires_id)
  end
end
