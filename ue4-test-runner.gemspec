Gem::Specification.new do |s|
  s.name      = 'ue4-test-runner'
  s.version   = '0.0.0'
  s.platform  = Gem::Platform::RUBY
  s.summary   = 'Command line tool for running ue4 test with a nice print'
  s.authors   = ['Facundo Gerstner']
  s.email     = ['facugerstner29@gmail.com']
  s.homepage  = 'http://rubygems.org/gems/ue4-test-runner'
  s.files     = Dir.glob("{lib,bin}/**/*")
  s.require_path = 'lib'
end
