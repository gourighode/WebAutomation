class ProductSearch

    def wait_for(seconds)
        Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
    end

    def searchProduct()
        searchbox = $driver.find_element(:xpath, "//input[@title='Search for products, brands and more']")
        searchbox.click
        searchbox.send_keys "APPLE iPhone 12", :enter
        wait = Selenium::WebDriver::Wait.new(:timeout => 5)
        
    end

    def getProductSearchResults()
       wait_for(10) { $driver.find_element(:xpath,"//span[contains(@id,'productRating_')]").displayed? }
       searchResults=$driver.find_elements(:xpath, "//span[contains(@id,'productRating_')]//preceding::div[1]")
       searchResults.each do | product |
            #puts "Product Name is:" + product.text()
            assert product.text.include?("APPLE iPhone 12")
       end
    end
end