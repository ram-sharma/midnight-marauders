class ListItem < ActiveRecord::Base
  belongs_to :list
  has_one :karma, :as => :karmable
end
