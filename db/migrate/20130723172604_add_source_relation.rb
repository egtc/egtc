class AddSourceRelation < ActiveRecord::Migration
  def self.up
    add_column :sources, :item_id, :integer

    add_index :sources, [:item_id]
  end

  def self.down
    remove_column :sources, :item_id

    remove_index :sources, :name => :index_sources_on_item_id rescue ActiveRecord::StatementInvalid
  end
end
