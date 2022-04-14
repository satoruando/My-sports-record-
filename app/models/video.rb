class Video < ApplicationRecord
  has_one_attached :video
  belongs_to :member
  has_many :comments, dependent: :destroy
  belongs_to :genre

  has_many :nices, dependent: :destroy

  def niced_by?(member)
    nices.exists?(member_id: member.id)
  end

  # 検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @video = Video.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @video = Video.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @video = Video.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @video = Video.where("title LIKE?","%#{word}%")
    else
      @video = Video.all
    end
  end

end
