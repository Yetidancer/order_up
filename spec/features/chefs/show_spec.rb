require 'rails_helper'

RSpec.describe 'Dish Show Page', type: :feature do

  context 'as a visitor' do
    before(:each) do
      @ingredient_1 = Ingredient.create(name: "Cheese",
                                        calories: 200)
      @ingredient_2 = Ingredient.create(name: "Pasta",
                                        calories: 100)
      @ingredient_3 = Ingredient.create(name: "Meat",
                                        calories: 300)
      @dish_1 = Dish.create(name: "Mac N Cheese",
                            description: "Cheesy goodness",
                            chef: @chef_1,
                            ingredients: [@ingredient_1, @ingredient_2])
      @dish_2 = Dish.create(name: "Burger",
                            description: "The most american",
                            chef: @chef_1,
                            ingredients: [@ingredient_1, @ingredient_3])
      @chef_1 = Chef.create(name: "Gordon Ramsay",
                            dishes: [@dish_1, @dish_2])
    end

    it 'should have link to ingredients list' do
      visit "/chefs/#{@chef_1.id}"

      expect(page).to have_content(@chef_1.name)
      click_link("Ingredients Used")
      expect(page).to have_content(@dish_1.ingredients[0].name)
      expect(page).to have_content(@dish_1.ingredients[1].name)
      expect(page).to have_content(@dish_2.ingredients[0].name)
      expect(page).to have_content(@dish_2.ingredients[1].name)
    end
  end
end
