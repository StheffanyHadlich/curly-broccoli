require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get _products_url
    assert_response :success
  end

  test "should get new" do
    get new__product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post _products_url, params: { product: {  } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get _product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit__product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch _product_url(@product), params: { product: {  } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete _product_url(@product)
    end

    assert_redirected_to _products_url
  end
end
