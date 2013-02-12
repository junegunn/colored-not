# colored-not

![Colored... NOT!](https://github.com/junegunn/colored-not/raw/master/colored-not.jpg)

Toggles methods from [colored gem](https://github.com/defunkt/colored).

## Installation

    gem install colored-not

## Scenario

colored gem will add a bunch of coloring methods to String class.

```ruby
require 'colored'
"Roses are red".red                   # Returns "\e[31mRoses are red\e[0m"
```

OK, but what if we want to dynamically turn off colored output,
without removing calls to those methods scattered all over the code?
`Colored.not!` will replace the added methods with `String#dup`s.

```ruby
require 'colored/not'
Colored.not!
"Roses are red... not!".red           # Returns "Roses are red... not!"
```

We can re-enable the colors.

```ruby
Colored!
"Roses are red again".red             # Returns "\e[31mRoses are red again\e[0m"
```

