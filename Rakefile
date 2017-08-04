# frozen_string_literal: true

require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require 'rake/testtask'

RuboCop::RakeTask.new(:rubocop)

RSpec::Core::RakeTask.new(:spec) do |t|
  t.verbose = false
end

task test: %i[spec rubocop]

task default: :test
