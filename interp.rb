# forth interpreter in ruby
require './extensions.rb'

tokens = []

File.open(ARGV.first, "r").each_line do |line|
  # split it up
  # TODO: parse out comments
  line.split.each do |t|
    tokens << t
  end
end

def do_math(token, a, b)
  case token
  when '*'
    a.to_f * b.to_f
  when '/'
    a.to_f / b.to_f
  when '-'
    a.to_f - b.to_f
  when '+'
    a.to_f + b.to_f
  else
    raise "Unknown operator token #{token}."
  end
end

stack = []

tokens.each do |token|
  # identify token type on the fly (should be done ahead of time, whatever)
  if token.number?
    stack.push(token)
  elsif token.in?(['*', '/', '-', '+'])
    b = stack.pop
    a = stack.pop
    stack.push(do_math(token, a, b))
  elsif token == '.'
    top = stack.pop
    puts top
  end
end
