class Post < ApplicationRecord
  include ImageUploader::Attachment.new(:image)

  belongs_to :user
  has_many :likes, dependent: :destroy

  def date_created_at
    created_at.strftime('%A, %B %d, %Y')
  end

  def time_created_at
    created_at.strftime('%I:%M:%S %p')
  end
end
