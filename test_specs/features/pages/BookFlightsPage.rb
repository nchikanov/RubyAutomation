
class BookFlightsPage < SitePrism::Page

 element :roundtrip_radiobutton, :xpath, ".//*[@id='flight_search_trip_type_input']/fieldset/ol/li[1]/label/span"
 element :oneway_radiobutton, :xpath, ".//*[@id='flight_search_trip_type_input']/fieldset/ol/li[2]/label/span"
 element :multicity_radiobutton, :xpath, ".//*[@id='flight_search_trip_type_input']/fieldset/ol/li[3]/label/span"
 element :departure_airport, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_0_departure_search_for']"
 element :departure_airport_2, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_1_departure_search_for']"
 element :departure_airport_3, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_2_departure_search_for']"
 element :arrival_airport, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_0_arrival_search_for']"
 element :arrival_airport_2, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_1_arrival_search_for']"
 element :arrival_airport_3, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_2_arrival_search_for']"
 element :departure_time, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_0_departure_hour_range_input']/a/span[1]"
 element :departure_time_2, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_1_departure_hour_range_input']/a/span[1]"
 element :departure_time_3, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_2_departure_hour_range_input']/a/span[1]"
 element :return_time, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_1_departure_hour_range_input']/a"
 element :fare_class, :xpath, ".//*[@id='flight_search_cabin_type_input']/a"
 element :children_combobox, :xpath, ".//*[@id='flight_search_traveler_groups_child_count_input']"
 element :childrenage_combobox1, :xpath, ".//*[@id='new_flight_search']/fieldset[8]/ol/div[2]/fieldset/ol/li[4]/fieldset/div[2]/ol/li[1]"
 element :childrenage_combobox2, :xpath, ".//*[@id='new_flight_search']/fieldset[8]/ol/div[2]/fieldset/ol/li[4]/fieldset/div[2]/ol/li[2]"
 element :childinlap_option, :xpath, ".//*[@id='flight_search_traveler_groups_infants_seated_input']/fieldset/ol/li[1]/span"
 element :childinseat_option, :xpath, ".//*[@id='flight_search_traveler_groups_infants_seated_input']/fieldset/ol/li[2]/span"

  def selectRadioButton(option)
    case option
      ###Flight Type###
      when 'Round Trip' then
        roundtrip_radiobutton.click
      when 'One Way' then
        oneway_radiobutton.click
      when 'Multi-City' then
        multicity_radiobutton.click
      else "The '#{option}' was not found."
    end
  end

   def selectItemInAutosuggest(autosuggestName, item)
     case autosuggestName
       when 'airport1' then
         find(:xpath, "html/body/ul/li/a[contains(text(), '#{item}')]").click
       when 'airport2' then
         find(:xpath, "html/body/ul/li/a[contains(text(), '#{item}')]").click
       when 'dept time' then
         find(:xpath, "html/body/ul/li/a[text()='#{item}']").click
       when 'ret time' then
         find(:xpath, "html/body/ul/li/a[text()='#{item}']").click
       when 'fare class' then
         find(:xpath, "html/body/ul[18]/li/a[text()='#{item}']").click
     end
   end

 def setValue(element, value)
   case element
     when 'When are you going' then
       departure_time.click
       selectItemInAutosuggest('dept time', value)
     when 'Where and when are you going' then
       departure_time.click

       selectItemInAutosuggest('dept time', value)

     when 'Where and when are you going_2' then
       departure_time_2.click
       
        selectItemInAutosuggest('dept time', value)

     when 'Where and when are you going_3' then
       departure_time_3.click

        selectItemInAutosuggest('dept time', value)


   end
 end

  def set2values(element, value1, value2)
    case element
      when 'Where are you going' then
        departure_airport.click
        departure_airport.set value1
        selectItemInAutosuggest('airport1', value1)

        arrival_airport.click
        arrival_airport.set value2
        selectItemInAutosuggest('airport2', value2)

      when 'When are you going' then
        departure_time.click
        selectItemInAutosuggest('dept time', value1)

        return_time.click
        selectItemInAutosuggest('ret time', value2)

      when 'Where and when are you going' then
        ###Flight 1###

        departure_airport.click
        departure_airport.set value1


        selectItemInAutosuggest('airport1', value1)


        arrival_airport.click
        arrival_airport.set value2

        selectItemInAutosuggest('airport2', value2)


      when 'Where and when are you going_2' then
        ###Flight 2###

        departure_airport_2.click
        departure_airport_2.set value1

        selectItemInAutosuggest('airport1', value1)


        arrival_airport_2.click
        arrival_airport_2.set value2

        selectItemInAutosuggest('airport2', value2)


      when 'Where and when are you going_3' then
        ###Flight 3###
        departure_airport_3.click
        departure_airport_3.set value1

        selectItemInAutosuggest('airport1', value1)


        arrival_airport_3.click
        arrival_airport_3.set value2

        selectItemInAutosuggest('airport2', value2)


      when 'Children Age' then
        if value1 == 'child in lap'
          childrenage_combobox1.click
          #find(:xpath, "html/body/ul[10]/li[1]/a").click
          within childrenage_combobox1 do
            childinlap_option.click
          end

          if value2 == 'child in seat'
            childrenage_combobox2.click
            #find(:xpath, "html/body/ul[11]/li[1]/a").click
            within childrenage_combobox2 do
              childinseat_option.click
              end

          end
        end

      else
        fail(ArgumentError.new("'#{value1}' does not exist!"))

    end

  end

end