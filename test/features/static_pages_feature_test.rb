require "test_helper"

feature "Static Pages" do
  scenario "visit home page" do
    visit root_path
    page.must_have_selector "h1", text: "Summit Traffic Solutions"
  end

  scenario "visit manufacturers page" do
    visit manufacturers_path
    page.must_have_selector "h1", text: "Manufacturers"
  end

  scenario "visit contact page" do
    visit contact_path
    page.must_have_selector "h1", text: "Contact Us"
  end
end
