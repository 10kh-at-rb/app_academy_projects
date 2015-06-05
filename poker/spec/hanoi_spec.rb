require 'hanoi'

describe "Hanoi" do
  let(:hanoi) { Hanoi.new }

  it "initializes with 3 towers & 3 discs on 1st tower" do
    expect(hanoi.towers).to eq([[3,2,1],[],[]])
  end


  describe '#render' do
    it "shows initial state at start" do
    display = "tower1: 3 2 1\ntower2: \ntower3: "
      expect(hanoi.render).to eq(display)
    end

    it "shows new state based on a move" do
      hanoi.move(0,1)
      display = "tower1: 3 2\ntower2: 1\ntower3: "
        expect(hanoi.render).to eq(display)
    end

  end

  describe '#move' do
    it "moves a disc from one tower to another" do
      hanoi.move(0,1)
      expect(hanoi.towers).to eq([[3,2],[1],[]])
    end

    it "raises an error if you select an empty tower to move from" do
      expect { hanoi.move(1,0) }.to raise_error("can't select empty tower")
    end
    it "raises an error if bigger disc is moved on top of a smaller disc" do
      hanoi.move(0,1)

      expect do
        hanoi.move(0,1)
      end.to raise_error("can't move a bigger disc onto a smaller disc")
    end

  end

  describe '#won?' do
    it "returns true at if all rods are on the 3rd tower" do
      hanoi.towers = [[], [], [3,2,1]]
      expect(hanoi.won?).to be true
    end

    it "returns true at if all rods are on the 2nd tower" do
      hanoi.towers = [[], [3,2,1], []]
      expect(hanoi.won?).to be true
    end

    it "returns false when the game isn't over" do
      hanoi2 = Hanoi.new
      hanoi2.move(0,1)
      expect(hanoi.won?).to be false
      expect(hanoi2.won?).to be false
    end

  end
end
