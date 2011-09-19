package com.elanceapibrowser.model
{
	public class Method extends Object
	{
		public function Method()
		{
		}
		
		public function findRequestParamByName(name : String):MethodParam
		{
			for each (var p : MethodParam in requestParams)
			{
				if (p.name == name) return p
			}
			
			return null;
		}
		
		public var methodsInjectablesHash : Object;
		
		public var requestParams : Array = [];
		public var queryParams : Array = [];
		
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