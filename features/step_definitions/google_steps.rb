Given(/^I am on google home page$/)do
    $browser.goto "http://www.google.com/"
    puts "Google home page launched successfully"
    # creating object of homepage
    $user = HomePage.new()

end

Then(/^I verify gmail link is available on the home page$/)do 
    $user.gmail_link.flash
    expect($user.gmail_link.present?). to be true
end