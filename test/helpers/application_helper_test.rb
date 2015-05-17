require "test_helper"

describe ApplicationHelper do
  describe "full_title" do
    it "formats a title without an argument" do
      full_title.must_equal "Summit Traffic Solutions"
    end

    it "formats a title with an empty argument" do
      full_title("").must_equal "Summit Traffic Solutions"
    end

    it "formats a title with an argument" do
      full_title("About Us").must_equal "Summit Traffic Solutions - About Us"
    end
  end
end
