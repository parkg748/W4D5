class CreateUserComment < ActiveRecord::Migration[5.2]
  def change
    create_table :user_comments do |t|
      t.string :body, null: false
    end
  end
end
