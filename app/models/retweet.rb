class Retweet < ActiveRecord::Base
  belongs_to :retweetuser,class_name: "User"
  belongs_to :retweetpost,class_name: "Micropost"
  validates :retweetcontent, length: { maximum: 100 }
  validates :retweetuser_id, presence: true
  validates :retweetpost_id, presence: true  
end
