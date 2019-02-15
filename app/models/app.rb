class App < ApplicationRecord
    validates( :name, presence: { message: "アプリの名前を入力してください。" } )
    validates( :appid, presence: { message: "アプリIDを入力してください。" }, uniqueness: { message: "そのアプリIDはすでに登録されています。" } )
    validates( :data, presence: { message: "アプリの本体(zipファイル)を選択してください。" } )
end
