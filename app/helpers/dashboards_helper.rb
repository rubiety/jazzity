module DashboardsHelper
  def link_to_search_example(name)
    link_to name, search_path(u(name))
  end
end
