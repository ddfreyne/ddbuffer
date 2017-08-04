# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DDBuffer do
  it 'has a version number' do
    expect(DDBuffer::VERSION).not_to be nil
  end

  describe '.new + #call' do
    subject { described_class.new(size).call(enum) }

    let(:enum) { [] }
    let(:size) { 10 }

    context 'empty array' do
      example do
        expect(subject.to_a).to eq([])
      end
    end

    context 'small array' do
      let(:enum) { [1, 2, 3] }

      example do
        expect(subject.to_a).to eq([1, 2, 3])
      end
    end

    context 'infinite array' do
      let(:enum) { (1..(1.0 / 0)) }

      example do
        expect(subject.take(3).to_a).to eq([1, 2, 3])
      end
    end

    context 'error in taken elements' do
      let(:enum) do
        Enumerator.new do |y|
          y << 1
          y << 2
          raise 'boom'
        end
      end

      it 'does not raise right away' do
        subject
      end

      it 'does not raise when only taken' do
        subject.take(3)
      end

      it 'raises when evaluated' do
        expect { subject.take(3).to_a }
          .to raise_error(RuntimeError, 'boom')
      end
    end

    context 'error past taken elements' do
      let(:enum) do
        Enumerator.new do |y|
          y << 1
          y << 2
          y << 3
          raise 'boom'
        end
      end

      it 'does not raise right away' do
        subject
      end

      it 'does not raise when only taken' do
        subject.take(3)
      end

      it 'does not raise when evaluated' do
        expect(subject.take(3).to_a).to eq([1, 2, 3])
      end
    end
  end
end
