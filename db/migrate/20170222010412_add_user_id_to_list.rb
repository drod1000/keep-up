class AddUserIdToList < ActiveRecord::Migration[5.0]
  def change
    add_reference :lists, :user, foreign_key: true, index: true
  end
end
