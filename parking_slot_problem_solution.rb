class ParkingSlotProblem

  @@size
  def self.creating_parking_slots
    print 'create_parking_lot '
    @@size = gets.chomp.to_i
    parking_slots = {}
    key = 1
    puts "Created a parking lot with #{@@size} slots"
   while parking_slots.length < @@size
      print 'park '
      car_registration_number_and_colour = gets.chomp
      temp = car_registration_number_and_colour.split(" ")
      value1 = temp[0]
      value2 = temp[1]
      parking_slots[key] = ["#{value1}", "#{value2}"]
      puts "Allocated slot number:#{key}"
      key += 1
    end
    return parking_slots
  end

  def self.leave_slot_and_park_anothet_car
    slots = ParkingSlotProblem.creating_parking_slots
    print 'leave '
    slot_number = gets.chomp.to_i
    slots.delete(slot_number)
    puts "slot number #{slot_number} is free"

    puts 'status'
    puts 'Slot No.  | Plate Number | Colour '
    slots.each do |key, car_detail|
      puts "#{key} | #{car_detail[0]} | #{car_detail[1]}"
    end

    print 'park '
    park_another_car = gets.chomp()
    car_deatails = park_another_car.split(" ")
    value1 = car_deatails[0]
    value2 = car_deatails[1]
    slots["#{slot_number}"] = ["#{value1}", "#{value2}"]
    puts "Allocated slot number : #{slot_number}"
    return slots
  end

  def self.utility_method
    slots = ParkingSlotProblem.leave_slot_and_park_anothet_car
    print 'park '
    add_another_car = gets.chomp
  if(slots.length == @@size)
      puts 'Sorry, parking lot is full'
  end

    print 'plate_numbers_for_cars_with_colour '
    car_colour_for_number_plates = gets.chomp
    slots.each_value{|fvalue, svalue|
      if(svalue == car_colour_for_number_plates)
        puts "#{fvalue} "
      end
    }

     print 'slot_numbers_for_cars_with_colour '
     slot_numbers_for_cars_with_colour = gets.chomp
     puts slots.select{|key, values| values.include?("#{slot_numbers_for_cars_with_colour}")}.map(&:first)

     print 'slot_number_for_registration_number '
     slot_number_of_car_with_registration_number = gets.chomp
     puts slots.select{|key, values| values.include?("#{slot_number_of_car_with_registration_number}")}.map(&:first)

     print 'slot_number_for_registration_number '
     slot_number_of_car_with_registration_number2 = gets.chomp
     car = slots.select{|key, values| values.include?("#{slot_number_of_car_with_registration_number2}")}.map(&:first)
     if(car.empty?)
       puts "Not Found"
    else
       puts car
    end
  end

  ParkingSlotProblem.utility_method
end
