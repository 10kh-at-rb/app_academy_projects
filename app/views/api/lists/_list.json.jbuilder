json.extract!(
  list,
  :title, :board_id, :ord, :created_at, :updated_at
)

json.cards do
  json.array!(list.cards) do |card|
    json.partial! 'api/cards/card', card: card
  end
end
