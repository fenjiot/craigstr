class AddSpamColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :spam, :integer, default: 0
  end
end
