Given(/^Navigate to Test Exercise Page$/) do
@browser.goto("https://www.exercise1.com/values")
end


When(/^Verify text values not zero "([^"]*)"$/) do |arg|
value = @browser.text_field(:id => "txt_val_"+ "#{arg}").text.gsub!(/[^0-9A-Za-z.]/, '').to_f
expect(value > 0)
end


Then(/^Verify currencies symbol present in each textbox$/) do
$i = 0
while $i <=5  do
   value = @browser.text_field(:id => "txt_val_"+ "$i").text
   expect(value.index("$") == 0)
   $i +=1
end


Then(/^Verify Sum of textbox$/) do
$value = 0	
$i = 0
while $i <=5  do
   value = value + @browser.text_field(:id => "txt_val_"+ $i).text.gsub!(/[^0-9A-Za-z.]/, '').to_f
   $i +=1
end
total_value = @browser.text_field(:id => "txt_ttl_val").text.gsub!(/[^0-9A-Za-z.]/, '').to_f
expect(value == total_value)
@browser.close
end