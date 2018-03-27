require 'card'

describe Card do

  def card(params = {})
    defaults = {
        suit: :hearts,
        rank: 7,
    }

    Card.new(**defaults.merge(params))
  end

  it 'has a suit' do
    raise unless card(suit: :spades).suit == :spades
  end

  it 'has a rank' do
    raise unless card(rank: :queen).rank == 12
  end

  it 'is equal to itself' do
    subject = card(suit: :spades, rank: 4)
    other   = card(suit: :spades, rank: 4)

    raise unless subject == other
  end

  describe 'a jack' do
    it 'ranks higher than a 10' do
      lower = card(rank: 10)
      higher = card(rank: :jack)

      raise unless higher.rank > lower.rank
    end
  end

  describe 'a queen' do
    it 'ranks higher than a jack' do
      lower = card(rank: :jack)
      higher = card(rank: :queen)

      raise unless higher.rank > lower.rank
    end
  end

  describe 'a king' do
    it 'ranks higher than a queen' do
      lower = card(rank: :queen)
      higher = card(rank: :king)

      raise unless higher.rank > lower.rank
    end
  end

end