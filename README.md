# Dalli Extension: Spymemcached

Memcached clients all use their own way of deciding which server from a list
of configured servers a specific key should be stored on. Hence different
memcached libraries often don't work too well together.

This gem changes [Dalli][]'s server hashing algorithm to match that of the
[Spymemcached][] Java client.

## Usage

```ruby
require 'dalli'
require 'dalli-ext-spymemcached'
```

[dalli]: https://github.com/mperham/dalli
[spymemcached]: http://code.google.com/p/spymemcached/

## Licence

(The MIT License)

Copyright (c) 2012 Global Personals, Ltd.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.