class HashSet
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

  def set(key)
    update_load_factor
    i = hash(key) % @load_factor
    @store[i] = key
  end

  def get(key)
    i = hash(key) % @load_factor
    return nil if @store[i].nil? or @store[i] != key

    @store[i]
  end

  def key?(key)
    !get(key).nil?
  end

  def remove(key)
    i = hash(key) % @load_factor
    elem = @store[i]
    return nil if get(key).nil?

    @store[i] = nil
    elem
  end

  def clear
    @store = Array.new(@load_factor) {}
  end

  def length
    entries.length
  end

  def entries
    @store.filter { |elem| !elem.nil? }
  end
end

# # Create a new Set
# my_set = HashSet.new

# # Set key-value pairs
# my_set.set('name')
# my_set.set('age')
# my_set.set('city')

# # Check if keys exist
# puts "Key 'name' exists? #{my_set.key?('name')}" # Should print true
# puts "Key 'gender' exists? #{my_set.key?('gender')}" # Should print false

# # Get values
# puts "Value for key 'name': #{my_set.get('name')}" # Should print 'name'
# puts "Value for key 'age': #{my_set.get('age')}" # Should print 'age'

# # Remove a key
# puts "Removed value for key 'age': #{my_set.remove('age')}" # Should print 25

# # Check length and load factor
# puts "Entries: #{my_set.entries}"
# puts "Length of the HashSet: #{my_set.length}" # Should print 2
# puts "Load factor: #{my_set.load_factor}" # Should print 16

# # Clear the HashSet
# my_set.clear
# puts "Length of the HashSet after clearing: #{my_set.length}" # Should print 0

# # Display keys and values
# puts "Keys: #{my_set.entries}" # Should print []

# # Set more key-value pairs
# my_set.set('country')
# my_set.set('language')

# # Display keys and values again
# puts "Keys: #{my_set.entries}" # Should print ['country', 'language']
