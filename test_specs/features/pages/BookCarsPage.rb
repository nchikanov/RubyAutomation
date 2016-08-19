
class BookCarsPage < SitePrism::Page

  element :same_dropoff_radiobutton, :xpath, ".//*[@id='car_search_rental_type_input']/fieldset/ol/li[1]/label/span"
  element :diff_dropoff_radiobutton, :xpath, ".//*[@id='car_search_rental_type_input']/fieldset/ol/li[2]/label/span"
  element :search_city_airport_radiobutton, :xpath, ".//*[@id='car_search_pickup_use_address_input']/fieldset/ol/li[1]/label/span"
  element :search_address_radiobutton, :xpath, ".//*[@id='car_search_pickup_use_address_input']/fieldset/ol/li[2]/label/span"
  element :car_pickup, :xpath, ".//*[@id='pick_up']"

  def selectRadioButton(option)
    case option
      ###Type of Rental###
      when 'Drop-off location same as pick-up' then
        same_dropoff_radiobutton.click
      when 'Different drop-off location' then
        diff_dropoff_radiobutton.click
      when 'Search by city or airport' then
        search_city_airport_radiobutton.click
      when 'Search by address' then
        search_address_radiobutton.click
      else "The '#{option}' was not found."
    end
  end

  def selectItemInAutosuggest(autosuggestName, item)
    case autosuggestName
      when 'car pickup' then
        find(:xpath, "html/body/ul[10]/li/a[text()='#{item}']").click
    end
  end

  def setValue(element, value)
    case element
      when 'Where will you pick up the car' then
      car_pickup.click
      car_pickup.set value
      selectItemInAutosuggest('car pickup', value)

    end

  else


  end



end