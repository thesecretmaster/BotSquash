json.extract! hashtag, :id, :name
json.elements number_ids_for([@hashtag], modal_name: '#hashtagModal') { |ht| { id: ht.id, name: ht.name } }
json.url hashtag_url(hashtag, format: :json)
