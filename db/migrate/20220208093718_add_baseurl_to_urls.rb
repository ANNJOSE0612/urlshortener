class AddBaseurlToUrls < ActiveRecord::Migration[6.0]
  def change
    add_column :urls, :baseurl, :string
  end
end
