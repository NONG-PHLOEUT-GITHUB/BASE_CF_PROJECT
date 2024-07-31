component output="false" {
    // Constructor to initialize the DAO
    function init() {
        variables.PostModel = new models.PostModel();
        return this;
    }

    public struct function getAllPosts() {
        var result = { "data":[] };
        var posts = variables.PostModel.get()
        for(var row in posts){
            arrayAppend(result.data,{
                "id":row.id,
                "title":row.title
            })
        }
        // return {"result":posts} 
        return result
    }
}