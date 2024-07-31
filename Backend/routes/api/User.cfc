<cfcomponent rest="true"  restpath="users" Name="Users"> 
    
   <cffunction name="get" access="remote" returnType="struct"  produces="application/json" httpmethod="GET">
    <cfscript>
        return new services.PostService().getAllPosts();
    </cfscript>
   </cffunction>
   
   <cffunction name="getCustomer" access="remote" returnType="string" restPath="/orders/{customerID}" produces="application/json" httpmethod="GET">
       <cfargument name="customerID" required="true"restargsource="Path" type="numeric"/>
       <cfset customers = arrayNew(1)>
          <cfset customers[1] = "Brian">
          <cfset customers[2] = "Caroline">
          <cfset customers[3] = "Noah">
          <cfset customers[4] = "Elijah">
          <cfset customers[5] = "Maverick">
       <cfreturn customers[arguments.customerID] />
   </cffunction>
   
    
   <cffunction name="post" access="remote" returnType="string" produces="application/json" httpmethod="POST">
       <cfset message = "Customer has been added.">
       <cfreturn message>
   </cffunction>
   
   <cffunction name="put" access="remote" returnType="string" produces="application/json" httpmethod="PUT">
       <cfset message = "Customer has been updated.">
       <cfreturn message>
   </cffunction>
   
   <cffunction name="delete" access="remote" returnType="string" produces="application/json" httpmethod="DELETE">
       <cfset message = "Customer has been deleted.">
       <cfreturn message>
   </cffunction>
   
</cfcomponent>
 
    