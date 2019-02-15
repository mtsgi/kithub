class App < ApplicationRecord
    validates( :name, presence: { message: "アプリの名前を入力してください。" } )
    validates( :appid, presence: { message: "アプリIDを入力してください。" }, uniqueness: { message: "そのアプリIDはすでに登録されています。" } )
    validates( :author, presence: { message: "アプリの作者名を入力してください。" } )
    validates( :data, presence: { message: "アプリの本体(zipファイル)を選択してください。" } )
    class << self
        def search(q)
            rel = order("created_at")
            rel = rel.where("name LIKE ? OR appid LIKE ?OR author LIKE ?", "%#{q}%", "%#{q}%", "%#{q}%")
            rel
        end
    end
end
