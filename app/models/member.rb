class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アプリケーションを完成させよう2 14章
  has_one_attached :video
  has_one_attached :image
  #コメント機能
  has_many :comments, dependent: :destroy
  #いいね機能
  has_many :nices, dependent: :destroy

  def get_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end

  #検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @member = Member.where("last_name LIKE?", "#{word}")
    elsif search == "forward_match"
      @member = Member.where("last_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @member = Member.where("last_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @member = Member.where("last_name LIKE?","%#{word}%")
    else
      @member = Member.all
    end
  end

  #ゲストログイン機能
  def self.guest
    find_or_create_by!(last_name: 'ゲスト' ,email: 'guest@example.com') do |member|
      member.password = SecureRandom.urlsafe_base64
      member.last_name = "ゲスト"
      member.first_name = "太郎"
      member.last_name_kana = "ゲスト"
      member.first_name_kana = "タロウ"
      member.email = "guest@example.com"

    end
  end

end
