class FavoriteRepresenter < FavoritesController
  def initialize(favorites)
    @favorites = favorites
  end

  def as_json
    tmp = []

    favorites.each do | favorite |
       tmp.push({
         id: favorite.id,
         house: {
           id: favorite.house.id,
           title: favorite.house.title,
           address: favorite.house.address,
           price: favorite.house.rent_price,
           description: favorite.house.description,
           raiting: favorite.house.raiting,
           user: {
             id: favorite.house.user.id,
             username: favorite.house.user.username,
           },
           reviews: favorite.house.reviews
         }
       })
    end

    tmp

  end


  private 
  attr_reader :favorites
end