class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :ticker
      t.string :asset_type
      t.string :name
      t.string :description
      t.string :cik
      t.string :exchange
      t.string :currency
      t.string :country
      t.string :sector
      t.string :industry
      t.string :address
      t.string :fiscal_year_end
      t.date :latest_quarter
      t.integer :market_cap
      t.integer :ebitida
      t.float :pe_ratio
      t.float :peg_ratio
      t.float :book_value
      t.float :dividend_per_share
      t.float :dividend_yield
      t.float :eps
      t.float :revenue_per_share_ttm
      t.float :profit_margin
      t.float :operating_margin_ttm
      t.float :return_on_assets_ttm
      t.float :return_on_equity_ttm
      t.float :revenue_ttm
      t.float :gross_profit_ttm
      t.float :diluted_eps_ttm
      t.float :quarterly_earnings_growth_yoy
      t.float :quarterly_revenue_growth_yoy
      t.float :analyst_target_price
      t.float :trailing_pe
      t.float :forward_pe
      t.float :price_to_sales_ratio_ttm
      t.float :price_to_book_ratio
      t.float :ev_to_revenue
      t.float :ev_to_ebitda
      t.float :beta
      t.float :fifty_two_weeks_high
      t.float :fifty_two_weeks_low
      t.float :fifty_day_moving_avg
      t.float :two_hundred_day_moving_avg
      t.integer :shares_outstanding
      t.date :dividend_date
      t.date :ex_dividend_date

      t.timestamps
    end
  end
end
