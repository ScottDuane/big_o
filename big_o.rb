require 'byebug'
# Big O(n**2)

def phase1(arr)
  min = 0
  arr.each do |el|
    if compare_all(arr, el)
      min = el
    end
  end

  min
end

def compare_all(arr, potential)
  arr.each do |el|
    if el < potential
      return false
    end
  end

  true
end
arr1 = [3,4,2,7,-1,-2,6]
arr2 = [4,5,6,0]

# puts phase1(arr1)

# Big O(n)

def phase2(arr)
  min = arr.first
  return min if arr.length == 1

  (1..arr.length - 1).each do |i|
    if arr[i] < min
      min = arr[i]
    end
  end

  min
end

# puts phase2(arr2)

def largest_contiguous_sum(arr)
  sub_sums = []

  (0..arr.length - 1).each do |start|
    (start..arr.length - 1).each do |end_point|
      sum = 0
      arr[start..end_point].each do |el|
        sum += el
      end
        sub_sums << sum
    end
  end

  sub_sums.max

end

def lcs_better(arr)
  # debugger

  #master tracker
  master_lcs = 0

  #lcs that ends at the current position
  lcs_ending_here = 0
  return master_lcs if arr.length == 0

  arr.each do |el|
    #comparison 1: find the lcs_ending_here ending at el
    candidate_at_idx = lcs_ending_here + el
    candidate_at_idx > 0 ? lcs_ending_here = candidate_at_idx : lcs_ending_here = 0

    #comparison 2: compares the result of comparison 1 to the master_lcs
    master_lcs = lcs_ending_here if lcs_ending_here > master_lcs
  end

  master_lcs
end

puts largest_contiguous_sum([5,3,-7])
puts lcs_better([5,3,-7])
puts largest_contiguous_sum([100,-1,-1,50])
puts lcs_better([100,-1,-1,50])
puts largest_contiguous_sum([1,2,2,-1])
puts lcs_better([1,2,2,-1])
