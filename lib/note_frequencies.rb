require "note_frequencies/version"

module NoteFrequencies

  DEFAULT_TUNING = 440
  DEFAULT_ROUND = 2
  
  # frequency from delta
  def self.frequency(delta_from_a, conf = {})
    conf = {
      :tuning => DEFAULT_TUNING,
      :round => DEFAULT_ROUND
    }.update(conf)
    tuning = conf[:tuning]
    freq = tuning * (2**(delta_from_a.to_f/12))
    round(freq, conf[:round])
  end
  
  # delta in steps from a' (absolute)
  def self.delta_from_name(name)
    note, alt, octave = name.scan(/([a-g])(eses|isis|bb|##|es|is|b|#|x)?(\d|(,+)|('+))?/).first
    # puts octave.inspect
    octave_delta = if octave
      if octave.start_with?("'")
        octave.length - 1
      elsif octave.start_with?(",")
        -octave.length - 1
      else
        octave.to_i - 4
      end
    else
      -1
    end
    # puts octave_delta.inspect
    alt_delta = if (alt == 'is' || alt == '#')
      1
    elsif (alt == 'isis' || alt == '##' || alt == 'x')
      2
    elsif (alt == 'es' || alt == 'b')
      -1
    else
      0
    end
    delta(note) + alt_delta + 12 * octave_delta
  end
  
  def self.round(q, r)
    pow = 10**r
    (q*pow).round/pow.to_f
  end
  
  # delta in steps from A (relative)
  def self.delta(name)
    @deltas ||= begin
      {
        :a => 0,
        :b => 2,
        :c => -9,
        :d => -7,
        :e => -5, 
        :f => -4,
        :g => -2
      }
    end
    @deltas[name.to_sym]
  end
  
  def self.frequency_from_name(name, conf = {})
    conf = {
      :tuning => DEFAULT_TUNING,
      :round => DEFAULT_ROUND
    }.update(conf)
    frequency(delta_from_name(name), conf)
  end
end
