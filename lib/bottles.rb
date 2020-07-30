class Bottles
  def verse(bottles)
    @bottles = bottles
    define_script

    first_verse = "#{@bottles.to_s.capitalize} #{@noun} of beer on the wall, #{@bottles} #{@noun} of beer."

    unless @bottles.is_a?(String)
      decrement_bottles
      update_script

      second_verse = "Take #{@object} down and pass it around, #{@bottles} #{@noun} of beer on the wall."
    else
      @bottles = 99
      second_verse = "Go to the store and buy some more, #{@bottles} #{@noun} of beer on the wall."
    end

    "#{first_verse}\n#{second_verse}\n"
  end

  def verses(first, last)
    song = ""

    first.downto(last) do |bottles|
      song << "#{verse(bottles)}\n"
    end

    song.chop
  end

  def song
    verses(99, 0)
  end

    private

    def decrement_bottles
      @bottles -= 1
    end

    def define_script
      @noun = @bottles != 1 ? "bottles" : "bottle"
      @object = @bottles != 1 ? "one" : "it"
      @bottles = @bottles == 0 ? "no more" : @bottles
    end

    def update_script
      @noun = @bottles != 1 ? "bottles" : "bottle"
      @bottles = @bottles == 0 ? "no more" : @bottles
    end
end