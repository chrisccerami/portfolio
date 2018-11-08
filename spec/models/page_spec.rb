require 'rails_helper'

describe Page do
  let(:comic) { create :comic }
  let!(:first_page) { create :page, number: 1, comic: comic }
  let!(:second_page) { create :page, number: 2, comic: comic }
  let!(:third_page) { create :page, number: 3, comic: comic }

  describe "#first?" do
    it "is only true for the first page" do
      expect(first_page.first?).to be_truthy
      expect(second_page.first?).to be_falsey
      expect(third_page.first?).to be_falsey
    end
  end

  describe "#last?" do
    it "is only true for the last page" do
      expect(first_page.last?).to be_falsey
      expect(second_page.last?).to be_falsey
      expect(third_page.last?).to be_truthy
    end
  end

  describe "#next" do
    it "returns the next page if there is one" do
      expect(first_page.next).to eq second_page
      expect(second_page.next).to eq third_page
      expect(third_page.next).to be_nil
    end
  end

  describe "previous" do
    it "returns the previous page if there is one" do
      expect(first_page.previous).to be_nil
      expect(second_page.previous).to eq first_page
      expect(third_page.previous).to eq second_page
    end
  end
end
