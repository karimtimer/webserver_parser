# frozen_string_literal: true

require 'load_log_data'

describe LoadLogData do
  describe '#data_loader' do
    let(:file_path) { File.join('tmp', 'test.log') }
    after(:each) do
      File.delete(file_path)
    end
    context 'when the file path has correct data' do
      it 'returns the lines' do
        File.open('tmp/test.log', 'w') { |f| f.write "\/help_page\/1 126.318.035.038\n" }
        expect(LoadLogData.new(file_path).data_loader).to eq ["\/help_page\/1 126.318.035.038\n"]
      end
      context 'irrespective of web address' do
        it 'returns the lines' do
          File.open('tmp/test.log', 'w') { |f| f.write "\/help_page 126.318.035.038\n" }
          expect(LoadLogData.new(file_path).data_loader).to eq ["\/help_page 126.318.035.038\n"]
        end
      end
      context 'irrespective of varying ip address fields' do
        it 'returns the lines' do
          File.open('tmp/test.log', 'w') { |f| f.write "\/help_page 1.22.33.444\n" }
          expect(LoadLogData.new(file_path).data_loader).to eq ["\/help_page 1.22.33.444\n"]
        end
      end
    end
    context 'when the file contains malform lines' do
      it 'returns the valid line only' do
        File.open('tmp/test.log', 'w') { |f| f.write "\/help_page\/1 1.22.33.444\nhelp_page 1.2222.33.444\n" }
        expect(LoadLogData.new(file_path).data_loader).to eq ["\/help_page\/1 1.22.33.444\n", nil]
      end
    end
  end
end
