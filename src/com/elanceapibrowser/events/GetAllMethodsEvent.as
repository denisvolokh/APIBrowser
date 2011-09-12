package com.elanceapibrowser.events
{
	import com.elanceapibrowser.model.MethodParams;
	
	import flash.events.Event;
	
	public class GetAllMethodsEvent extends Event
	{
		public static const EVENT_GET_ALL_METHODS : String = "getAllMethodsEvent";
		public static const EVENT_GET_ALL_METHODS_RESULT : String = "getAllMethodsResultEvent";
		public static const EVENT_GET_ALL_METHODS_FAULT : String = "getAllMethodsFaultEvent";
		
		public var params : MethodParams;
		
		public function GetAllMethodsEvent(type:String, params : MethodParams = null)
		{
			super(type, true, false);
			
			this.params = params;
		}
		
		override public function clone():Event
		{
			return new GetAllMethodsEvent(type, params);
		}
	}
}