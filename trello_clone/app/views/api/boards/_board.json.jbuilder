json.extract!(
  board, :id, :user_id, :title, :updated_at, :created_at
)

json.lists do
  json.array!(board.lists) do |list|
    json.partial! 'api/lists/list', list: list
  end
end
