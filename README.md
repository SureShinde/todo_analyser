# TodoAnalyser
The goal of the project is to build a command line tool.

Using Ruby, write a command line tool that consumes the first `20` `even` numbered TODO's in most performant way and output the `title` and whether it is `completed` or not.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Installation (as library)

Install the gem and add to the application's Gemfile by executing:

    $ bundle add todo_analyser

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install todo_analyser

## Usage

### Option 1: Console Command

    $ bin/console -h # To display information about command arguments
    $ bin/console <URL> [OPTIONS]
    $ OPTIONS: -n, --number N [Number of TODOs to consume (default: 20)]

### Option 2: Standalone Command
    $ run/todo_analyser.rb -h # To display information about command arguments
    $ run/todo_analyser.rb <URL> [OPTIONS]

### Example: Option 1
    $ bin/console https://jsonplaceholder.typicode.com/todos
    $ bin/console -n 10 https://jsonplaceholder.typicode.com/todos

### Example: Option 2
    $ run/todo_analyser.rb https://jsonplaceholder.typicode.com/todos
    $ run/todo_analyser.rb -n 10 https://jsonplaceholder.typicode.com/todos


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sureshinde/todo_analyser. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/sureshinde/todo_analyser/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TodoAnalyser project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/sureshinde/todo_analyser/blob/master/CODE_OF_CONDUCT.md).
