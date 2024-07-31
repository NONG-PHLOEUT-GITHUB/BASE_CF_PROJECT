component {
    public query function get( )
    {
		var sql = "SELECT * FROM posts";
        var result = queryExecute(
            sql,
            [],
            {datasource:"DSN_PRACTICE_EXAM"}
        );

        return result;
    }
}