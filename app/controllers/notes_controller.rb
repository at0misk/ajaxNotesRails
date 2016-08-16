class NotesController < ApplicationController
	def index
		@notes = Note.all
	end
	def create
		@note = Note.new(note_params)
		if @note.save
		respond_to do |format|
		format.html { render json: @note, status: :created }
	    format.json { render json: @note, status: :created }
	    format.js { head :ok }
		end
		end
	end
	def update
		@note = Note.update(params[:id], note_params)
		respond_to do |format|
		format.html { render json: @note, status: :created }
	    format.json { render json: @note, status: :created }
	    format.js { head :ok }
    	end
	end
	def notesDiv
		@note = Note.find(params[:id])
		render :partial => "notesDiv", :layout => false
	end
	def note_params
		params.require(:note).permit(:title, :description)
	end
	def destroy
		Note.find(params[:id]).destroy
    	respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
	end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end