When /^I bypass the javascript dialog on the next step$/ do
  page.evaluate_script('window.confirm = function() { return true; }')
  page.evaluate_script('window.alert = function() { return true; }')
end
