class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.text :body
    end

    execute "CREATE EXTENSION IF NOT EXISTS pg_trgm"
    execute "CREATE INDEX posts_body_trgm_idx ON posts USING gin (body gin_trgm_ops)"
  end

  def down
    drop_table :posts
  end
end
