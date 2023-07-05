class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  has_many :following_users, class_name:"Relationship", foreign_key:"follower_id", dependent: :destroy
  has_many :follower_users, class_name:"Relationship", foreign_key:"followed_id", dependent: :destroy

  has_many :follows, through: :following_users, source: :followed
  has_many :followers, through: :follower_users, source: :follower

  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }


  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  # フォローしたときの処理
  def follow(user_id)
    following_users.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    following_users.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    follows.include?(user)
  end
end