class PagesController < ApplicationController
  def home
    # https://www.alphavantage.co/documentation/   -   5 API request per minute and 500 per day
  end
end


# How the data is displayed

#  {
#   "Symbol": "AAP",
#   "AssetType": "Common Stock",
#   "Name": "Advance Auto Parts Inc",
#   "Description": "Advance Auto Parts, Inc. (Advance) is an American automotive aftermarket parts provider. Headquartered in Raleigh, North Carolina, it serves both professional installer and do-it-yourself (DIY) customers.",
#   "CIK": "1158449",
#   "Exchange": "NYSE",
#   "Currency": "USD",
#   "Country": "USA",
#   "Sector": "TRADE & SERVICES",
#   "Industry": "RETAIL-AUTO & HOME SUPPLY STORES",
#   "Address": "2635 EAST MILLBROOK ROAD, RALEIGH, NC, US",
#   "FiscalYearEnd": "December",
#   "LatestQuarter": "2022-09-30",
#   "MarketCapitalization": "9017821000",
#   "EBITDA": "1012869000",
#   "PERatio": "19.51",
#   "PEGRatio": "0.909",
#   "BookValue": "45.86",
#   "DividendPerShare": "5.5",
#   "DividendYield": "0.0395",
#   "EPS": "7.8",
#   "RevenuePerShareTTM": "181.3",
#   "ProfitMargin": "0.043",
#   "OperatingMarginTTM": "0.0661",
#   "ReturnOnAssetsTTM": "0.0382",
#   "ReturnOnEquityTTM": "0.161",
#   "RevenueTTM": "11077951000",
#   "GrossProfitTTM": "4931356000",
#   "DilutedEPSTTM": "7.8",
#   "QuarterlyEarningsGrowthYOY": "-0.313",
#   "QuarterlyRevenueGrowthYOY": "0.008",
#   "AnalystTargetPrice": "165.16",
#   "TrailingPE": "19.51",
#   "ForwardPE": "11.03",
#   "PriceToSalesRatioTTM": "0.766",
#   "PriceToBookRatio": "3.13",
#   "EVToRevenue": "1.077",
#   "EVToEBITDA": "12.61",
#   "Beta": "1.128",
#   "52WeekHigh": "225.01",
#   "52WeekLow": "138.52",
#   "50DayMovingAverage": "148.4",
#   "200DayMovingAverage": "173.04",
#   "SharesOutstanding": "59254000",
#   "DividendDate": "2023-01-03",
#   "ExDividendDate": "2022-12-15"
#   }
