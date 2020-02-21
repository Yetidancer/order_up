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
      @chef_1 = Chef.create(name: "Gordon Ramsay")
      @dish_1 = Dish.create(name: "Mac N Cheese",
                            description: "Cheesy goodness",
                            chef: @chef_1,
                            ingredients: [@ingredient_1, @ingredient_2])
      @dish_2 = Dish.create(name: "Burger",
                            description: "The most american",
                            chef: @chef_1,
                            ingredients: [@ingredient_1, @ingredient_3])
    end

    it 'should show dish details on a dish show page' do
      visit "/dishes/#{@dish_1.id}"

      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.description)
      expect(page).to have_content(@dish_1.chef.name)
      expect(page).to have_content(@dish_1.ingredients[0].name)
      expect(page).to have_content(@dish_1.ingredients[1].name)
    end
    it 'should show dish calories on a dish show page' do
      visit "/dishes/#{@dish_1.id}"

      expect(page).to have_content(300)
      save_and_open_page
    end

  end




end
