class AddShorturlcodeToUrls < ActiveRecord::Migration[6.0]
  def change
    add_column :urls, :shorturlcode, :string
  end
end
