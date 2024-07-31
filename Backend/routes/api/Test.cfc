component rest="true"  produces="application/json"  restpath="/test" Name="test"{ 

    // all these routes we call custome script//
    //GET Request to return customers
    remote function get () returntype="struct" httpmethod="GET" restPath="/getAll" {
        return new services.PostService().getAllPosts();
    }
    
    //GET Request to return customers
        function getCustomer (required string customerID restargsource="Path") access="remote" returntype="string" httpmethod="GET" restPath="/orders/{customerID}" {
            var customers = [];
            customers[1] = "Brian";
            customers[2] = "Caroline";
            customers[3] = "Noah";
            customers[4] = "Elijah";
            customers[5] = "Maverick";
            return customers[arguments.customerID];
        }
    
    
    
    
    
    //POST Request to write a new customer to the database
    function post () access="remote" returntype="string" produces="application/json" httpmethod="POST"  {
        //do database insert and validation logic
        //return a successful message in the response
        var message = "Customer has been added.";
        return message;
    }
    
    
    
    
    //PUT Request to edit a customer in the database
    function put () access="remote" returntype="string"  httpmethod="PUT" {
        //do database update and validation logic
        //return a successful message in the response
        var message = "Customer has been updated.";
        return message;
    }
    
    //DELETE Request to remove a customer in the database
    function delete () access="remote" returntype="string"  httpmethod="DELETE" {
        //do database delete and validation logic
        //return a successful message in the response
        var message = "Customer has been deleted.";
        return message;
    }
    
}
     
     
    