require 'byebug'

def bad_two_sum?(arr, target)
  arr.each_with_index do |el, index|
    (index+1..arr.length-1).each do |j|
      return true if el+arr[j] == target
    end
  end

  false
end

# []
def okay_two_sum?(arr, target)
  new_arr = arr.sort

  # Approach A: iterate over the array and for each el, bsearch for target - el
  # Approach B: start with pointers i and j at the start and end, respectively; move inward

  starting_point = new_arr.first
  starting_index = 0


  while starting_point < target
    ending_point = new_arr[starting_index + 1]
    ending_index = starting_index + 1

    while starting_point + ending_point <= target
      if starting_point + ending_point == target
        return true
      else
        ending_index += 1
        ending_point = new_arr[ending_index]
      end
    end

    starting_index += 1
    starting_point = new_arr[starting_index]
  end

  false
end

def good_two_sum?(arr, target)
  matches = {}
  arr.each do |el|
    return true if matches[target - el]
    matches[el] = true
  end
  false
end

puts good_two_sum?([5, 4, 3, 2, 1], 6)
puts good_two_sum?([4, 3, 2, 1], 10)
puts good_two_sum?([0, 3, -1, 1], 6)
puts good_two_sum?([0, 3, -1, 1], 0)
puts good_two_sum?([3,3,0], 6)
puts good_two_sum?([3,0], 6)
