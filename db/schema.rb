# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_19_161349) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "ticker"
    t.string "asset_type"
    t.string "name"
    t.string "description"
    t.string "cik"
    t.string "exchange"
    t.string "currency"
    t.string "country"
    t.string "sector"
    t.string "industry"
    t.string "address"
    t.string "fiscal_year_end"
    t.date "latest_quarter"
    t.bigint "market_cap"
    t.bigint "ebitida"
    t.float "pe_ratio"
    t.float "peg_ratio"
    t.float "book_value"
    t.float "dividend_per_share"
    t.float "dividend_yield"
    t.float "eps"
    t.float "revenue_per_share_ttm"
    t.float "profit_margin"
    t.float "operating_margin_ttm"
    t.float "return_on_assets_ttm"
    t.float "return_on_equity_ttm"
    t.float "revenue_ttm"
    t.float "gross_profit_ttm"
    t.float "diluted_eps_ttm"
    t.float "quarterly_earnings_growth_yoy"
    t.float "quarterly_revenue_growth_yoy"
    t.float "analyst_target_price"
    t.float "trailing_pe"
    t.float "forward_pe"
    t.float "price_to_sales_ratio_ttm"
    t.float "price_to_book_ratio"
    t.float "ev_to_revenue"
    t.float "ev_to_ebitda"
    t.float "beta"
    t.float "fifty_two_weeks_high"
    t.float "fifty_two_weeks_low"
    t.float "fifty_day_moving_avg"
    t.float "two_hundred_day_moving_avg"
    t.bigint "shares_outstanding"
    t.date "dividend_date"
    t.date "ex_dividend_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
