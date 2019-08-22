# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ladies_items = Category.create(name: "レディース")
men_items = Category.create(name: "メンズ")

ladies_items_top = ladies_items.children.create(name: "トップス")
ladies_items_jacket = ladies_items.children.create(name: "ジャケット/アウター")
ladies_items_skirt = ladies_items.children.create(name: "スカート")

men_items_shoes = men_items.children.create(name: "靴")
men_items_bags = men_items.children.create(name: "バッグ")
men_items_suits = men_items.children.create(name: "スーツ")

ladies_items_top.children.create([{name: "ポロシャツ"},{name: "キャミソール"},{name: "タンクトップ"},{name: "ホルターネック"}])
ladies_items_jacket.children.create([{name: "テーラードジャケット"},{name: "ノーカラージャケット"},{name: "レザージャケット"},{name: "ダウンジャケット"}])
ladies_items_skirt.children.create([{name: "ミニスカート"},{name: "ひざ丈スカート"},{name: "ロングスカート"},{name: "キュロット"}])

men_items_shoes.children.create([{name: "スニーカー"},{name: "サンダル"},{name: "ブーツ"},{name: "モカシン"}])
men_items_bags.children.create([{name: "ショルダーバッグ"},{name: "トートバッグ"},{name: "ボストンバッグ"},{name: "リュック/バックパック"}])
men_items_suits.children.create([{name: "スーツジャケット"},{name: "スーツベスト"},{name: "スラックス"},{name: "セットアップ"}])