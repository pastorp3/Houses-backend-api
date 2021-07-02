class HouseRepresenter < HousesController
  def initialize(house)
    @house = house
  end

  def as_json
    {
      id: house.id,
      title: house.title,
      address: house.address,
      price: house.rent_price,
      description: house.description,
      raiting: house.raiting,
      user: {
        id: house.user.id,
        username: house.user.username
      },
      reviews: house.reviews
    }

  end

  def houses_json
    houses = []
    house.each do |item|
      houses.push({
        id: item.id,
        title: item.title,
        address: item.address,
        price: item.rent_price,
        description: item.description,
        raiting: item.raiting,
        user: {
          id: item.user.id,
          username: item.user.username
        },
        reviews: item.reviews
      })
    end

    houses
  end


  private

  attr_reader :house
end