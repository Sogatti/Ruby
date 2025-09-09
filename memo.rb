require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

memo_type = nil


loop do
    puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
    memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています
    break if  [1, 2].include?(memo_type)
    puts "不正な値です。　1 か 2 を入力してください。"
end





if memo_type == 1
    
    puts "新規メモを作成します。拡張子を除いたファイル名を入力:"
    file_name = gets.chomp
    
    puts "メモしたい内容を複数行入力。Ctrl + D で終了"
    memo_content = readlines.map(&:chomp)
    
    CSV.open("#{file_name}.csv" , "w") do |csv|
        memo_content.each { |line| csv << [line] }
    end
    puts "#{file_name}.csv に新規メモを保存しました。"

elsif memo_type == 2
  
  puts "編集したいメモのファイル名を拡張子を除いて入力してください:"
  file_name = gets.chomp

  if File.exist?("#{file_name}.csv")
      puts "現在の内容は以下です"
      puts File.readlines("{file_name}.csv")
      
      puts "追記する内容を複数行入力してください。Ctrl + D / Ctrl + Z　で終了します:"
      memo_content = readlines.map(&:chomp)
      
      CSV.open("#{file_name}.csv","a") do |csv|
          memo_content.each { |line| csv << [line] }
      end
      puts "#{file_name}.csv に追記しました。"
  else
    puts "指定されたファイルは存在しません。"
  end
end

