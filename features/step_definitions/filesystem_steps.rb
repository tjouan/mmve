Given(/^the following files exists:$/) do |paths|
  paths.raw.flatten.each { |p| write_file p, '' }
end
