class NotesController < ApplicationController
    before_action :find_note, only: [:show, :edit, :update, :destroy]
    # only signed in can create notes
    before_action :authenticate_user!, except: [:index, :show]
    before_action :require_permission, only: [:edit, :update, :destroy]
    
    
    def index
        sort_order = sort_column + " " + sort_direction
        
        @notes = Note.order(sort_order)
        
        if Note.search(params[:search])
            #@notes = Note.search(params[:search]).order("created_at DESC")
            @notes = @notes.search(params[:search])
        end
        if Note.searchEmail(params[:searchEmail])
            @notes = @notes.searchEmail(params[:searchEmail])
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

    #voting system
    def like
        @note = Note.find(params[:id])
        @note.liked_by current_user
        if @note.vote_registered? == true
            flash[:notice] = "Successfully liked this note."
        else
            flash[:notice] = "You have already liked this note."
        end
        redirect_back(fallback_location: root_path)
    end
    def unlike
        @note = Note.find(params[:id])
        @note.unliked_by current_user
        if @note.vote_registered? == false
            flash[:notice] = "Successfully unliked this note."
        else
            flash[:notice] = "You cannot unlike this note."
        end
        redirect_back(fallback_location: root_path)
    end

    def dislike
        @note = Note.find(params[:id])
        @note.disliked_by current_user
        if @note.vote_registered? == true
            flash[:notice] = "Successfully disliked this note."
            else
            flash[:notice] = "You have already disliked this note."
        end
        redirect_back(fallback_location: root_path)
    end
    def undislike
        @note = Note.find(params[:id])
        @note.undisliked_by current_user
        if @note.vote_registered? == false
            flash[:notice] = "Successfully undisliked this note."
            else
            flash[:notice] = "You cannot undislike this note."
        end
        redirect_back(fallback_location: root_path)
    end
    
    # Buy me a coffee
    def donate
        @note = Note.find(params[:noteid])
    end

    
    private
    
    def find_note
        @note = Note.find(params[:id])
    end
    
    
    def note_params
        params.require(:note).permit(:title, :course, :prof, :content, :search, :searchName, :searchEmail, attachments: [])
    end
    
    def require_permission
        if current_user != Note.find(params[:id]).user
            redirect_to notes_url
        end
    end
    
    def sort_column
        params[:sort] || "created_at"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end
