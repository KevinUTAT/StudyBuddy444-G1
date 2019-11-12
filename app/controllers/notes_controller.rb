class NotesController < ApplicationController
    before_action :find_note, only: [:show, :edit, :update, :destroy]
    # only signed in can create notes
    before_action :authenticate_user!, except: [:index, :show]
    before_action :require_permission, only: [:edit, :update, :destroy]
    
    
    def index
        #@notes = Note.search(params[:search]).order("course ASC, title DESC")
        if Note.search(params[:search])
            @notes = Note.search(params[:search]).order("created_at DESC")
        else
            @notes = Note.order("created_at DESC")
        end
    end
    
    def show
        @note = Note.find(params[:id])
    end
    
    def new
        # user has_many notes
        # @note = Note.new
        @note = current_user.notes.build
    end
    
    def create
        @note = current_user.notes.build(note_params)
        
        if @note.save
            redirect_to @note
        else
            render 'new'
        end
    end
    
    def edit
        @note = find_note
    end
    
    def update
        if @note.update(note_params)
            redirect_to @note
        else
            render 'edit'
        end
    end
    
    def destroy
        @note.destroy
        redirect_to notes_url
    end
    
    
    private
    
    def find_note
        @note = Note.find(params[:id])
    end
    
    
    def note_params
        params.require(:note).permit(:title, :course, :content, :attachments, :search)
    end
    
    def require_permission
        if current_user != Note.find(params[:id]).user
            redirect_to notes_url
        end
    end
end
