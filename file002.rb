def deal(number_of_cards)
  faces = ["Jack", "Queen", "King", "Ace"]
  suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
  1.upto(number_of_cards) do
    if block_given?
      random_face = faces.sample
      random_suit = suits.sample
      result = yield(random_face, random_suit)
      puts "You scored a #{result}!"
    else
      puts "No deal!"
    end
  end
end

deal(2) do |face, suit|
  puts "Dealt a #{face} of #{suit}"
  face.length + suit.length
end
