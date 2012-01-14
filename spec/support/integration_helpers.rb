module IntegrationHelpers
  def navigate_to(name)
    within("#header nav") do
      click_on name
    end
  end
end
