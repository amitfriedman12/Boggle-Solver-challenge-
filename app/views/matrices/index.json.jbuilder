json.array!(@matrices) do |matrix|
  json.extract! matrix, :id, :row1, :row2, :row3, :row4
  json.url matrix_url(matrix, format: :json)
end
