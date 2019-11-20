module NotesHelper
    #sorting
    def togglesort(column, title = nil)
        title = title || column.titleize
        direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
        link_to title, :sort => column, :direction => direction
    end
end
