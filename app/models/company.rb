# t.string :ticker
# t.string :asset_type
# t.string :name
# t.string :description
# t.string :cik
# t.string :exchange
# t.string :currency
# t.string :country
# t.string :sector
# t.string :industry
# t.string :address
# t.string :fiscal_year_end
# t.date :latest_quarter
# t.integer :market_cap
# t.integer :ebitida
# t.float :pe_ratio
# t.float :peg_ratio
# t.float :book_value
# t.float :dividend_per_share
# t.float :dividend_yield
# t.float :eps
# t.float :revenue_per_share_ttm
# t.float :profit_margin
# t.float :operating_margin_ttm
# t.float :return_on_assets_ttm
# t.float :return_on_equity_ttm
# t.float :revenue_ttm
# t.float :gross_profit_ttm
# t.float :diluted_eps_ttm
# t.float :quarterly_earnings_growth_yoy
# t.float :quarterly_revenue_growth_yoy
# t.float :analyst_target_price
# t.float :trailing_pe
# t.float :forward_pe
# t.float :price_to_sales_ratio_ttm
# t.float :price_to_book_ratio
# t.float :ev_to_revenue
# t.float :ev_to_ebitda
# t.float :beta
# t.float :fifty_two_weeks_high
# t.float :fifty_two_weeks_low
# t.float :fifty_day_moving_avg
# t.float :two_hundred_day_moving_avg
# t.integer :shares_outstanding
# t.date :dividend_date
# t.date :ex_dividend_date

class Company < ApplicationRecord
  has_many :company_list

  def get_data
  end

  def self.create_companies
    api_key = ENV['SECOND_API_KEY']

    @new_companies.each do |ticker|
    # ['IBM'].each do |ticker|
      url = "https://www.alphavantage.co/query?function=OVERVIEW&symbol=#{ticker}&apikey=#{api_key}"
      p url
      company_serialized = URI.open(url).read
      company_hash = JSON.parse(company_serialized)
      # Create a company
      if company_hash.present?
        company = Company.new(
          ticker: company_hash['Symbol'],
          asset_type: company_hash['AssetType'],
          name: company_hash['Name'],
          description: company_hash['Description'],
          cik: company_hash['CIK'],
          exchange: company_hash['Exchange'],
          currency: company_hash['Currency'],
          country: company_hash['Country'],
          sector: company_hash['Sector'],
          industry: company_hash['Industry'],
          address: company_hash['Address'],
          fiscal_year_end: company_hash['FiscalYearEnd'],
          latest_quarter: ApplicationController.helpers.date_parse(company_hash['LatestQuarter']), # Date
          market_cap: company_hash['MarketCapitalization'].to_i,
          ebitida: company_hash['EBITDA'].to_i,
          pe_ratio: company_hash['PERatio'].to_f,
          peg_ratio: company_hash['PEGRatio'].to_f,
          book_value: company_hash['BookValue'].to_f,
          dividend_per_share: company_hash['DividendPerShare'].to_f,
          dividend_yield: company_hash['DividendYield'].to_f,
          eps: company_hash['EPS'].to_f,
          revenue_per_share_ttm: company_hash['RevenuePerShareTTM'].to_f,
          profit_margin: company_hash['ProfitMargin'].to_f,
          operating_margin_ttm: company_hash['OperatingMarginTTM'].to_f,
          return_on_assets_ttm: company_hash['ReturnOnAssetsTTM'].to_f,
          return_on_equity_ttm: company_hash['ReturnOnEquityTTM'].to_f,
          revenue_ttm: company_hash['RevenueTTM'].to_f,
          gross_profit_ttm: company_hash['GrossProfitTTM'].to_f,
          diluted_eps_ttm: company_hash['DilutedEPSTTM'].to_f,
          quarterly_earnings_growth_yoy: company_hash['QuarterlyEarningsGrowthYOY'].to_f,
          quarterly_revenue_growth_yoy: company_hash['QuarterlyRevenueGrowthYOY'].to_f,
          analyst_target_price: company_hash['AnalystTargetPrice'].to_f,
          trailing_pe: company_hash['TrailingPE'].to_f,
          forward_pe: company_hash['ForwardPE'].to_f,
          price_to_sales_ratio_ttm: company_hash['PriceToSalesRatioTTM'].to_f,
          price_to_book_ratio: company_hash['PriceToBookRatio'].to_f,
          ev_to_revenue: company_hash['EVToRevenue'].to_f,
          ev_to_ebitda: company_hash['EVToEBITDA'].to_f,
          beta: company_hash['Beta'].to_f,
          fifty_two_weeks_high: company_hash['52WeekHigh'].to_f,
          fifty_two_weeks_low: company_hash['52WeekLow'].to_f,
          fifty_day_moving_avg: company_hash['50DayMovingAverage'].to_f,
          two_hundred_day_moving_avg: company_hash['200DayMovingAverage'].to_f,
          shares_outstanding: company_hash['SharesOutstanding'].to_i,
          dividend_date: ApplicationController.helpers.date_parse(company_hash['DividendDate']), # date
          ex_dividend_date: ApplicationController.helpers.date_parse(company_hash['ExDividendDate']), # date
        )

        # I need to create a method to handle the erro for Date.parse and do something.
        company.save!
      end
      sleep(13) # limit of call 5 per minute and 500 per day, that is why we need the sleep.
    end
  end

  def self.update_data
    api_key = ENV['API_KEY']

    Company.all[0..250].each do |company|
      url = "https://www.alphavantage.co/query?function=OVERVIEW&symbol=#{company.ticker}&apikey=#{api_key}"
      company_serialized = URI.open(url).read
      company_hash = JSON.parse(company_serialized)
      if company_hash.present?
        company.update(
          ticker: company_hash['Symbol'],
          asset_type: company_hash['AssetType'],
          name: company_hash['Name'],
          description: company_hash['Description'],
          cik: company_hash['CIK'],
          exchange: company_hash['Exchange'],
          currency: company_hash['Currency'],
          country: company_hash['Country'],
          sector: company_hash['Sector'],
          industry: company_hash['Industry'],
          address: company_hash['Address'],
          fiscal_year_end: company_hash['FiscalYearEnd'],
          latest_quarter: ApplicationController.helpers.date_parse(company_hash['LatestQuarter']),
          market_cap: company_hash['MarketCapitalization'].to_i,
          ebitida: company_hash['EBITDA'].to_i,
          pe_ratio: company_hash['PERatio'].to_f,
          peg_ratio: company_hash['PEGRatio'].to_f,
          book_value: company_hash['BookValue'].to_f,
          dividend_per_share: company_hash['DividendPerShare'].to_f,
          dividend_yield: company_hash['DividendYield'].to_f,
          eps: company_hash['EPS'].to_f,
          revenue_per_share_ttm: company_hash['RevenuePerShareTTM'].to_f,
          profit_margin: company_hash['ProfitMargin'].to_f,
          operating_margin_ttm: company_hash['OperatingMarginTTM'].to_f,
          return_on_assets_ttm: company_hash['ReturnOnAssetsTTM'].to_f,
          return_on_equity_ttm: company_hash['ReturnOnEquityTTM'].to_f,
          revenue_ttm: company_hash['RevenueTTM'].to_f,
          gross_profit_ttm: company_hash['GrossProfitTTM'].to_f,
          diluted_eps_ttm: company_hash['DilutedEPSTTM'].to_f,
          quarterly_earnings_growth_yoy: company_hash['QuarterlyEarningsGrowthYOY'].to_f,
          quarterly_revenue_growth_yoy: company_hash['QuarterlyRevenueGrowthYOY'].to_f,
          analyst_target_price: company_hash['AnalystTargetPrice'].to_f,
          trailing_pe: company_hash['TrailingPE'].to_f,
          forward_pe: company_hash['ForwardPE'].to_f,
          price_to_sales_ratio_ttm: company_hash['PriceToSalesRatioTTM'].to_f,
          price_to_book_ratio: company_hash['PriceToBookRatio'].to_f,
          ev_to_revenue: company_hash['EVToRevenue'].to_f,
          ev_to_ebitda: company_hash['EVToEBITDA'].to_f,
          beta: company_hash['Beta'].to_f,
          fifty_two_weeks_high: company_hash['52WeekHigh'].to_f,
          fifty_two_weeks_low: company_hash['52WeekLow'].to_f,
          fifty_day_moving_avg: company_hash['50DayMovingAverage'].to_f,
          two_hundred_day_moving_avg: company_hash['200DayMovingAverage'].to_f,
          shares_outstanding: company_hash['SharesOutstanding'].to_i,
          dividend_date: ApplicationController.helpers.date_parse(company_hash['DividendDate']),
          ex_dividend_date: ApplicationController.helpers.date_parse(company_hash['ExDividendDate'])
        )
      end
      sleep(13)
    end
  end

  def self.high_yield
    Company.where('dividend_yield > 0.04')
  end

  def self.to_csv
    attributes = %w[ticker name sector dividend_yield]
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |company|
        csv << company.attributes.values_at(*attributes)
      end
    end
  end
end
