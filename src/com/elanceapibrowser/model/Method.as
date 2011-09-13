package com.elanceapibrowser.model
{
	public class Method extends Object
	{
		public function Method()
		{
		}
		
		public var requestParams : Array = ["invoiceID", "userID", "bidID"];
		public var queryParams : Array = ["someA", "someB", "someC", "someD"];
		
		public var path : String;
		public var fullPath : String;
		public var httpMethod : String = 'GET';
		public var desc : String;
		public var shortDesc : String;
		public var signature : String;
		public var classPath : String;
		public var className : String;
		public var methodName : String;
		public var template : String;
		public var formatterClass : String;
		public var formatterClassPath : String;
		//security
		public var session : String;
		public var isPublic : String;
		//docs
		public var deprecated : String;
		public var since : String;
		public var ignore : String;
		public var published : String;
		//misc
		public var version : String;
		public var token : String;
		public var legacy : String;
	}
}