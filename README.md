# NoteFrequencies

A library to get frequencies from pitch names. Mainly:

    NoteFrequencies.frequency_from_name("e'") # => 326.93

The naming accepts both Helmholtz (middle C is c') and scientific notacion (middle C is c4).

Alterations accepted include Lilypond’s style (`es`, `is`, `eses`, `isis`) and ASCII style (`b`, `#`, `bb`, `##`, `x`).

## Installation

Add this line to your application's Gemfile:

    gem 'note_frequencies'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install note_frequencies

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
