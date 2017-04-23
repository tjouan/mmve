Given /^the following files exists:$/ do |paths|
  paths.raw.flatten.each { |e| write_file e, '' }
end


Then /^the following files must exist:$/ do |paths|
  paths.raw.flatten.each { |path| expect(path).to be_an_existing_file }
end

Then /^the file ([^ ]+) must not exist$/ do |path|
  expect(path).not_to be_an_existing_file
end
