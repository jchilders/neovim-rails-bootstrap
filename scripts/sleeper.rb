#!/usr/bin/env ruby
# frozen_string_literal: true

@duration = 2

puts 'Starting.'

r = Ractor.new name: 'sleepytime' do
  p "we are in our ractor. object_id: #{self.object_id}"
end



pipe = Ractor.new do
  loop do
    Ractor.yield "recd: #{Ractor.receive}"
  end
end

RN = 10
rs = RN.times.map do |i|
  Ractor.new pipe, i do |pipe, _j|
end

RN.times { |i| pipe << i }

RN.times.map do
  r, n = Ractor.select(*rs)
  rs.delete r
  n
end

  .sort #=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

read_stream, write_stream = IO.pipe
2.times do |i|
  Process.fork do
    write_stream.puts "Sleeping for #{@duration} seconds..."
    puts "Done writing to stream. duration: #{@duration}"
    puts "duration % 10 == #{@duration % 10}"
    sleep(@duration)
  end
end

puts 'Done!'

Process.waitall
write_stream.close
results = read_stream.read
read_stream.close
puts '-=-=-= results =-=-=-'
puts results

# loop do
#   puts "Sleeping for #{@duration} seconds"
#   sleep(@duration)
#   exit(1) if (@duration % 10).zero?
# end
