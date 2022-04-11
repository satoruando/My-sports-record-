class Video < ApplicationRecord
  has_one_attached :video
  belongs_to :member
  has_many :comments, dependent: :destroy
  belongs_to :genre


end
