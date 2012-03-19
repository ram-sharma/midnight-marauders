class User < ActiveRecord::Base
  validates_length_of :username, :within => 3..20
  validates_length_of :pass, :within => 3..20
  validates_uniqueness_of :username

  has_one :karma, :as => :karmable
end
