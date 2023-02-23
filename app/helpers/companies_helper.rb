module CompaniesHelper
  def sort_link(column:, label:)
    if column == params[:column]
      link_to(label, list_companies_path(column: column, direction: change_direction), class: 'text-white text-decoration-none')
    else
      link_to(label, list_companies_path(column: column, direction: 'asc'), class: 'text-white text-decoration-none')
    end
  end

  def change_direction
    params[:direction] == 'asc' ? 'desc' : 'asc'
  end

  def sort_indicator
    tag.span(class: "sort sort-#{params[:direction]}")
  end
end