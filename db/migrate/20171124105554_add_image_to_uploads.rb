class AddImageToUploads < ActiveRecord::Migration[5.1]
  def change
    add_column :uploads, :image, :string
  end
end
