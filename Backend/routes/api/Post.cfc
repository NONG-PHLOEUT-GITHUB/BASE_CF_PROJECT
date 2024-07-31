component output="false" accessors="false" produces="application/json" rest="true" restpath="posts" {

    /**
    * @httpmethod                 GET
    * @restpath                   /my-post
    * @consumes                   application/json
    * @hint                       Return a posts for the user
    *
    */
    
    remote struct function getPosts() returnformat="json" {
      return new services.PostService().getAllPosts();
    }
}