class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum:140}

#favorite  
  has_many :favorites, class_name: "Favorite",
                       foreign_key: "favpost_id",
                       dependent: :destroy
                  
  has_many :favusers, through: :favorites, source: :favuser  

#retweet
  has_many :retweets, class_name: "Retweet",
                       foreign_key: "retweetpost_id",
                       dependent: :destroy
                  
  has_many :retweetusers, through: :retweets, source: :retweetuser  
  
end
