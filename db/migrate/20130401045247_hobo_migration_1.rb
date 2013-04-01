class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :colleges do |t|
      t.string   :name
      t.integer  :programs_count, :default => 0, :null => false
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :school_id
    end
    add_index :colleges, [:school_id]

    create_table :schools do |t|
      t.string   :description
      t.integer  :programs_count, :default => 0, :null => false
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :courses do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :program_id
    end
    add_index :courses, [:program_id]

    create_table :programs do |t|
      t.string   :title
      t.integer  :courses_count, :default => 0, :null => false
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :college_id
    end
    add_index :programs, [:college_id]

    create_table :users do |t|
      t.string   :crypted_password, :limit => 40
      t.string   :salt, :limit => 40
      t.string   :remember_token
      t.datetime :remember_token_expires_at
      t.string   :name
      t.string   :email_address
      t.boolean  :administrator, :default => false
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :state, :default => "invited"
      t.datetime :key_timestamp
    end
    add_index :users, [:state]
  end

  def self.down
    drop_table :colleges
    drop_table :schools
    drop_table :courses
    drop_table :programs
    drop_table :users
  end
end
