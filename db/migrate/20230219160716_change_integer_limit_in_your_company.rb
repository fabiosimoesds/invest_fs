class ChangeIntegerLimitInYourCompany < ActiveRecord::Migration[7.0]
  def change
    change_column :companies, :ebitida, :integer, limit: 8
    change_column :companies, :shares_outstanding, :integer, limit: 8
  end
end
