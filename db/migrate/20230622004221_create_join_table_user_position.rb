class CreateJoinTableUserPosition < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :positions do |t|
      # t.index [:user_id, :position_id]
      # t.index [:position_id, :user_id]
    end
  end
end
