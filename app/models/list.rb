class List < ActiveRecord::Base
  belongs_to :user
  has_one :karma, :as => :karmable
  has_many :list_items

  after_create :create_karma

  def create_karma
    self.karma = Karma.new()
  end
end
