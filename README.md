![plumbus_http: An HTTP driver for plumbus_http](https://raw.githubusercontent.com/sotownsend/plumbus_http/master/docs/images/banner.png)

[![Gem Version](https://badge.fury.io/rb/iarrogant.svg)](http://badge.fury.io/rb/plumbus_http)
[![Build Status](https://travis-ci.org/sotownsend/plumbus_http.svg)](https://travis-ci.org/sotownsend/plumbus_http)
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/sotownsend/plumbus_http/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
[![License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/sotownsend/plumbus_http/blob/master/LICENSE)

# What is this?

Plubus HTTP is a driver for [Plumbus](httsp://github.com/sotownsend/plumbus).

## Installation
Run `gem install plumbus_http`

## Configuration
Configure is handled through a ruby file. This file contains a listing of `ports` which are just driver instances that are declared on either the request or response side.
```ruby
port(:request, 'plumbus_http') do
  #Driver specific config
end

port(:response, 'plumbus_http') do
  #Driver specific config
end
```

---

## FAQ

### When should I use plumbus?

Todo

### Creator

- [Seo Townsend](http://github.com/sotownsend) ([@seotownsend](https://twitter.com/seotownsend))


## License

plumbus is released under the MIT license. See LICENSE for details.
