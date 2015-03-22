require 'faker'
Product.delete_all
Category.delete_all


cat_1 = Category.create!(
    name: "Для женщин",
    page_title: "Женская продукция",
    description: Faker::Lorem.paragraph(15)
)
cat_2 = Category.create!(
    name: "Для мужчин",
    page_title: "Мужская продукция",
    description: Faker::Lorem.paragraph(15)
)

cat_3 = Category.create!(
    name: "Для детей",
    page_title: "Детская продукция",
    description: Faker::Lorem.paragraph(15)

)

[cat_1, cat_2, cat_3].each do |cat|
  ["Одежда", "Обувь", "Аксессуары"].each do |sub_cat_name|
    sub_cat = Category.create!(
                name: sub_cat_name,
                page_title: cat.page_title + " : " + sub_cat_name,
                description: Faker::Lorem.paragraph(15)
    ).move_to_child_of(cat)
    4.times do
      sub_sub_cat_name = Faker::Commerce.department
      category = Category.create!(
                  name: sub_sub_cat_name,
                  page_title: cat.page_title + " : " + sub_sub_cat_name,
                  description: Faker::Lorem.paragraph(15)
      ).move_to_child_of(sub_cat)

      4.times do
        Product.create!(
            title: Faker::Commerce.product_name,
            description: Faker::Lorem.sentence,
            price: Faker::Commerce.price,
            leaf_category_id: category.id
        ).assign_to_branch
      end
    end
  end

end