# frozen_string_literal: true

require 'ddbuffer/version'

require 'slow_enumerator_tools'

class DDBuffer
  def initialize(size)
    @size = size
  end

  def call(enum)
    SlowEnumeratorTools.buffer(enum, @size)
  end
end
