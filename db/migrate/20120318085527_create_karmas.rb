class CreateKarmas < ActiveRecord::Migration
  def change
    create_table :karmas do |t|
      t.integer :value
      t.references :karmable, :polymorphic => true

      t.timestamps
    end
  end
end
