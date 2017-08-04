# frozen_string_literal: true

require 'ddbuffer'

require 'fuubar'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.fuubar_progress_bar_options = {
    format: '%c/%C |<%b>%i| %p%%',
  }
end
