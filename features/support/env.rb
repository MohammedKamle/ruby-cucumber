require "rubygems"
require "watir"


Before do |scenario|

    browser = Watir::Browser.new :chrome
    # making browser global
    $browser = browser
    $browser.driver.manage.window.maximize
end

After do |scenario|
    $browser.close
end

# taking screenshots after every steps
$report_path = "features/Reports"
AfterStep do |scenario| 
    sleep 0.5
    file = Tempfile.new(["screenshot_", ".png"], $report_path)
    screenshot = file.path
    file.close(true)
    $browser.driver.save_screenshot(screenshot)
    attach "#{screenshot}", "image/png"
end
