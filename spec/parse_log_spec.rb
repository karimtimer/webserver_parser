# frozen_string_literal: true

# require 'pry-byebug'
require 'parse_log'
require '../lib/load_log_data'
# require 'pry-byebug'

describe ParseLog do
  subject { ParseLog.new(file_data) }

  describe '#data_parser' do
    before do
    end
    context 'when parsing the file rows' do
      let(:file_data) { ['page/1 ipdiff', 'page/1 ipsame', 'page/1 ipsame'] }
      it 'returns a hash of each page and their visits' do
        expected_hash = { 'page/1' => 3 }
        expect(ParseLog.new(file_data).data_parser.first). to eq expected_hash
      end
      it 'returns a hash of each page and their unique views' do
        expected_hash = { 'page/1' => 2 }
        expect(subject.data_parser.last). to eq expected_hash
      end
    end
  end
end
