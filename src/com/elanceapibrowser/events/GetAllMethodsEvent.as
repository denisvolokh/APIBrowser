package com.elanceapibrowser.events
{
	import com.elanceapibrowser.model.Method;
	import com.elanceapibrowser.model.MethodParam;
	
	import flash.events.Event;
	
	public class GetAllMethodsEvent extends Event
	{
		public static const EVENT_GET_ALL_METHODS : String = "getAllMethodsEvent";
		public static const EVENT_GET_ALL_METHODS_RESULT : String = "getAllMethodsResultEvent";
		public static const EVENT_GET_ALL_METHODS_FAULT : String = "getAllMethodsFaultEvent";
		
		public var method : Method;
		
		public function GetAllMethodsEvent(type:String, method : Method = null)
		{
			super(type, true, false);
			
			this.method = method;
		}
		
		override public function clone():Event
		{
			return new GetAllMethodsEvent(type, method);
		}
	}
}