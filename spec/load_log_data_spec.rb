require 'load_log_data'
require 'pry-byebug'

describe LoadLogData do
  describe "#data_loader" do

    # context "when the data is not in the correct format" do
    #   context "and there is a missing value" do
    #     it 'returns the wrongly formatted line' do
    #       expect(subject).to eq nil
    #     end
    #     it 'removes it from the data_output' do
    #       expect(subject).to eq nil
    #     end
    #   end
    # end
    context "when the file path has correct data" do
      let(:file_path) { File.join('fixtures', 'webserver_test.log') }
      it "returns the lines" do
        expect(LoadLogData.new(file_path).data_loader).to eq ["/help_page/1 126.318.035.038"]
      end
    end
  end
end
