require 'load_log_data'
# require 'pry-byebug'

describe LoadLogData do
  describe "#data_loader" do
    context "when the file path has correct data" do
      let(:file_path) { File.join('fixtures', 'webserver_test.log') }
      it "returns the lines" do
        expect(LoadLogData.new(file_path).data_loader).to eq ["/help_page/1 126.318.035.038"]
      end
    end
  end
end
