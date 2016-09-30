require( 'pry-byebug' )

def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, cash)
  return shop[:admin][:total_cash] += cash
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, number_sold)
  return shop[:admin][:pets_sold] += number_sold
end

def stock_count(shop)
  return shop[:pets].count
end

def pets_by_breed(shop, breed)
  breed_matches = []
  for pet in shop[:pets]
    if pet[:breed] == breed
      breed_matches << pet[:name]
    end
  end
  return breed_matches
end

def find_pet_by_name(shop, name)  
  result = nil
  for pet in shop[:pets]
    if pet[:name] == name
      result = pet
    end
  end
  return result
end

def remove_pet_by_name(shop, name)
  for pet in shop[:pets]
    if pet[:name] == name
      shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(shop, pet)
  shop[:pets] << pet
end

def customer_pet_count(customer_index)
  return customer_index[:pets].count
end

def add_pet_to_customer(customer_index, pet)
  customer_index[:pets].push(pet)
end

def customer_can_afford_pet(customer_index, pet)
  customer_index[:cash] >= pet[:price]
end

def sell_pet_to_customer(shop, pet, customer_index)
  
  # check pet is available  AND  customer can afford it
  if find_pet_by_name(shop, pet[:name]) != nil
  # && customer_can_afford_pet(customer_index, pet)

    # add pet hash to customer
    add_pet_to_customer(customer_index, pet)
    # increase shop's pets sold value by 1
    increase_pets_sold(shop, 1)
    # add price of pet to shop cash total
    add_or_remove_cash(shop, pet[:price])

  else
    puts "Sorry, no sale."
  end
end