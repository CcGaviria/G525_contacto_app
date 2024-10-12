require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_url
    assert_response :success
  end

  test "should create contact" do
    assert_difference("Contact.count") do
      post contacts_url, params: { contact: { address: @contact.address, address_details: @contact.address_details, birth_date: @contact.birth_date, city: @contact.city, country: @contact.country, department: @contact.department, email: @contact.email, first_name: @contact.first_name, information: @contact.information, last_name: @contact.last_name, sex: @contact.sex } }
    end

    assert_redirected_to contact_url(Contact.last)
  end

  test "should show contact" do
    get contact_url(@contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_url(@contact)
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { address: @contact.address, address_details: @contact.address_details, birth_date: @contact.birth_date, city: @contact.city, country: @contact.country, department: @contact.department, email: @contact.email, first_name: @contact.first_name, information: @contact.information, last_name: @contact.last_name, sex: @contact.sex } }
    assert_redirected_to contact_url(@contact)
  end

  test "should destroy contact" do
    assert_difference("Contact.count", -1) do
      delete contact_url(@contact)
    end

    assert_redirected_to contacts_url
  end
end
