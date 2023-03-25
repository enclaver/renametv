# Renametv

Renametv is an executable that renames all files in the working directory that match a pattern for being a tv show file (`s01e02`)
This will make your directory slightly prettier, but more importantly, it will make your subtitle files match the show file names, so most player will autoload the subtitle file.

For example:
```
That.Tv.Show.S01E02.The.Best.Episode.mkv -> that_tv_show_s01e02.mkv
that tv show s01e02 the best episode.srt -> that_tv_show_so1e02.srt
```

Obviously, the nature of this gem (renaming files in your file system) makes it very dangerous. And at this point, it is not really tested. So, I advise you run it in a sandbox. Or real the source first, it's not big. In the future, I will test it significantly more, as I use it.

## Installation

    $ gem install renametv

This should add `renametv` to your PATH as well.

## Usage

Change the working directory to the one containing the files you want renamed

    $ renametv --dry-run

To see all the renames that will happen

    $ renametv

To actually rename the files

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/enclaver/renametv. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/enclaver/renametv/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the Renametv project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/enclaver/renametv/blob/master/CODE_OF_CONDUCT.md).
