# Choose pixel row at given row# from private-test-150.csv (4 classes)
# Replicate this row 128 times into a new csv file in binary format

require 'CSV'

class Integer
  def to_bin(width)
    '%0*b' % [width, self]
  end
end

CSV_IN  = "private-test-150.csv"
CSV_OUT = "private-test-1.bin"
ROW_SELECT = ARGV[0].to_i

puts "ROW_SELECT -> #{ROW_SELECT}"

if ROW_SELECT == 0
  puts("Enter a row # to select!")
  exit
end

puts "Reading #{CSV_IN}"

File.open(CSV_OUT, 'wb') do |output|
  ctr = 1

  CSV.foreach(CSV_IN, headers: true) do |row|
    emotion = row["emotion"]
    pixels  = row["pixels"]
    usage   = row["Usage"]

    if ctr == ROW_SELECT
      arr =  [emotion.to_i.to_bin(8)] + pixels.split(' ').map { |i| i.to_i.to_bin(8) }
      puts "ctr:#{ctr} | emotion:#{emotion} | #{pixels[0..10]} ... | #{usage} | bytes=#{arr.count}"
      1.upto(128) do |i|
        output.write [arr.join].pack("B*")
      end

      break
    end

    ctr = ctr + 1
  end
end
