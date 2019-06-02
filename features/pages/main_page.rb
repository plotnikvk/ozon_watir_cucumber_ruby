class MainPage
  include PageObject
  include RSpec::Matchers
  
  def submit_choose(element, price)
    i = 0
    begin
      element.wait_until_present(timeout: 30)
      element.when_present.clear
      element.when_present.send_keys(price)
      expect(element.value).to be(price)
    rescue => e
      raise if i == 5
      i += 1
      retry
    end
    element.send_keys(:tab)
  end
end