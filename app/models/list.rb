class List < ActiveRecord::Base
  belongs_to :user
  has_one :karma, :as => :karmable, :dependent => :destroy
  has_many :list_items, :dependent => :destroy


  after_create :create_karma

  def create_karma
    self.karma = Karma.new()
  end
end
