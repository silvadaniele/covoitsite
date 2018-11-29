require "application_system_test_case"

class RidesTest < ApplicationSystemTestCase
  setup do
    @ride = rides(:one)
  end

  test "visiting the index" do
    visit rides_url
    assert_selector "h1", text: "Rides"
  end

  test "creating a Ride" do
    visit rides_url
    click_on "New Ride"

    fill_in "Capacity", with: @ride.capacity
    fill_in "Departure At", with: @ride.departure_at
    fill_in "Destination", with: @ride.destination
    fill_in "Origin", with: @ride.origin
    fill_in "Owner", with: @ride.owner_id
    fill_in "Price", with: @ride.price
    click_on "Create Ride"

    assert_text "Ride was successfully created"
    click_on "Back"
  end

  test "updating a Ride" do
    visit rides_url
    click_on "Edit", match: :first

    fill_in "Capacity", with: @ride.capacity
    fill_in "Departure At", with: @ride.departure_at
    fill_in "Destination", with: @ride.destination
    fill_in "Origin", with: @ride.origin
    fill_in "Owner", with: @ride.owner_id
    fill_in "Price", with: @ride.price
    click_on "Update Ride"

    assert_text "Ride was successfully updated"
    click_on "Back"
  end

  test "destroying a Ride" do
    visit rides_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ride was successfully destroyed"
  end
end
