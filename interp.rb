# forth interpreter in ruby

tokens = []

File.open(ARGV.first, "r").each_line do |line|
  # split it up
  # TODO: parse out comments
  line.split.each do |t|
    tokens << t
  end
end

puts tokens.inspect
