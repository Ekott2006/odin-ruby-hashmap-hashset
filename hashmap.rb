class HashMap
  attr_accessor :store, :load_factor

  def initialize
    @load_factor = 16
    @store = Array.new(@load_factor) {}
  end

  def hash(string)
    hash_code = 0
    prime_number = 31

    string.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def update_load_factor
    size = entries.length / @load_factor.to_f
    @load_factor *= 2 if size >= 0.75
  end

  def set(key, value)
    update_load_factor
    i = hash(key) % @load_factor
    @store[i] = [key, value]
  end

  def get(key)
    i = hash(key) % @load_factor
    return nil if @store[i].nil? or @store[i][0] != key

    @store[i][1]
  end

  def key?(key)
    !get(key).nil?
  end

  def remove(key)
    i = hash(key) % @load_factor
    elem = @store[i]
    return nil if get(key).nil?

    @store[i] = nil
    elem[1]
  end

  def clear
    @store = Array.new(@load_factor) {}
  end

  def length
    entries.length
  end

  def keys
    entries.map { |elem| elem[0] }
  end

  def values
    entries.map { |elem| elem[1] }
  end

  def entries
    @store.filter { |elem| !elem.nil? }
  end
end

# # Create a new HashMap
# my_map = HashMap.new

# # Set key-value pairs
# my_map.set('name', 'John')
# my_map.set('age', 25)
# my_map.set('city', 'New York')

# # Check if keys exist
# puts "Key 'name' exists? #{my_map.key?('name')}" # Should print true
# puts "Key 'gender' exists? #{my_map.key?('gender')}" # Should print false

# # Get values
# puts "Value for key 'name': #{my_map.get('name')}" # Should print 'John'
# puts "Value for key 'age': #{my_map.get('age')}" # Should print 25

# # Remove a key
# puts "Removed value for key 'age': #{my_map.remove('age')}" # Should print 25

# # Check length and load factor
# puts "Entries: #{my_map.entries}"
# puts "Length of the HashMap: #{my_map.length}" # Should print 2
# puts "Load factor: #{my_map.load_factor}" # Should print 16

# # Clear the HashMap
# my_map.clear
# puts "Length of the HashMap after clearing: #{my_map.length}" # Should print 0

# # Display keys and values
# puts "Keys: #{my_map.keys}" # Should print []
# puts "Values: #{my_map.values}" # Should print []

# # Set more key-value pairs
# my_map.set('country', 'USA')
# my_map.set('language', 'English')

# # Display keys and values again
# puts "Keys: #{my_map.keys}" # Should print ['country', 'language']
# puts "Values: #{my_map.values}" # Should print ['USA', 'English']
