class Favorite < ActiveRecord::Base
  belongs_to :favuser,class_name: "User"
  belongs_to :favpost,class_name: "Micropost"
end
