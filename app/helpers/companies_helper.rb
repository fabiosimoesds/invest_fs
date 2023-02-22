module CompaniesHelper
  def sort_link(column:, label:)
    link_to(label, list_companies_path(column: column), class: 'text-white text-decoration-none')
  end
end