# frozen_string_literal: true

require 'rubygems'
require 'bundler'
Bundler.setup

task default: :test

desc 'Run all tests'
task :test do
  require 'rake/testtask'
  Rake::TestTask.new do |t|
    t.test_files = FileList[File.join('test', '**', '*_test.rb')]
  end
end
