# Enum - map
enum = [1,2,3].map

# Offense
p enum.each { |_item| 42 } # => [42, 42, 42]
p enum.each { |item| 42 } # => [42, 42, 42]
p enum.each { |item| item } # =>  [1, 2, 3]
p enum.each { |item| true } #=> [true, true, true]

# No Offense
p enum.each_with_index { |item, i| i } # => [0, 1, 2]
p enum.each { |item| item >= 2 } #=> [false, true, true]
p enum.each { |item| item % 2 == 0  } #=> [false, true, false]
p enum.each { |item| 42 + 1 } #=> [43, 43, 43]
p enum.each { |item| item * 2 } #=> [2, 4, 6]

# Enum - filter
enumerator = [1, 2, 3].filter

# Offense
p enumerator.each { |item| 2 } #=> [2, 2, 2]
# No Offense
p enumerator.each { |item| item >= 2 } #=> [2, 3]

# Enum - select
enum = [1,2,3].select

# Offense
p enum.each { |_item| 42 } # => [42, 42, 42]
p enum.each { |item| 42 } # => [42, 42, 42]

# No offense
p enum.each { |item| item >= 2 } #=> [2, 3]
