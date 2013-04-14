# NoteFrequencies

A library to get frequencies from pitch names. Mainly:

    NoteFrequencies.frequency_from_name("e'") # => 326.93

The naming accepts both Helmholtz (middle C is `c'`) and scientific notacion (middle C is `c4`).

Alterations accepted include Lilypond’s style (`es`, `is`, `eses`, `isis`) and ASCII style (`b`, `#`, `bb`, `##`, `x`).

## Installation

Add this line to your application's Gemfile:

    gem 'note_frequencies'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install note_frequencies

## Usage

To get the frequency from a named note:

    NoteFrequencies.frequency_from_name("e'") # => 326.93

To get the frequency from a delta (from middle A)

    NoteFrequencies.frequency_from_delta(-5) # => 326.93

Fork tuning is configurable:

    NoteFrequencies.frequency_from_name("a", :tuning => 443) # => 221.5
    
Frequencies are rounded by default to 2 decimal places. Should you need more precission:

    NoteFrequencies.frequency_from_name("e'", :round => 5) # => 329.62756 
    

Both scientific notation and Helmholtz’s notation are accepted:

    NoteFrequencies.frequency_from_name("a4") # => 440.0
    NoteFrequencies.frequency_from_name("a'") # => 440.0

Alterations are accepted as `b` (flat), `bb` (double flat), `es` (flat), `eses` (double flat), `#` (sharp), `##` (double sharp), `x` (double sharp), `is` (sharp) and `isis` (double sharp).


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
