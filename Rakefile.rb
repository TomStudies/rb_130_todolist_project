require "rake/testtask"
require 'find'
require 'bundler/gem_tasks'

desc 'Say hello'
task :hello do
  puts "Hello there. This is the 'hello' task."
end

desc 'Run tests'
task :default => :test

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

desc 'List project files'
task :listfiles do
  files = []
  Find.find('.') do |path|
    next if path.include?('/.')
    files << path if File.file?(path)
  end
  puts files
end