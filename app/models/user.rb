class User < ApplicationRecord

  def self.import(path)
    list = []
    CSV.foreach(path,headers: true) do |row|
      list << {
          name: row["name"],　#カンマ忘れずに
          age: row["age"],  #スペルミス気をつけて
          address: row["address"]
        }
    end

    #begin

     puts "インポート開始"
     User.create!(list)
     puts "インポートに成功しました"
    rescue ActiveModel::unknownAttributeError => invalid

     puts "インポートに失敗しました:#{invalid}"

    #end

  end

end
