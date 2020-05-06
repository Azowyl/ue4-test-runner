begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

desc 'build gem'
task :build_gem do
  sh "gem build ue4-test-runner.gemspec"
end