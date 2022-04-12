class Video < ApplicationRecord
  has_one_attached :video
  belongs_to :member
  has_many :comments, dependent: :destroy
  belongs_to :genre
  
  has_many :nices, dependent: :destroy

  def niced_by?(member)
    nices.exists?(member_id: member.id)
  end
end
