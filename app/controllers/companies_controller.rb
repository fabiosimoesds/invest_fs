class CompaniesController < ApplicationController
  def index
    @companies = Company.high_yield
  end

  def list
    companies = Company.high_yield.order("#{params[:column]} #{params[:direction]}")
    render(partial: 'companies/partials/companies', locals: { companies: companies })
  end
end
