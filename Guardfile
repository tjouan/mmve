guard :cucumber, cmd_additional_args: '--profile guard', all_on_start: false do
  watch %r{\Afeatures/.+\.feature\z}
  watch(%r{\Afeatures/support/.+\.rb\z})                { 'features' }
  watch(%r{\Afeatures/step_definitions/.+_steps\.rb\z}) { 'features' }
end

guard :rspec, cmd: 'rspec -f doc' do
  watch %r{\Aspec/.+_spec\.rb\z}
  watch(%r{\Alib/(.+)\.rb\z})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')    { 'spec' }
end
