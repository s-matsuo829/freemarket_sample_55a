crumb :root do
  link "メルカリ", root_path
end

crumb :user_show do
  link "マイページ", user_path(current_user)
  parent :root
end

crumb :user_edit do
  link "プロフィール", edit_user_path(current_user)
  parent :user_show
end

crumb :card_index do
  link "支払い方法", user_cards_path(current_user)
  parent :user_show
end

crumb :user_mypage_identification do
  link "本人情報の登録", mypage_identification_user_path(current_user)
  parent :user_show
end

crumb :user_logout do
  link "ログアウト", logout_users_path
  parent :user_show
end

crumb :item_show_all do
  link "全ての商品を見る", show_all_items_path
  parent :root
end

crumb :address_edit do
  link "発送元・お届け先住所変更", edit_user_address_path(current_user.id, current_user.address.id)
  parent :user_show
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).