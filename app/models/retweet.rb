class Retweet < ActiveRecord::Base
 validates :retweetuser_id, presence: true
 validates :retweetpost_id, presence: true  
  belongs_to :retweetuser,class_name: "User"
  belongs_to :retweetpost,class_name: "Micropost"
end
