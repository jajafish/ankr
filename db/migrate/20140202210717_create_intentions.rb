class CreateIntentions < ActiveRecord::Migration
  def change
    create_table :intentions do |t|
      t.string :name

      t.timestamps
    end
  end
end
