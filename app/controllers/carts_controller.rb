class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_items

  def show
    @cart = current_user.cart || current_user.create_cart
    @cart_items = @cart.cart_items.order(:created_at)  # You can also use :id or another field if needed
  end

  def add
    product = Product.find(params[:product_id])
    cart = current_user.cart || current_user.create_cart

    # Add the product to the user's cart
    cart_item = cart.cart_items.find_by(product: product)

    if cart_item
      # Update quantity if the product already exists in the cart
      cart_item.update(quantity: cart_item.quantity + params[:quantity].to_i)
    else
      # Add new item to the cart
      cart.cart_items.create!(product: product, quantity: params[:quantity])
    end

    redirect_to cart_path(cart), notice: 'Product added to cart!'
  end

  def remove
    cart_item = current_user.cart.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to cart_path, notice: "Товар видалено з кошика"
  end

  def clear
    current_user.cart.cart_items.destroy_all
    redirect_to cart_path, notice: "Ваш кошик очищено"
  end

  def checkout
    # Initialize the order here for the checkout view
    @order = Order.new(user: current_user)
  end

  private

  def set_cart_items
    @cart_items = current_user.cart.cart_items
  end
end