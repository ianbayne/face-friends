class Post < ApplicationRecord
  include ImageUploader::Attachment.new(:image)

  after_destroy :destroy_notifications

  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, dependent: :destroy

  def date_created_at
    created_at.strftime('%A, %B %d, %Y')
  end

  def time_created_at
    created_at.strftime('%I:%M:%S %p')
  end

private

  def destroy_notifications
    Notification.where(target: self).destroy_all
  end
end
