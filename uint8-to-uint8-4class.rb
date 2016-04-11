# Converts array of image pixels to binary format
# Run separately for Training Set and Test Set

require 'CSV'

CSV_IN    = "fer2013.csv"
CSV_OUT   = "fer2013_4class.csv"
# DATA_SET_BIN   = "test_batch.bin" # Test data

puts "Reading csv ..."

CSV.open(CSV_OUT, 'wb') do |output|
  ctr = 1

  output << ["emotion", "pixels", "Usage"]

  CSV.foreach(CSV_IN, headers: true) do |row|
    emotion = row["emotion"]
    pixels  = row["pixels"]
    usage   = row["Usage"]


    # if usage == 'Training'
    #if usage == 'PublicTest' # Test data
      actual_emotion = emotion

      if emotion == '0' || emotion == '1'
        emotion = '0' # angry

      elsif emotion == '2'
        emotion = '1' # fear

      elsif emotion == '3' || emotion == '5'
        emotion = '2' # happy

      elsif emotion == '4' || emotion == '6'
        emotion = '3' # sad

      else
        puts "Invalid emotion -> #{emotion}"
        break
      end

      puts "#{ctr} : #{actual_emotion} -> #{emotion} | #{pixels[0..10]} ... | #{usage}"

      output << [emotion, pixels, usage]
      ctr += 1

    #else
    #  next
    #end

  end # CSV.foreach
end # CSV.open

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

