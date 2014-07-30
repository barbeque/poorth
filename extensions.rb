module ForthExtensions
  def number?
    true if Float(self) rescue false
  end
  def in?(array)
    array.include?(self)
  end
end

Object.send(:include, ForthExtensions)
