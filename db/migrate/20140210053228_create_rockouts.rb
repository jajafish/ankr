class CreateRockouts < ActiveRecord::Migration
  def change
    create_table :rockouts do |t|
      t.belongs_to :band, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
