require 'faker'
Product.delete_all
Category.delete_all
Color.delete_all
ProductsColor.delete_all
Size.delete_all
Service.delete_all
ServicesGroup.delete_all
LineItem.delete_all
Cart.delete_all
SizeHelper.delete_all
User.delete_all

admin = User.new( :name => 'John Doe',
              :email => 'example@gmail.com',
              :password => 'topsecret',
              :password_confirmation => 'topsecret',
              :role => 1)
admin.skip_confirmation!
admin.save!
(10..13).to_a.each do |size|
  Size.create!(
           name: size,
           code: size
  )
end

%w(red green blue coral purple).each do |color|
  Color.create!(
           name: color,
           code: color
  )
end

about = ServicesGroup.create!(
   title: 'About',
   name: 'About'
)
help = ServicesGroup.create!(
  title: 'Help',
  name: 'Help'
)

@size_helper = SizeHelper.create!(
    title: Faker::Name.first_name,
    body: Faker::Lorem.paragraph
)

5.times do
  service = Service.create!(
     title: Faker::Name.first_name,
     body: Faker::Lorem.paragraph(6)
  )
  service1 = Service.create!(
      title: Faker::Name.first_name,
      body: Faker::Lorem.paragraph(6)
  )
  help.services << service
  about.services << service1
end

colors = Color.all

sizes = Size.all

cat_1 = Category.create!(
    name: 'Для женщин',
    page_title: 'Женская продукция',
    description: Faker::Lorem.paragraph(15)
)
cat_2 = Category.create!(
    name: 'Для мужчин',
    page_title: 'Мужская продукция',
    description: Faker::Lorem.paragraph(15)
)

cat_3 = Category.create!(
    name: 'Для детей',
    page_title: 'Детская продукция',
    description: Faker::Lorem.paragraph(15)

)

[cat_1, cat_2, cat_3].each do |cat|
  %w(Одежда Обувь Аксессуары).each do |sub_cat_name|
    sub_cat = Category.create!(
                name: sub_cat_name,
                page_title: cat.page_title + ' : ' + sub_cat_name,
                description: Faker::Lorem.paragraph(15)
    ).move_to_child_of(cat)
    3.times do
      sub_sub_cat_name = Faker::Commerce.department
      category = Category.create!(
                  name: sub_sub_cat_name,
                  page_title: cat.page_title + ' : ' + sub_sub_cat_name,
                  description: Faker::Lorem.paragraph(15)
      ).move_to_child_of(sub_cat)

      2.times do
        @product = Product.create(
            title: Faker::Commerce.product_name,
            description: Faker::Lorem.sentence,
            price: Faker::Commerce.price,
            leaf_category_id: category.id,
            article: Faker::Number.number(8)
        )

        @size_helper.product << @product

            colors.each do |color|
          @product.colors << color
        end

        @product.products_colors.each do |prod_color|
          sizes.each do |size|
            prod_color.sizes << size
          end
        end

        @product.assign_to_branch
      end
    end
  end

end