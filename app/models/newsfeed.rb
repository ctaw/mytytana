class Newsfeed < ActiveRecord::Base

  ## For Paperclip (uploading photos)
  # has_attached_file :photo, {
  #   :default_url => "missing.png",
  #   :path => "assets/:id/:basename.:extension"
  # }.merge(PAPERCLIP_STORAGE_OPTIONS)

  # validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  
end
