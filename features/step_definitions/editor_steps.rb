Given(/^my editor is "(.*?)"$/) do |editor|
  set_env('EDITOR', editor)
end
