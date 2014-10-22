class PokerHand

  def initialize(suit, values)
    @suit = suit
    @values = values
    @score = 0
    @royal_cards = [11, 12, 13, 14, 15]
    @count = Hash.new(0)
  end

  def check_duplicate_suits
    if all_same_suit? && all_royal_cards?
      royal_flush
    elsif all_same_suit? && all_different_cards? && (@values[-1] - @values[0] == 4) && !all_royal_cards?
      straight_flush
    elsif  all_same_suit? && @values != @royal_cards && (@values[-1] - @values[0] != 4)
      flush
    end
  end

  def count_duplicate_card_values
    initialize_counter
    if @count.length == 2 && @count.values.include?(2 && 3)
      full_house
    else
      count_pairs
    end
  end

  def straight
    if !check_duplicate_suits && all_different_cards? && (@values[-1] - @values[0] == 4)
      @score = 4
    end
  end

  def count_pairs
    @count.each_value do |value|
      if value == 4 && @count.values.include?(4)
        four_of_a_kind
      elsif value == 2 && @count.values.count(2) == 2
        two_pairs
      elsif value == 3
        three_of_a_kind
      elsif value == 2
        pair
      end
    end
  end

  def initialize_counter
    @values.each do |value|
      @count[value] += 1
    end
  end

  def all_same_suit?
    @suit.uniq.length == 1
  end

  def all_different_cards?
    @values.uniq.length == 5
  end

  def all_royal_cards?
    @values == @royal_cards
  end

  def royal_flush
    @score = 9
  end

  def straight_flush
    @score = 8
  end

  def four_of_a_kind
    @score = 7
  end

  def full_house
    @score = 6
  end

  def flush
    @score = 5
  end

  def three_of_a_kind
    @score = 3
  end

  def two_pairs
    @score = 2
  end

  def pair
    @score = 1
  end

  def high_card
    @values.max
  end

  def score
    check_duplicate_suits
    straight
    count_duplicate_card_values
    @score
  end

  def hand_name
    if @score == 9
      "Royal Flush"
    elsif @score == 8
      "Straight Flush"
    elsif @score == 7
      "Four of a kind"
    elsif @score == 5
      "Full House"
    elsif @score == 4
      "Flush"
    elsif @score == 3
      "Straight"
    elsif @score == 2
      "Two Pairs"
    else @score == 1
      "Pair"
    end
  end
end