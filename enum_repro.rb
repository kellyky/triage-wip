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

#############   NOTES ############
# Observations:
#   - Behavior in issue, as reported, was reproduced

# Questions:
#   - Is the behavior expected? (Based on docs, code)
#   - If NOT expected, bug - then we can try to fix
#   - if IS expected, not a bug, but raises the question - should it be changed?
#   - Do we understand what is meant by 'void context' well enough to comment or fix?
 
# Patterns
# Whether enum is [].map, [].filter, [].select:
# - Offenses occur when when nothing is done in the block (nothing more than a value or block variable)
# - NO Offenses occur when something is done in the block

# Link to issue: https://github.com/rubocop/rubocop/issues/6963
# Rubocop documentation on Lint/Void - https://www.rubydoc.info/gems/rubocop/RuboCop/Cop/Lint/Void
