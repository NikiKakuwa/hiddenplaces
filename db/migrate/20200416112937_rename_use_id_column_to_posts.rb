class RenameUseIdColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :use_id, :user_id
  end
end
