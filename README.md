# rubocop-markdown

[RuboCop](https://github.com/rubocop/rubocop) plugin for Ruby code blocks in Markdown.

## Installation

Install the gem and add to the application's Gemfile by executing:

```
bundle add rubocop-markdown
```

If bundler is not being used to manage dependencies, install the gem by executing:

```
gem install rubocop-markdown
```

## Usage

Require `"rubocop-markdown"` in your RuboCop config.

```yaml
# .rubocop.yml
require:
  - rubocop-markdown
```

Now you can use RuboCop also for Ruby code block in Markdown.

```
$ bundle exec rubocop README.md
Inspecting 1 file
W

Offenses:

README.md:69:6: C: [Correctable] Style/NumericPredicate: Use array.size.positive? instead of array.size > 0.
a if array.size > 0
     ^^^^^^^^^^^^^^
README.md:69:6: C: [Correctable] Style/ZeroLengthPredicate: Use !empty? instead of size > 0.
a if array.size > 0
     ^^^^^^^^^^^^^^
README.md:57:1: W: Lint/Void: Literal "a" used in void context.
"a"
^^^
README.md:57:1: C: [Correctable] Style/StringLiterals: Prefer single-quoted strings when you don't need string interpolation or special symbols.
"a"
^^^
README.md:59:1: C: [Correctable] Style/CharacterLiteral: Do not use the character literal - use string literal instead.
?c
^^

1 file inspected, 5 offenses detected, 4 offenses autocorrectable
```

```ruby
# Ruby code block.
"a"
b
?c
```

```
# Not Ruby code block.
"a"
```

```ruby
# Ruby code block.
a if array.size > 0
```
