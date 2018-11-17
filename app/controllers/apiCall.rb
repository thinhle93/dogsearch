class ObjectClass
    include HTTParty 
    base_uri "https://api.thedogapi.com/v1/images"
    
    def getapi
        self.class.get('/search?size=med&mime_types=jpg&format=json&has_breeds=true&order=ASC&page=0&limit=1', :header => {'Content-Type': 'application/json', 'x-api-key': '521d1ea2-431a-4807-adff-6590b3d59529' })
    end

    def getOne(id)
        self.class.get('/' + id)
    end
  
  end