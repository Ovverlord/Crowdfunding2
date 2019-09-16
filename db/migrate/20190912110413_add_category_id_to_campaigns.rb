class AddCategoryIdToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :category_id, :integer
    add_index :campaigns, :category_id
  end
end
