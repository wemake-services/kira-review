# Kira Review Bot

[![wemake.services](https://img.shields.io/badge/%20-wemake.services-green.svg?label=%20&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAABGdBTUEAALGPC%2FxhBQAAAAFzUkdCAK7OHOkAAAAbUExURQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP%2F%2F%2F5TvxDIAAAAIdFJOUwAjRA8xXANAL%2Bv0SAAAADNJREFUGNNjYCAIOJjRBdBFWMkVQeGzcHAwksJnAPPZGOGAASzPzAEHEGVsLExQwE7YswCb7AFZSF3bbAAAAABJRU5ErkJggg%3D%3D)](https://wemake.services)
[![kira-family](https://img.shields.io/badge/kira-family-pink.svg)](https://github.com/wemake-services/kira)
[![Dependencies Status](https://img.shields.io/badge/dependencies-up%20to%20date-brightgreen.svg)](https://github.com/wemake-services/kira-release/pulls?utf8=%E2%9C%93&q=is%3Apr%20author%3Aapp%2Fdependabot)

Automate routine work with reviewing Merge Requests.

Part of the [`@kira`](https://github.com/wemake-services/kira) bots family.


## How does it work?

We automate all neat-picking about code style and quality with linters and tools.
But how can you automate things like making a MR to the right branch?

That's where this bot shines!

We leverage `danger` gem to make sure
that our developers stick to the [`rsdp`](https://wemake.services/meta/) process.

To know all rules we use, read through the `Dangerfile` list.
New rules are welcome!


## Gitlab CI setup

Then have a look at the example `.gitlab-ci.yml` file.
You will need to copy the `review` job and make it a part of your MR pipeline.

### Environment variables

You would need to set:
- `DANGER_GITLAB_API_TOKEN` token

Optional variables:
- `DANGER_PLATFORMS` defines a set of platform specific rules, see [`danger-platforms/`](https://github.com/wemake-services/kira-review/tree/master/danger-platforms) for more information, eg: `elixir,node`
