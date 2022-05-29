class Lexicon
  def initialize()
  end

  def scan(args)
  words = args.split
  puts words.class
  direction_words = ['north', 'south', 'east', 'west', 'down', 'up', 'left', 'right', 'back']
  verbs = ['go', 'stop', 'kill', 'eat']
  stop_words = ['the', 'in', 'of', 'from', 'at', 'it']
  nouns = ['door', 'bear', 'princess', 'cabinet']
  words_arr = []
  while words.length != 0
    words.each do |element|
    if direction_words.include?(element.downcase)
      words_arr.push(["direction", "#{element.downcase}"])
      words.delete(element)
    elsif verbs.include?(element.downcase)
      words_arr.push(["verb", "#{element.downcase}"])
      words.delete(element)
    elsif stop_words.include?(element.downcase)
      words_arr.push(["stop", "#{element.downcase}"])
      words.delete(element)
    elsif nouns.include?(element.downcase)
      words_arr.push(["noun", "#{element.downcase}"])
      words.delete(element)
    elsif Integer(element, exception: false)
      words_arr.push(["number", element.to_i])
      words.delete(element)
    else
      words_arr.push(["error", "#{element}"])
      words.delete(element)
    end
  end
  end
  p words_arr
  return words_arr
  end
end


=begin
Direction words: north, south, east, west, down, up, left, right, back
Verbs: go, stop, kill, eat
Stop words: the, in, of, from, at, it
Nouns: door, bear, princess, cabinet
Numbers: any string of 0 through 9 characters
=end

Fear = Lexicon.new()
Fear.scan("noRth 1 gavno 2 sOUth")
