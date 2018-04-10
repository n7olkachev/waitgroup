# WaitGroup

WaitGroup from Go for Crystal

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  waitgroup:
    github: n7olkachev/waitgroup
```

## Usage

```crystal
require "waitgroup"

wg = WaitGroup.new
wg.add 2

spawn do
  sleep 1
  wg.done
end

spawn do
  wg.done
end

wg.wait
puts "Yay!'

```

## Contributing

1. Fork it ( https://github.com/n7olkachev/waitgroup/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [n7olkachev](https://github.com/n7olkachev) n7olkachev - creator, maintainer
