class Favorite < ActiveRecord::Base
# validates :favuser_id, presence: true
# validates :favpost_id, presence: true
  belongs_to :favuser,class_name: "User"
  belongs_to :favpost,class_name: "Micropost"
end
