module NotesHelper
    #sorting
    def togglesort(column, title = nil)
        title = title || column.titleize
        if column == "title" || column == "course"
            direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
        else
            direction = (column == params[:sort] && params[:direction] == "desc") ? "asc" : "desc"
        end
        link_to title, :sort => column, :direction => direction
    end
end
