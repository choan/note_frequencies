require 'test/unit'
require 'note_frequencies'

class NoteFrequenciesTest < Test::Unit::TestCase
  def test_round_up
    assert_equal 333.34, NoteFrequencies.round(333.335, 2)
  end
  
  def test_round_down
    assert_equal 333.33, NoteFrequencies.round(333.334, 2)
  end
  
  def test_a_from_delta
    assert_equal 440, NoteFrequencies.frequency(0)
  end
  
  def test_low_a_from_delta
    assert_equal 220, NoteFrequencies.frequency(-12)
  end

  def test_high_a_from_delta
    assert_equal 880, NoteFrequencies.frequency(12)
  end
  
  def test_e_from_delta
    assert_equal 329.63, NoteFrequencies.frequency(-5)
  end
  
  def test_delta_octave
    assert_equal(0, NoteFrequencies.delta_from_name("a'"))
    assert_equal(12, NoteFrequencies.delta_from_name("a''"))
    assert_equal(-12, NoteFrequencies.delta_from_name("a"))
    assert_equal(-24, NoteFrequencies.delta_from_name("a,"))
    assert_equal(-36, NoteFrequencies.delta_from_name("a,,"))
  end
  
  def test_delta_alt
    assert_equal(1, NoteFrequencies.delta_from_name("ais'"))
    assert_equal(1, NoteFrequencies.delta_from_name("a#'"))
    assert_equal(-1, NoteFrequencies.delta_from_name("aes'"))
    assert_equal(-1, NoteFrequencies.delta_from_name("ab'"))
  end
  
  def test_delta_double_alt
    assert_equal(2, NoteFrequencies.delta_from_name("aisis'"))
    assert_equal(2, NoteFrequencies.delta_from_name("ax'"))
    assert_equal(2, NoteFrequencies.delta_from_name("a##'"))
  end
  
  def test_jump_octave
    assert_equal(3, NoteFrequencies.delta_from_name("bis'"))
  end
  
  def test_delta_other
    assert_equal(-9, NoteFrequencies.delta_from_name("c'"))
    assert_equal(-5, NoteFrequencies.delta_from_name("e'"))
  end
  
  def test_delta_enharmonics
    assert_equal(NoteFrequencies.delta_from_name("g#'"), NoteFrequencies.delta_from_name("ab'"))
  end
  
  def test_scientific_octave
    assert_equal(0, NoteFrequencies.delta_from_name('a4'))
    assert_equal(-9, NoteFrequencies.delta_from_name('c4'))
    assert_equal(-12, NoteFrequencies.delta_from_name('a3'))
    assert_equal(12, NoteFrequencies.delta_from_name('a5'))
  end
  
  def test_frequency_from_name
    assert_equal(440, NoteFrequencies.frequency_from_name("a'"))
    assert_equal(880, NoteFrequencies.frequency_from_name("a''"))
    assert_equal(220, NoteFrequencies.frequency_from_name("a"))
    assert_equal(110, NoteFrequencies.frequency_from_name("a,"))
    assert_equal(329.63, NoteFrequencies.frequency_from_name("e'"))
    assert_equal(440, NoteFrequencies.frequency_from_name("gx'"))
  end
  
end