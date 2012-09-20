# IArea

find open i-area from latitude, longitude.

## What's Open i-Area?

http://www.nttdocomo.co.jp/service/developer/make/content/iarea/domestic/index.html

## Usage

```
require 'iarea'

iarea = IArea.find(35.490981,139.667322)
p iarea.code #=> 078
p iarea.subcode #=> 10
p iarea.name #=> 川崎/鶴見
p iarea.prefecture # => 神奈川

```


## Installation

Add this line to your application's Gemfile:

    gem 'iarea',:git => this_repository

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iarea

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
