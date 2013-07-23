class ItemSourceRelation < ActiveRecord::Migration
  def self.up
    add_column :items, :source_id, :integer

    remove_column :sources, :item_id

    add_index :items, [:source_id]

    remove_index :sources, :name => :index_sources_on_item_id rescue ActiveRecord::StatementInvalid
  end

  def self.down
    remove_column :items, :source_id

    add_column :sources, :item_id, :integer

    remove_index :items, :name => :index_items_on_source_id rescue ActiveRecord::StatementInvalid

    add_index :sources, [:item_id]
  end
end
