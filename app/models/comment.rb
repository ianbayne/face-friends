class Comment < ApplicationRecord
  include ImageUploader::Attachment.new(:image)

  belongs_to :user
  belongs_to :post

  def date_created_at
    created_at.strftime('%A, %B %d, %Y')
  end

  def time_created_at
    created_at.strftime('%I:%M:%S %p')
  end
end
