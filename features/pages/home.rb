require 'rubygems'
require 'selenium-webdriver'

require 'yaml'
class BrowserTest

    def setup
        $ymldata = YAML.load_file("cucumber.yml")
        caps = Selenium::WebDriver::Remote::Capabilities.new
        caps = {
            'bstack:options' => {
            "os" => "OS X",
            "osVersion" => "Big Sur",
            "projectName" => "FlipkartTestProject",
            "buildName" => "Build 5",
            "sessionName" => "Product Search Test",
            "local" => "false",
            "seleniumVersion" => "3.14.0",
            },
            "browserName" => "Safari",
            "browserVersion" => "14.0",
            }
            driver = Selenium::WebDriver.for(:remote,
            :url => "https://"+$ymldata["USERNAME"]+":"+$ymldata["AUTOMATE_KEY"]+"@hub-cloud.browserstack.com/wd/hub",
            :desired_capabilities => caps)
            $driver=driver
            $driver.manage.window.maximize
        $driver.navigate.to "https://www.flipkart.com"
        element = $driver.find_element(:xpath, "(//span[contains(text(),'Enter Email/Mobile number')]//ancestor::div//button)[1]")
        element.click
    end

    def getPageTitle
        return $driver.title
    end

    def tearDown
        $driver.close
        $driver.quit
    end

end