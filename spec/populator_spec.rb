# frozen_string_literal: true

# require 'pry-byebug'
require 'populator'
# require 'pry-byebug'

describe Populator do
  subject { Populator.new.output_array(data_hash, end_bit) }

  describe '#output_array' do
    context 'when outputing for page visits' do
      let(:data_hash) { { "page1": 5, "page2": 2 } }
      let(:end_bit) { 'visit' }
      it 'returns the page views string' do
        expect(subject).to eq ['page1 5 visit', 'page2 2 visit']
      end
    end
    context 'when outputing for unique views' do
      let(:data_hash) { { "page1": 2, "page2": 1 } }
      let(:end_bit) { 'unique views' }
      it 'returns the unique views string' do
        expect(subject).to eq ['page1 2 unique views', 'page2 1 unique views']
      end
    end
  end
end
