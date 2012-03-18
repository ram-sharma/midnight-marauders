class List < ActiveRecord::Base
  belongs_to :user
  has_one :karma, :as => :karmable
end
