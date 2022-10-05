<<-Doc
Design a HashMap without using any built-in hash table libraries.

Implement the MyHashMap class:

MyHashMap() initializes the object with an empty map.
void put(int key, int value) inserts a (key, value) pair into the HashMap. If the key already exists in the map, update the corresponding value.
int get(int key) returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key.
void remove(key) removes the key and its corresponding value if the map contains the mapping for the key.

Input
["MyHashMap", "put", "put", "get", "get", "put", "get", "remove", "get"]
[[], [1, 1], [2, 2], [1], [3], [2, 1], [2], [2], [2]]
Output
[null, null, null, 1, -1, null, 1, null, -1]

Explanation
MyHashMap myHashMap = new MyHashMap();
myHashMap.put(1, 1); // The map is now [[1,1]]
myHashMap.put(2, 2); // The map is now [[1,1], [2,2]]
myHashMap.get(1);    // return 1, The map is now [[1,1], [2,2]]
myHashMap.get(3);    // return -1 (i.e., not found), The map is now [[1,1], [2,2]]
myHashMap.put(2, 1); // The map is now [[1,1], [2,1]] (i.e., update the existing value)
myHashMap.get(2);    // return 1, The map is now [[1,1], [2,1]]
myHashMap.remove(2); // remove the mapping for 2, The map is now [[1,1]]
myHashMap.get(2);    // return -1 (i.e., not found), The map is now [[1,1]]
Doc

class MyHashMap
  attr_reader :keys, :values

  def initialize()
    @keys = []
    @values = []
  end


=begin
    :type key: Integer
    :type value: Integer
    :rtype: Void
=end
  def put(key, value)
    if @keys.include? key
      @values[@keys.index(key)] = value
    else
      @keys << key
      @values << value
    end
  end


=begin
    :type key: Integer
    :rtype: Integer
=end
  def get(key)
    return -1 unless @keys.include?(key)

    @values[@keys.index(key)]
  end


=begin
    :type key: Integer
    :rtype: Void
=end
  def remove(key)
    return -1 unless @keys.include?(key)

    @values.delete_at(@keys.index(key))
    @keys.delete_at(@keys.index(key))
  end
end

# Your MyHashMap object will be instantiated and called as such:
# obj = MyHashMap.new()
# obj.put(key, value)
# param_2 = obj.get(key)
# obj.remove(key)
