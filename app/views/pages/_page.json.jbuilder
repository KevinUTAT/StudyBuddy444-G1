json.extract! page, :id, :name, :about_me, :created_at, :updated_at
json.url page_url(page, format: :json)
