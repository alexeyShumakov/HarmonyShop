Product.delete_all
Category.delete_all

Product.create!(
    title: "Футболка",
    description: "Хорошая футболка",
    price: 700
)
Product.create!(
    title: "Рубаха",
    description: "Хорошая рубаха",
    price: 800
)

Product.create!(
    title: "Майка",
    description: "Хорошая майка",
    price: 450
)
Product.create!(
    title: "Джинсы",
    description: "Хорошие джинсы",
    price: 1200
)

cat_1 = Category.create!(
    name: "Для женщин",
    page_title: "Женская продукция"
)
cat_2 = Category.create!(
    name: "Для мужчин",
    page_title: "Мужская продукция"
)

cat_3 = Category.create!(
    name: "Для детей",
    page_title: "Детская продукция"
)

[cat_1, cat_2, cat_3].each do |cat|
  ["Одежда", "Обувь", "Аксессуары"].each do |sub_cat_name|
    sub_cat = Category.create!(
                name: sub_cat_name,
                page_title: cat.page_title + " : " + sub_cat_name
    ).move_to_child_of(cat)
    ["Категория 1", "Категория 2", "Категория 3"].each do |sub_sub_cat_name|
      Category.create!(
                  name: sub_sub_cat_name,
                  page_title: cat.page_title + " : " + sub_sub_cat_name
      ).move_to_child_of(sub_cat)
    end
  end

end