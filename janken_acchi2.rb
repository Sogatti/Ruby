def get_input(options)
  loop do
    print "ほい！　（#{options.map.with_index { |o, i| "#{i}:#{o}" }.join(",")}）:"
    input = gets.chomp
    if input.match?(/^\d+$/) && input.to_i.between?(0, options.size - 1)
    return input.to_i
    else
    puts "不正な値です。0~#{options.size - 1}の数字を入力してください。"
    end
  end
end

hands = ["グー","チョキ","パー"]
directions = ["上","右","下","左"]

loop do
  puts "\n じゃんけん、、、"
  player_hand = get_input(hands)
  computer_hand = rand(3)
    
  puts "わたし: #{hands[player_hand]}を出しました"
  puts "コンピュータ: #{hands[computer_hand]}を出しました"
    
  if player_hand == computer_hand
    puts "あいこだ！もうひと勝負！"
    next
    elsif (player_hand == 0 && computer_hand == 1) ||
        (player_hand == 1 && computer_hand == 2) ||
        (player_hand == 2 && computer_hand == 0)
        winner = "わたし"
        loser = "コンピュータ"
    else
        winner = "コンピュータ"
        loser = "わたし"
    end
    
    #---あっち向いてホイ---
puts "あっち向いて〜"
puts "---------------"
  if winner == "あなた"
    puts "指を差したい方向はどっちですか？"
    player_direction = get_input(directions)
    computer_direction = rand(4)
        
    puts "わたし（指差し）: #{directions[player_direction]}"
    puts "コンピュータ（顔の向き）: #{directions[computer_direction]}"
        
    if player_direction == computer_direction
        puts "\n#{winner}の勝ち！🥳"
        break
    else
        puts "勝敗は持ち越し。"
    end
    
    else
        computer_direction = rand(4)
       #puts "コンピュータ(指差し) : #{directions[computer_direction]}"

    puts"顔を向ける方向を選んでください"
    player_direction = get_input(directions)

    puts "わたし（顔の向き）: #{directions[player_direction]}"
    puts "コンピュータ（顔の向き）: #{directions[computer_direction]}"

    if player_direction == computer_direction
      puts "\n#{winner}の勝ち！おめでとう！🥳"
      break
    else
      puts "勝敗は持ち越し。ワンモアじゃんけん✊✌️ ✋"
    end
  end
end
