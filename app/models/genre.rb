class Genre < ApplicationRecord

  has_many :videos

  validates :genre_name, presence: true

end
