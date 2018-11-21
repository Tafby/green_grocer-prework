def consolidate_cart(cart)
  grocery_cart = {}
  count = 0 
  cart.each do |item|
    item.each do |food, details|
      details[:count] ||= 0
      details[:count] += 1
      grocery_cart[food] = details
    end
  end
  grocery_cart
end


def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    item_key = coupon[:item]
    if cart.has_key?(item_key) 
      if cart[item_key][:count] >= coupon[:num]
        cart["#{item_key} W/COUPON"] = {
          :price => coupon[:cost],
          :clearance => cart[item_key][:clearance],
          :count => cart[item_key][:count] / coupon[:num]
        }
        cart[item_key][:count] = cart[item_key][:count] % coupon[:num]
        end
      end
   end
   cart
end

def apply_clearance(cart)
  cart.each do |item, details|
    if details[:clearance] 
      discount = (details[:price] * 0.20) 
      details[:price] = details[:price] - discount
    end
  end
end

def checkout(cart:[], coupons:[])
#   if consolidate_cart(cart).length <= 1
#     apply_coupons(cart, coupons)
#     apply_clearance(cart)
#   end
end
