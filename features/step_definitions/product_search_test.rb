require "watir" 
require "rspec/expectations" 
require "test/unit/assertions"
include Test::Unit::Assertions
require "./features/pages/home.rb"

Before do
  @ProductSearch = ProductSearch.new
end

Given('I am on Flipkart home page') do
        @BrowserTest = BrowserTest.new
        @BrowserTest.setup()
        pagetitle = @BrowserTest.getPageTitle()
        #puts pagetitle
        assert_equal "Online Shopping Site for Mobiles, Electronics, Furniture, Grocery, Lifestyle, Books & More. Best Offers!", pagetitle
  end
  
  When('I perform product search with valid product name') do
      @ProductSearch.searchProduct()
  end
  
  Then('I should see search results related to entered search criteria') do
    @ProductSearch.getProductSearchResults()
    @BrowserTest.tearDown()
  end