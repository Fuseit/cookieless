require 'rubygems'
require 'bundler/setup'
require 'bundler'

require 'bundler/gem_tasks'
Bundler.with_clean_env do
  require 'appraisal'
end

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << %w(lib test)
  t.test_files = FileList['test/**/*_test.rb']
end

task :default => :test
