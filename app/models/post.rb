class Post < ApplicationRecord
  include ImageUploader::Attachment.new(:image)

  belongs_to :user
  has_many :likes, dependent: :destroy
end
