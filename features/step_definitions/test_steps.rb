Given(/^открыли сайт "([^"]*)"$/) do |url|
  @browser.goto(url)
end

When(/^выбран(|а) (пункт меню|категория товара) - "([^"]*)"$/) do |_no_used, action, menu_item|
  index = if action == 'пункт меню'
            0
          elsif action == 'категория товара'
            1
          end
  on(MainPage).link_element(xpath: "//a[contains(text(),'#{menu_item}')]", index: index).when_present.click
end

When(/^выбран бренд товара - "([^"]*)"$/) do |brand|
  on(MainPage).span_element(xpath: "//span[contains(text(),'#{brand}')]").when_present.click
end

When(/^заполнена цена от – "([^"]*)"$/) do |price|
  element = on(MainPage).text_field_element(xpath: "//input[starts-with(@id, 'from')]", index: 0)
  on(MainPage).submit_choose(element, price)
end