class User < ActiveRecord::Base
  validates_length_of :username, :within => 3..20
  validates_length_of :password, :within => 3..20
  validates_uniqueness_of :username

  has_one :karma, :as => :karmable
  has_many :lists

  def self.login (user)
    u = User.find_by_username user[:username]
    u and u.password == user[:password] and u
  end
end
