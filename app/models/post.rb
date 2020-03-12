class Post < ApplicationRecord


attr_accessor :search_title

def search
  Post.ransack(title_eq: @search_title).result
end


  mount_uploader :image, ImageUploader
  belongs_to :user
end
