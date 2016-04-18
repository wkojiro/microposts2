class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :microposts


#命名ルールが不明　
#following_relationships　は User1 が followしているユーザー対応表をたくさん持っていて、そこからユーザーを紐付ける
#follower_relationships　は、User1　を followしているユーザー対応表をたくさん持っていて、そこからユーザーを紐付ける
#という意味かな？
  
  has_many :following_relationships, class_name: "Relationship",
                                     foreign_key: "follower_id",
                                     dependent: :destroy
  has_many :following_users, through: :following_relationships, source: :followed
  
  has_many :follower_relationships, class_name:  "Relationship",
                                    foreign_key: "followed_id",
                                    dependent:   :destroy
  has_many :follower_users, through: :follower_relationships, source: :follower  
  
  has_many :favorites, class_name: "Favorite",
                       foreign_key: "favuser_id",
                       dependent: :destroy
                  
  has_many :favposts, through: :favorites, source: :favpost
  
                      

  # 他のユーザーをフォローする(他のユーザーのIDを取得している？)
  def follow(other_user)
    following_relationships.find_or_create_by(followed_id: other_user.id)
  end

  # フォローしているユーザーをアンフォローする
  def unfollow(other_user)
    following_relationship = following_relationships.find_by(followed_id: other_user.id)
    following_relationship.destroy if following_relationship
  end

  # あるユーザーをフォローしているかどうか？
  def following?(other_user)
    following_users.include?(other_user)
  end

  def feed_items
    Micropost.where(user_id: following_user_ids + [self.id])
  end  


  # あるPostをお気に入りにする(引数には、マイクロポストが来るべきかも。)
  def favorite(micropost)
    favorites.find_or_create_by(favpost_id: micropost.id)
  end

  # あるPostをお気に入りから解除する これだと何となく、favpost.idだけが消えてしまう！？。関係そのものを消すには、本来的にはfavorite.idを削除すべき！？userが引数に来ているからこれでもいいのかな？
  def unfavorite(micropost)
    favorites.find_by(id).destroy
  end
  
  def favorite?(micropost)
    favposts.include?(micropost)
  end

end
