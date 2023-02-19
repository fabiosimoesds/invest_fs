class ChangeIntegerLimitInCompany < ActiveRecord::Migration[7.0]
  def change
    change_column :companies, :market_cap, :integer, limit: 8
  end
end
