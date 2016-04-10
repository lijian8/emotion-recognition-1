# Converts array of image pixels to binary format
# Run separately for Training Set and Test Set

require 'csv'

class Integer
  def to_bin(width)
    '%0*b' % [width, self]
  end
end

DATA_SET_UINT8 = "/home/rdammala/Downloads/fer2013/fer2013.csv"
DATA_SET_BIN   = "/home/rdammala/Downloads/fer2013/test/test_batch.bin"
# DATA_SET_BIN   = "/Users/aman/Desktop/Synapse/fer2013/test_batch.bin" # Test data


puts "Reading csv ..."

File.open(DATA_SET_BIN, 'wb') do |output|
  ctr = 1

  CSV.foreach(DATA_SET_UINT8, headers: true) do |row|
    emotion = row["emotion"]
    pixels  = row["pixels"]
    usage   = row["Usage"]


    #if usage == 'Training'
    if usage == 'PublicTest' # Test data
     # if ctr == 1
      #  ctr+=1
      #  next
      #end
      arr =  [emotion.to_i.to_bin(8)] + pixels.split(' ').map { |i| i.to_i.to_bin(8) }
      puts "#{ctr} : #{emotion} | #{pixels[0..10]} ... | #{usage} | bytes=#{arr.count}"
      #1.upto(128) do |i|
      output.write [arr.join].pack("B*")
      #end
      #break
      ctr += 1
      if ctr == 128
        break
      end
    else
      #break
      
    end

  end
end

puts "Done!"


# Sample Code
#
# a = [6, 59]
# b = [9, 32]
# # a = ["00000110", "00111011"]
#
# File.open("sample-out.bin", 'wb') do |output|
#   output.write [a.map { |i| i.to_bin(8) }.join].pack("B*")
#   output.write [b.map { |i| i.to_bin(8) }.join].pack("B*")
# end
#
# puts "Done!"

