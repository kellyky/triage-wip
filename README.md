Collaboratively triaging:
https://github.com/rubocop/rubocop/issues/6963


#############   NOTES ############
Observations:
  - Behavior in issue, as reported, was reproduced

Questions:
  - Is the behavior expected? (Based on docs, code)
  - If NOT expected, bug - then we can try to fix
  - if IS expected, not a bug, but raises the question - should it be changed?
  - Do we understand what is meant by 'void context' well enough to comment or fix?
 
Patterns
Whether enum is [].map, [].filter, [].select:
- Offenses occur when when nothing is done in the block (nothing more than a value or block variable)
- NO Offenses occur when something is done in the block

Link to issue: https://github.com/rubocop/rubocop/issues/6963
Rubocop documentation on Lint/Void - https://www.rubydoc.info/gems/rubocop/RuboCop/Cop/Lint/Void
