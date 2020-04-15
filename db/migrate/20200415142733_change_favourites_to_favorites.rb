class ChangeFavouritesToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_table :favourites, :favorites
  end
end
