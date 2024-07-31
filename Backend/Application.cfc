component  {

    this.name = "PRACTICE_EXAM";
    
    public boolean  function onApplicationStart(){
        var basePath = getDirectoryFromPath(getCurrentTemplatePath());

        restInitApplication( 
            dirPath= basePath & 'routes\api', 
            serviceMapping="api", 
            password="admin123"
        );

        return true;
    }
}