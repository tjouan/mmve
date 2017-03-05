Given(/^my editor is "(.*?)"$/) do |editor|
  set_environment_variable 'EDITOR', editor
end
