class AddUsertoSongs < ActiveRecord::Migration[6.0]
  def change
  	add_reference :songs, :user, index: true
  end
end
