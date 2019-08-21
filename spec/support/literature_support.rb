module LiteratureSupport
  def literature_in(literature)
    click_link "新規作成"
    fill_in "著者", with: literature.author
    fill_in "タイトル/論文/記事名", with: literature.title
    click_button "保存"
  end
end
