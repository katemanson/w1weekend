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
  matches_by_breed = []
  for pet in shop[:pets]
    if pet[:breed] == breed
      matches_by_breed << pet[:name]
    end
  end
  return matches_by_breed
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
  customer_index[:pets] << pet
end

def customer_can_afford_pet(customer_index, pet)
  customer_index[:cash] >= pet[:price]
end

def sell_pet_to_customer(shop, pet, customer_index) 
  if pet != nil && customer_can_afford_pet(customer_index, pet)

    add_pet_to_customer(customer_index, pet)
    remove_pet_by_name(shop, pet[:name])
    increase_pets_sold(shop, 1)
    add_or_remove_cash(shop, pet[:price])

  end
end