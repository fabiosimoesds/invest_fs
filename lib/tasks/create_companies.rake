namespace :create_companies do
  tickers = ENV['SP500'].split(',')
  puts tickers.class
  tickers.each do |ticker|
    # create the api request
    # fetch the date
    # clean the data to a nice has
    # create the company with the hash
    # delay for 16 seconds (limited to 5 reques per minute)
    # limit of 500 requests per day (make 2 days for SP)
  end
end
