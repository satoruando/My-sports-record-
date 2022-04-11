class Video < ApplicationRecord
  has_one_attached :video
  belongs_to :member
  has_one_attached :comment, dependent: :destroy


end
