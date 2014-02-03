class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.belongs_to :user, index: true
      t.belongs_to :intention, index: true

      t.timestamps
    end
  end
end
