def first_anagram(word1, word2)
  anagrams_of(word1).include?(word2)
end

def anagrams_of(string)
  return [string] if string.length == 1

  first_letter = string[0]
  arr_of_anagrams = []

  anagrams_of(string[1..-1]).each do |anagram|
    (0..anagram.length).each do |anag_idx|
      arr_of_anagrams << anagram[0...anag_idx] + first_letter + anagram[anag_idx..-1]
    end
  end

  arr_of_anagrams
end

# p result = anagrams_of("hotel")
# p result.size

def second_anagram(word1, word2)
  return false unless word1.length == word2.length
  word1_arr = word1.split("")
  characters = word2.chars

  word1_arr.each do |letter1|
    idx = characters.find_index(letter1)
    characters.delete_at(idx) unless idx.nil?

  end
  characters.empty?
end

# puts second_anagram("yllas", "sally")

def third_anagram(word1, word2)
  word1.split("").sort.join == word2.split("").sort.join
end

def fourth_anagram(word1, word2)
  letter_count = Hash.new(0)
  letters1 = word1.split("")
  letters2 = word2.split("")

  letters1.each do |let|
    letter_count[let] += 1
  end

  letters2.each do |let|
    letter_count[let] -= 1
  end

  letter_count.values.all? {|val| val == 0 }
end

puts fourth_anagram("tonka", "onkat")
puts fourth_anagram("tonka", "onat")
puts fourth_anagram("badoodle", "pacman")
puts fourth_anagram("badoodle", "doodleab")
