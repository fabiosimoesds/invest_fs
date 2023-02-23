class CompaniesController < ApplicationController
  def index
    @companies = Company.high_yield
    respond_to do |f|
      f.html
      f.csv { send_data @companies.to_csv }
    end
  end

  def list
    companies = Company.high_yield.order("#{params[:column]} #{params[:direction]}")
    render(partial: 'companies/partials/companies', locals: { companies: companies })
  end
end
