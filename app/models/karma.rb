class Karma < ActiveRecord::Base
  belongs_to :karmable, :polymorphic => true
end
