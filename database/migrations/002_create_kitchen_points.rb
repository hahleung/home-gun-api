Sequel.migration do
  change do
    create_table :kitchen_points do
      primary_key :id
      foreign_key :user_id, :users
      Integer :value, :null=>false
      Date :date, :null=>false
    end
  end
end
