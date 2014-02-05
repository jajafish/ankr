class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.belongs_to :word, index: true
      t.belongs_to :intention, index: true

      t.timestamps
    end
  end
end
