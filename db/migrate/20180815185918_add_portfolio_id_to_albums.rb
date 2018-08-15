class AddPortfolioIdToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :portfolio_id, :integer
  end
end
