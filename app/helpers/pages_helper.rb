module PagesHelper

    def profile_picture (page) 
        size = "128"
        
        if page.avatar.attached?
            image = url_for(page.avatar)
        else 
            image = asset_path('avatar-placeholder.png')
        end
        
        ('<img src="' + image + '", width="' + size + '" height="' + size + '">').html_safe
    end 
end
