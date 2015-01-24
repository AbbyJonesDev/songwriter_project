module Admin::DashboardHelper
  def date_to_s(date)
    date.strftime("%B %d, %Y")
  end
end
