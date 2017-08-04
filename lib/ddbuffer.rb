# frozen_string_literal: true

require 'ddbuffer/version'

class DDBuffer
  module Impl
    STOP_OK = Object.new
    STOP_ERR = Object.new

    def self.gen_collector_thread(enum, queue)
      Thread.new do
        begin
          enum.each { |e| queue << e }
          queue << STOP_OK
        rescue => e
          queue << STOP_ERR
          queue << e
        end
      end
    end

    def self.gen_enumerator(queue, collector_thread)
      Enumerator.new do |y|
        loop do
          e = queue.pop

          if STOP_OK.equal?(e)
            break
          elsif STOP_ERR.equal?(e)
            raise queue.pop
          end

          y << e
        end
        collector_thread.join
      end.lazy
    end
  end

  def initialize(size)
    @size = size
  end

  def call(enum)
    queue = SizedQueue.new(@size)
    thread = Impl.gen_collector_thread(enum, queue)
    Impl.gen_enumerator(queue, thread)
  end
end
