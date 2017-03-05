Given /^the following files exists:$/ do |paths|
  paths.raw.flatten.each { |e| write_file e, '' }
end
