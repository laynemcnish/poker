require 'spec_helper'

describe PokerHand do

  it "can score a royal flush" do
    expect(PokerHand.new(["S","S","S","S","S"],[11,12,13,14,15]).score).to eq(8)
    expect(PokerHand.new(["H","H","H","H","H"],[11,12,13,14,15]).score).to eq(8)
    expect(PokerHand.new(["D","D","D","D","D"],[11,12,13,14,15]).score).to eq(8)
    expect(PokerHand.new(["C","C","C","C","C"],[11,12,13,14,15]).score).to eq(8)
  end

  it "can score a straight flush" do
    expect(PokerHand.new(["S","S","S","S","S"],[4,5,6,7,8]).score).to eq(7)
    expect(PokerHand.new(["H","H","H","H","H"],[7,8,9,10,11]).score).to eq(7)
    expect(PokerHand.new(["S","S","S","S","S"],[1,2,3,4,5]).score).to eq(7)
    expect(PokerHand.new(["C","C","C","C","C"],[9,10,11,12,13]).score).to eq(7)
  end

  it "can score a four of a kind" do
    expect(PokerHand.new(["S","D","C","H","S"],[4,4,4,4,5]).score).to eq(6)
    expect(PokerHand.new(["C","C","C","C","C"],[11,11,11,11,12]).score).to eq(6)
    expect(PokerHand.new(["S","D","C","H","S"],[3,3,3,3,4]).score).to eq(6)
    expect(PokerHand.new(["S","D","C","H","S"],[4,4,4,4,5]).score).to eq(6)
  end

  it "can score a full house" do
    expect(PokerHand.new(["S","D","C","H","S"],[3,3,3,4,4]).score).to eq(5)
    expect(PokerHand.new(["C","C","C","C","C"],[3,3,3,4,4]).score).to eq(5)
    expect(PokerHand.new(["S","D","C","H","S"],[11,11,11,12,12]).score).to eq(5)
    expect(PokerHand.new(["C","C","C","C","C"],[13,13,14,14,14]).score).to eq(5)
  end

  it "can score a flush" do
    expect(PokerHand.new(["S","S","S","S","S"],[3,2,7,9,4]).score).to eq(4)
    expect(PokerHand.new(["H","H","H","H","H"],[1,2,3,6,7]).score).to eq(4)
    expect(PokerHand.new(["D","D","D","D","D"],[5,7,8,10,11]).score).to eq(4)
    expect(PokerHand.new(["C","C","C","C","C"],[3,5,7,8,10]).score).to eq(4)
  end

  it "can score a straight" do
    expect(PokerHand.new(["S","H","C","D","S"],[1,2,3,4,5]).score).to eq(3)
    expect(PokerHand.new(["S","H","C","D","S"],[10,11,12,13,14]).score).to eq(3)
    expect(PokerHand.new(["S","H","C","D","S"],[11,12,13,14,15]).score).to eq(3)
    expect(PokerHand.new(["S","H","C","D","S"],[6,7,8,9,10]).score).to eq(3)
  end

  it "can score a three of a kind" do
    expect(PokerHand.new(["S","H","C","D","S"],[3,3,3,4,5]).score).to eq(2)
    expect(PokerHand.new(["S","H","C","D","S"],[1,2,3,3,3]).score).to eq(2)
    expect(PokerHand.new(["S","H","C","D","S"],[4,5,5,5,6]).score).to eq(2)
    expect(PokerHand.new(["S","H","C","D","S"],[11,11,11,13,14]).score).to eq(2)
  end

  it "can score one pair" do
    expect(PokerHand.new(["S","H","C","D","S"],[3,3,6,4,5]).score).to eq(1)
    expect(PokerHand.new(["S","H","C","D","S"],[1,1,2,3,4]).score).to eq(1)
    expect(PokerHand.new(["S","H","C","D","S"],[1,3,5,11,11]).score).to eq(1)
    expect(PokerHand.new(["S","H","C","D","S"],[5,6,10,10,12]).score).to eq(1)
  end

  it "can find the highest value" do
    expect(PokerHand.new(["S","H","C","D","S"],[3,3,6,4,5]).high_card).to eq(6)
    expect(PokerHand.new(["S","H","C","D","S"],[5,6,10,10,12]).high_card).to eq(12)
  end

end