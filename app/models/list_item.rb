class ListItem < ActiveRecord::Base
  belongs_to :list
  has_one :karma, :as => :karmable

  after_create :create_karma

  def create_karma
    self.karma = Karma.new()
  end
end
