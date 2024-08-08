def word_pattern(pattern, string)
  words = string.split
  return false if pattern.size != words.size

  map = {}
  counter = 1
  regex_pattern = ""

  pattern.chars.each do |char|
    if map[char]
      regex_pattern += "\\#{map[char]}"
    else
      map[char] = counter
      regex_pattern += "(\\w+)"
      counter += 1
    end
    regex_pattern += " " unless regex_pattern.end_with?(" ")
  end

  regex_pattern.rstrip!
  regex = Regexp.new("^#{regex_pattern}$")

  !!(regex =~ string)
end
  
puts word_pattern('abab', 'truck car truck car')
puts word_pattern('aaaa', 'dog dog dog dog')
puts word_pattern('abab', 'apple banana banana apple')
puts word_pattern('aaaa', 'cat cat dog cat')
  