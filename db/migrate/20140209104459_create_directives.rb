class CreateDirectives < ActiveRecord::Migration
  def change
    create_table :directives do |t|
      t.belongs_to :intention, index: true
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
