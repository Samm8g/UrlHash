class CreateUrlMappings < ActiveRecord::Migration[7.2]
  def change
    create_table :url_mappings do |t|
      t.string :original_url
      t.string :url_hash

      t.timestamps
    end
  end
end
