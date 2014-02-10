class AddCategoryToIntention < ActiveRecord::Migration
  def change
    add_column :intentions, :category, :string
  end
end
