<cfsetting requestTimeOut = "120">
<cfset queryOptions = {datasource = "dsn_practice_exam"}/>
<cfscript>
	void function addMovie( MovieID, ReleaseDate, MovieName, Rating )
	{
		queryExecute(
			"INSERT INTO tMovies
			( MovieID, ReleaseDate, MovieName, Rating )
			VALUES ( :MovieID, :ReleaseDate, :MovieName, :Rating )",
			{
				MovieID = { value = arguments.MovieID, cfsqltype = 'INTEGER' },
				ReleaseDate = { value = arguments.ReleaseDate, cfsqltype = 'TIMESTAMP' },
				MovieName = { value = arguments.MovieName, cfsqltype = 'VARCHAR' },
				Rating = { value = arguments.Rating, cfsqltype = 'VARCHAR' }
			}, 
			variables.queryOptions
		);
	}

	void function addOrder( OrderID, OrderDate, CustomerName, Price )
	{
		queryExecute(
			"INSERT INTO tOrders
			( OrderID, OrderDate, CustomerName, Price )
			VALUES ( :OrderID, :OrderDate, :CustomerName, :Price )",
			{
				OrderID = { value = arguments.orderID, cfsqltype = 'INTEGER' },
				OrderDate = { value = arguments.orderDate, cfsqltype = 'TIMESTAMP' },
				CustomerName = { value = arguments.CustomerName, cfsqltype = 'VARCHAR' },
				Price = { value = arguments.Price, cfsqltype = 'NUMERIC' }
			}, 
			variables.queryOptions
        );
	}

	void function addUser( firstName, lastName, password, email )
	{
		queryExecute(
			"INSERT INTO tUsers
			 ( FirstName, LastName, Password, Email )
			 VALUES( :FirstName, :LastName, :Password, :Email )",
			 {
				 FirstName = { value=arguments.FirstName, cfsqltype="varchar" },
				 LastName  = { value=arguments.LastName, cfsqltype="varchar" },
				 Password  = { value=arguments.password, cfsqltype="varchar" },
				 Email     = { value=arguments.Email, cfsqltype="varchar" }
			 }, 
			 variables.queryOptions
		);
	}

	void function addBlogEntry( title, datePublished, author, isActive, bodyContent )
	{
		queryExecute(
			"INSERT INTO tBlogs
			 ( title, datePublished, author, isActive, bodyContent )
			 VALUES( :title, :datePublished, :author, :isActive, :bodyContent )",
			 {
				title 		  = { value=arguments.title, cfsqltype="varchar" },
				datePublished = { value=arguments.datePublished, cfsqltype="date" },
				author 		  = { value=arguments.author, cfsqltype="varchar" },
				isActive 	  = { value=arguments.isActive, cfsqltype="char" },
				bodyContent   = { value=arguments.bodyContent, cfsqltype="varchar" }
			 }, 
			 variables.queryOptions
		);
	}

    function createDatabase() {
        var _SQL = "";
        
        _SQL =  "CREATE TABLE tOrders (
                    OrderID INT NOT NULL AUTO_INCREMENT CONSTRAINT tOrders_PK PRIMARY KEY,
                    OrderDate DATE,
                    CustomerName VARCHAR(100),
                    Price NUMERIC
                )";
        
        queryExecute( _SQL , {}, variables.queryOptions);

		addOrder( 338, "4/1/2019", "Joe Elliott", "99.75" );
		addOrder( 402, "5/11/2019", "Phil Collen", "125.00" );
		addOrder( 555, "2/14/2008", "Rick Sav", "11.87" );
		addOrder( 101, "2/03/2019", "Vivian Campbell", "125.00" );
		addOrder( 605, "1/5/2017", "Steve Clark", "101.00" );
		addOrder( 606, "2/5/2017", "Rick Allen", "99.00" );
		addOrder( 607, "3/15/2018", "Mutt Lange", "87.76" );
        
		_SQL =  "CREATE TABLE tMovies (
			MovieID INT NOT NULL AUTO_INCREMENT CONSTRAINT tMovies_PK PRIMARY KEY,
			ReleaseDate DATE,
			MovieName VARCHAR(100),
			Rating VARCHAR(5)
		)";
		queryExecute( _SQL, {}, variables.queryOptions );

		addMovie( 101, "3/3/1984", "Top Gun", "PG" );
		addMovie( 102, "2/1/1983", "Goonies", "PG" );
		addMovie( 103, "3/3/1984", "The Karate Kid", "PG" );
		addMovie( 104, "3/3/1984", "Real Genius", "PG" );
		addMovie( 105, "3/22/1985", "Weird Science", "PG-13" );
		addMovie( 106, "4/12/1984", "Pretty In Pink", "PG-13" );
		addMovie( 107, "5/2/1985", "The Lost Boys", "PG-13" );
		addMovie( 108, "5/11/1985", "The Little Mermaid", "G" );
		addMovie( 109, "2/09/1981", "Snow White", "G" );
		addMovie( 110, "11/27/1987", "The Lion King", "G" );
		addMovie( 111, "3/3/1984", "Sixteen Candles", "PG-13" );
		addMovie( 112, "7/26/1993", "Singles", "PG-13" );

		_SQL =  "CREATE TABLE tUsers (
			UserID INT NOT NULL AUTO_INCREMENT CONSTRAINT tUsers_PK PRIMARY KEY,
			FirstName VARCHAR(50),
			LastName VARCHAR(50),
			Password VARCHAR(50),
			Email VARCHAR(50),
			HeadshotFileName VARCHAR(100)
		)";
		queryExecute( _SQL, {}, variables.queryOptions);

		addUser( "Nolan", "Erck", "password", "nolan@vandelayindustries.biz" );
		addUser( "Jerry", "Seinfeld", "password", "jerry@vandelayindustries.biz" );
		addUser( "George", "Costanza", "password", "george@vandelayindustries.biz" );
		addUser( "Cosmo", "Kramer", "password", "cosmo@vandelayindustries.biz" );
		addUser( "Elaine", "Benes", "password", "elaine@vandelayindustries.biz" );
		addUser( "Joey", "Tribiani", "password", "joey@friends.biz" );
		addUser( "Chandler", "Bing", "password", "chandler@friends.biz" );
		addUser( "Ross", "Geller", "password", "ross@friends.biz" );
		addUser( "Phoebe", "Boufet", "password", "phoebe@friends.biz" );

		_SQL =  "CREATE TABLE tBlogs (
			blogID INT NOT NULL AUTO_INCREMENT CONSTRAINT tBlogs_PK PRIMARY KEY,
			title VARCHAR(255),
			datePublished DATE,
			Author VARCHAR(50),
			isActive CHAR(1),
			bodyContent VARCHAR(4000)
		)";
		queryExecute( _SQL, {}, variables.queryOptions );

		addBlogEntry( "Top 10 Movies From the 80's", "2/2/2019", "Nolan Erck", "1", "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ab ipsa debitis qui reprehenderit est quae rerum dignissimos quaerat cupiditate corrupti. Dolor aliquid quae aliquam minus quia tempore ullam reiciendis error ducimus expedita cupiditate esse, magnam harum? Quos sapiente, eum beatae ipsam at in quam perspiciatis rerum. Nesciunt dicta pariatur laboriosam?" );
		addBlogEntry( "Our favorite SQL Scripts", "3/12/2018", "David Bowie", "1", "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Consequuntur, expedita at. Id beatae eveniet quo iure. Esse, libero. Hic maxime laboriosam accusamus eligendi culpa blanditiis a rerum assumenda magnam, tempore quas debitis commodi illo dignissimos perspiciatis dolore ab incidunt neque porro amet ducimus inventore mollitia nobis eius! Distinctio, nesciunt nam sapiente dolorum aliquid neque ipsam voluptas itaque at numquam doloremque quibusdam veritatis architecto minus ab porro exercitationem laborum voluptatem impedit reprehenderit vel rem mollitia praesentium cum! Perferendis vel voluptatum nostrum quam ut tenetur, molestias dolorem." );
		addBlogEntry( "You Know You're Bad at Debugging When...", "4/1/2019", "Kevin Seconds", "1", "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Perferendis quis a optio odio laudantium voluptatem velit praesentium esse quasi voluptate magnam molestias assumenda, earum, ut eveniet, reprehenderit officia delectus ipsa. Eveniet eos nostrum quibusdam voluptatum iste temporibus accusamus porro soluta adipisci unde. Veritatis?" );
		addBlogEntry( "Adobe Vs The Smurfs", "7/26/2019", "Steve Youth", "1", "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Deleniti iste ratione veniam, tenetur in aperiam sequi adipisci, rerum quisquam soluta obcaecati iusto molestiae minus voluptates quo molestias vero accusantium ipsa rem neque, debitis quae quam aliquid officiis! Ab iusto suscipit vero enim, eius recusandae quisquam quidem aut possimus qui ratione, tenetur deleniti laboriosam quia in." );
		addBlogEntry( "Five Custom Tags You Should Use", "11/15/2014", "Martin Gore", "1", "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam odio eius exercitationem ipsum neque voluptas quae iure!" );
	}	
</cfscript>
        <cfflush>
        <cfset createDatabase()>