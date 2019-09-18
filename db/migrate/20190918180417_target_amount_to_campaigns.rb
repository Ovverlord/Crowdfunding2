class TargetAmountToCampaigns < ActiveRecord::Migration[5.2]
  def change
  	add_column :campaigns, :target_amount, :integer
  end
end
