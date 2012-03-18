class User < ActiveRecord::Base
  has_one :karma, :as => :karmable
end
