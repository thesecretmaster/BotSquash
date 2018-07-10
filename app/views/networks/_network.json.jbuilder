json.extract! network, :id, :name # , :created_at, :updated_at
json.elements number_ids_for([@network], modal_name: '#networkModal') { |nw| { id: nw.id, name: nw.name } }
json.url network_url(network, format: :json)
