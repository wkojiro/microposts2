class Favorite < ActiveRecord::Base
  belongs_to :favuser
  belongs_to :favpost
end
