# frozen_string_literal: true

require 'populator'
require 'page_sort'

describe Populator do
  let(:page_views) { { 'page1' => 5 } }
  let(:unique_visits) { { 'page1' => 2 } }
  subject { Populator.new(page_views, unique_visits) }

  describe '#output_for_type' do
    before do
      allow(PageSort).to receive(:page_views).and_return(page_views)
      allow(PageSort).to receive(:page_views).and_return(unique_visits)
    end
    context 'when outputing for page visits' do
      it 'returns the page views string' do
        expect(subject.output_for_type(page_views)).to eq ['page1                           5']
      end
    end
    context 'when outputing for unique views' do
      it 'returns the unique views string' do
        expect(subject.output_for_type(unique_visits)).to eq ['page1                           2']
      end
    end
  end
end
