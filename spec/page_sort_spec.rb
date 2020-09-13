require 'page_sort'
require 'pry-byebug'

describe PageSort do

  describe "#sort_by_type" do
    subject { PageSort.new(data_hash).sort_by_type(sort_type) }

    context "when given a data_hash" do
      let(:data_hash) { { "/videos/": 6, "/home/": 10, "/about/1": 3} }
      context "and given a hash of pages and their views" do
        let(:sort_type) { :count }
        it "returns a sorted hash" do
          expected_key_order = [:"/home/", :"/videos/", :"/about/1"]
          expect(subject.keys).to eq  expected_key_order
        end
      end

      context "and wanting a sorted hash based on unique visits" do
        let(:data_hash) { { "/videos/": 2, "/home/": 4, "/about/1": 3 } }
        let(:sort_type) { :uniqueness }
        it "returns a sorted hash" do
          expected_key_order = [:"/home/", :"/about/1", :"/videos/"]
          expect(subject.keys).to eq  expected_key_order
        end
      end
    end
  end
end
