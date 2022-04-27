class Video < ApplicationRecord
  has_one_attached :video
  has_one_attached :image

  belongs_to :member
  has_many :comments, dependent: :destroy
  belongs_to :genre
  has_many :nices, dependent: :destroy

  validates :title, presence: true
  validates :explanation, presence: true
  validates :video, presence: true
  #サイズバリデーション
  validate :size_validation
  #ビデオタイプバリデーション
  validate :video_type

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

  #サイズバリデーション
  def size_validation
    if video.present?
      errors.add(:video,'の容量が大きいです') if video.blob.byte_size > 200.megabytes#約２分
    end
  end

  #ビデオタイプバリデーション
  def video_type
    if video.blob.content_type != "video/mp4"
      errors.add(:videos, 'はmp4形式でアップロードしてください')
    end
  end

end
