class RequireUsernameAndPassword < ActiveRecord::Migration
  def change
    change_column_null :users, :username, false
    change_column_null :users, :password, false
  end
end
