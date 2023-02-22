module ApplicationHelper
  def date_parse(date)
    begin
      Date.parse(date)
    rescue
      'None'
    end
  end
end
