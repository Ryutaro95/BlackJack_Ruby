# Mind: このクラスにはプレイヤーとディーラーの共通で使うメソッドを入れたい
class PlayerBase
  # 山札から2枚配る
  def create_hand(deck)
    deck.pop(2)
  end

  # 手札の数字を表示用の役に変換（非破壊的）
  def to_role(hand)#card_for_display(hand)
    show_cards = []
    hand.each do |card|
      case card[1]
      when 1
        num = "A"
        show_cards << [card[0], num]
      when 11
        num = "J"
        show_cards << [card[0], num]
      when 12
        num = "Q"
        show_cards << [card[0], num]
      when 13
        num = "K"
        show_cards << [card[0], num]
      else
        show_cards << card
      end
    end
    show_cards
  end

  


  # 手札の得点を返す（計算用に変換されてから処理が始まる）
  def point_for_display(hand)
    point = to_calculation_card_number(hand)
    point.inject(0){ |sum, card| sum += card[1] }
  end

  # TODO: このクラスに必要？か考える
  # def blackjack?(point)
  #   if point == 21
  #     true
  #   else
  #     false
  #   end
  # end

  
  # TODO: このクラスに必要？か考える
  # def draw(deck)
  #   deck.pop
  # end

  # TODO: このクラスに必要？か考える
  # def burst?(point)
  #   if point >= 22
  #     true
  #   else
  #     false
  #   end
  # end

  # TODO: このクラスに必要？か考える
  # def self.result(user, dealer)
  #   if user < dealer
  #     puts "ディーラーの勝利"
  #   elsif user == dealer
  #     puts "同点です"
  #   else
  #     puts "プレイヤーの勝利"
  #   end
  # end
  def draw(deck)
    deck.pop
  end

  private

  # 手札を計算用に変換（非破壊的）
  def to_calculation_card_number(cards)
    # 計算ように変換したカードを格納する配列
    calculation_cards = []
    cards.each do |card|
      case card[1]
        when 11, 12, 13
          num = 10
          calculation_cards << [card[0], num]
        else 
          calculation_cards << card
      end
    end
    calculation_cards
  end


end

class Player < PlayerBase

  # プレイヤーのカードを公開用に変換した文字列を返す
  def show_hand(hand)
    user_hand = to_role(hand)
    cards = []
    user_hand.each do |card|
      cards << "#{card[0]}の#{card[1]}"
    end
    cards.join(' | ')
  end

  # ユーザーの回答内容によって真偽値が返る
  def draw?
    user_input = users_input_answer
    if user_input == "Y"
      true
    else
      false
    end
  end

  private

  # ユーザーに回答を求める
  def users_input_answer
    puts "カードを引きますか？引く場合はYを、引かない場合はNを入力してください"
    input = gets.upcase.chomp
    unless input == "Y" || input == "N"
      loop do
        puts "入力が不正です。カードを引く場合はYを、引かない場合はNを入力して下さい"
        input = gets.upcase.chomp
        break if input == "Y" || input == "N"
      end
    end
  end
end


class Dealer < PlayerBase
  def draw?(point)
    point < 17 ? true : false
  end

  def secret_show_card(hand)
    cards = []
    hand.map {|card| cards << card.join("の")}
    "ディーラーの手札: | #{cards[0]} | ******** |"
  end
end