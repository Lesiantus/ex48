require "./lib/lexicon.rb"
require "test/unit"

class TestLexicon < Test::Unit::TestCase
  def test_directions()
    assert_equal(Fear.scan("north"), [['direction', 'north']])
    result = Fear.scan("north south east")

    assert_equal(result, [['direction', 'north'],
           ['direction', 'east'],
           ['direction', 'south']])
  end

  def test_verbs()
    assert_equal(Fear.scan("go"), [['verb', 'go']])
    result = Fear.scan("go kill eat")
    assert_equal(result, [['verb', 'go'],
           ['verb', 'eat'],
           ['verb', 'kill']])
  end

  def test_stops()
    assert_equal(Fear.scan("the"), [['stop', 'the']])
    result = Fear.scan("the in of")
    assert_equal(result, [['stop', 'the'],
           ['stop', 'of'],
           ['stop', 'in']])
  end

  def test_nouns()
    assert_equal(Fear.scan("bear"), [['noun', 'bear']])
    result = Fear.scan("bear princess")
    assert_equal(result, [['noun', 'bear'],
           ['noun', 'princess']])
  end

  def test_numbers()
    assert_equal(Fear.scan("1234"), [['number', 1234]])
    result = Fear.scan("3 91234")
    assert_equal(result, [['number', 3],
           ['number', 91234]])
  end

  def test_errors()
    assert_equal(Fear.scan("ASDFADFASDF"), [['error', 'ASDFADFASDF']])
    result = Fear.scan("bear IAS princess")
    assert_equal(result, [['noun', 'bear'],
           ['noun', 'princess'],
           ['error', 'IAS']])
  end

end
