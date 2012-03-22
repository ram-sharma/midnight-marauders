class List < ActiveRecord::Base
  belongs_to :user
  has_one :karma, :as => :karmable
  has_many :list_items
end
