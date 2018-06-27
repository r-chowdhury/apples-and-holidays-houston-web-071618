require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # # return the second element in the 4th of July array
  # return [:summer][:fourth_of_july][1]
  return holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas].push(supply)
  holiday_hash[:winter][:new_years].push(supply)

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day].push(supply)

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  return holiday_hash

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = []
  holiday_hash[:winter].each do |holiday_key, holiday_value| #iterate through key values which are arrays
    holiday_value.each do |supply_value| #iterate through each array
      winter_supplies.push(supply_value) #push elements of both arrays into new array.
    end
  end
  return winter_supplies
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holidays_in_season|
    puts "#{season.capitalize}:"
    holidays_in_season.each do |holidays, supply_list|
      holidays_string = holidays.to_s #convert symbol to string.
      if holidays_string.include?("_")
        holidays_string = holidays_string.tr('_', ' ')
        holidays_string = holidays_string.split(" ").map {|word| word.capitalize}.join(" ")
      else
        holidays_string = holidays_string.capitalize
      end
      puts "  #{holidays_string}: #{supply_list.join(", ")}"
      
    end 
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holidays_with_bbq = []
  holiday_hash.each do |seasons, holidays|
    holidays.each do |holiday, supplies|
      if supplies.include?("BBQ")
        holidays_with_bbq.push(holiday)
      end 
    end 
  end
  return holidays_with_bbq
end

holiday_hash = {
      :winter => {
        :christmas => ["Lights", "Wreath"],
        :new_years => ["Party Hats"]
      },
      :summer => {
        :fourth_of_july => ["Fireworks", "BBQ"]
      },
      :fall => {
        :thanksgiving => ["Turkey"]
      },
      :spring => {
        :memorial_day => ["BBQ"]
      }
    }
  