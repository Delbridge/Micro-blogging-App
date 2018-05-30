class CreateBlogsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :content
      t.string :user_id
<<<<<<< HEAD:db/migrate/20180530142003_create_blogs_table.rb
=======
    end
>>>>>>> 1f6741f109f22a9fb64b71decec76589eb35c57b:db/migrate/20180530000433_create_blogs_table.rb
  end
end
end
