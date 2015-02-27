Gem::Specification.new do |s|
  s.name        = 'dalli-ext-spymemcached-debug'
  s.version     = '1.0.4'
  s.date        = '2010-04-28'
  s.summary     = "Dalli server-hashing algorithm to match spymemcachedJava library."
  s.description = "Copy of dalli-ext-spymemcached, with gemspec and debug output added so I can watch the behavior"
  s.authors     = ["Jim Myhrberg, Mat Sadler, Tim Blair"]
  s.email       = ''
  s.files       = ["lib/dalli-ext-spymemcached.rb"]
  s.homepage    =
    'http://rubygems.org/gems/dalli-ext-spymemcached/versions/1.0.2'
  s.license       = 'MIT'

  s.add_development_dependency 'rake', '~> 0'
  s.add_development_dependency 'rspec', '~> 0'
  s.add_development_dependency 'simplecov', '~> 0'
  s.add_runtime_dependency 'dalli', '>= 0'
end
