class ParkingLotSolutionPart2

  @@size
  @@time_in_hour_minute_and_second
  @@slot_details

  def self.create_parking_slots
    print 'create_parking_lot '
    parking_slots_details = gets.chomp
    temp = parking_slots_details .split(" ")
    @@size = temp[0].to_i
    price = temp[1].to_f
    grace_time = temp[2]
    @@slot_details = [@@size, price, grace_time]
    puts "created a parking slot with size : #{@@size}"
    return @@slot_details
  end

  def self.parking_cars
    slots = ParkingLotSolutionPart2.create_parking_slots
    parking_slots = {}
    key = 1
    size = slots[0]
    while parking_slots.length < size
      print 'park '
      car_details = gets.chomp
      temp = car_details.split(" ")
      plate_number = temp[0]
      colour = temp[1]
      time = Time.new
      @@time_in_hour_minute_and_second = time.strftime("%H:%M:%S")
      puts "time : #{@@time_in_hour_minute_and_second}"
      puts "Allocated slot number:#{key}"
      parking_slots[key] = ["#{plate_number}", "#{colour}", "#{@@time_in_hour_minute_and_second}"]
      key +=1
    end
    return parking_slots
  end

  def self.leave_slots
    slots = ParkingLotSolutionPart2.parking_cars
    print 'leave '
    plate_number = gets.chomp()
    time = Time.new
    present_time = time.strftime("%H:%M:%S").to_i
    difference = @@time_in_hour_minute_and_second.to_i - present_time
    i = 1
    price = 0
    while i <= difference
      price = @@slot_details[1] * i
      i+=1
    end
    slots.delete_if{|key, value| value.include? plate_number}
    puts "#{plate_number} is free, paid #{price}"
    return slots
  end

  def self.status
    slots = ParkingLotSolutionPart2.leave_slots
    puts "PARKING SLOTS DETAILS"
    puts "Parking slot size | Rate per hour | Grace time"
    print "#{@@slot_details[0]} |"
    print "#{@@slot_details[1]} |"
    puts "#{@@slot_details[2]}"
    puts "***************************************************************************"
    puts "| Slot Number |Plate Number | Colour | Time"
    slots.each do |key, car_detail|
      puts "#{key} | #{car_detail[0]} | #{car_detail[1]} |#{car_detail[2]}"
  end
end

 ParkingLotSolutionPart2.status

end
