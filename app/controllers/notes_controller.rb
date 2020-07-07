class NotesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show] #used devise method for authenticate user routes

  #get /notes
  def index
    @notes = Note.all
  end

  #get /notes/:id
  def show
    @note = Note.find(params[:id])
  end

  #get /notes/new
  def new
    @note = Note.new
  end

  #post /notes
  def create
    @note = current_user.notes.new(title: params[:note][:title], body: params[:note][:body]) #Put current user at foreign key
    if @note.save()
      redirect_to @note
    else 
      render :new #use new view with this variable class
    end
  end

  #delete /notes/:id
  def destroy
   @note = Note.find(params[:id])
   @note.destroy #delete object of db
   redirect_to notes_path
  end

  #get /notes/:id/edit
  def edit
    @note = Note.find(params[:id])
  end

  #put /notes/:id/update
  def update
    @note = Note.find(params[:id])
    if @note.update(title: params[:note][:title], body: params[:note][:body])
      redirect_to @note
    else
      render :edit 
    end
  end
end
