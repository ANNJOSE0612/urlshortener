class RemoveUserFromUrls < ActiveRecord::Migration[6.0]
  def change
    remove_reference :urls, :user, null: false, foreign_key: true
  end
end
