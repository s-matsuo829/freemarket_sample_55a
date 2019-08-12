# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

attack_items = Category.create(:name => "武器")
protect_items = Category.create(:name => "防具")

attack_items_sword = attack_items.children.create(:name => "剣")
attack_items_stick = attack_items.children.create(:name => "魔法の杖")
attack_items_missile = attack_items.children.create(:name => "飛び道具")

protect_items_armor = protect_items.children.create(:name => "鎧")
protect_items_shield = protect_items.children.create(:name => "盾")
protect_items_helmet = protect_items.children.create(:name => "兜")

attack_items_sword.children.create([{:name => "鋼の剣"},{:name => "呪いの剣"},{:name => "棒きれ"},{:name => "エックスカリバー"}])
attack_items_stick.children.create([{:name => "大魔導士の杖"},{:name => "賢者の杖"},{:name => "錫杖"},{:name => "棒きれ"}])
attack_items_missile.children.create([{:name => "鎖鎌"},{:name => "モーニングスター"},{:name => "伯方の塩"},{:name => "漬物石"}])

protect_items_armor.children.create([{:name => "勇者の鎧"},{:name => "ふんどし"},{:name => "跳び箱"},{:name => "ユニクロTシャツ(北斎シリーズ)"}])
protect_items_shield.children.create([{:name => "王者の盾"},{:name => "ちゃぶ台"},{:name => "Macbook air"},{:name => "フライパン"}])
protect_items_helmet.children.create([{:name => "いにしえの兜"},{:name => "コック帽"},{:name => "三角巾"},{:name => "赤白帽"}])