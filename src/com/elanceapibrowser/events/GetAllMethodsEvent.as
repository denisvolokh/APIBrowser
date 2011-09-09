package com.elanceapibrowser.events
{
	import flash.events.Event;
	
	public class GetAllMethodsEvent extends Event
	{
		public static const EVENT_GET_ALL_METHODS : String = "getAllMethodsEvent";
		public static const EVENT_GET_ALL_METHODS_RESULT : String = "getAllMethodsResultEvent";
		public static const EVENT_GET_ALL_METHODS_FAULT : String = "getAllMethodsFaultEvent";
		
		public function GetAllMethodsEvent(type:String)
		{
			super(type, true, false);
		}
		
		override public function clone():Event
		{
			return new GetAllMethodsEvent(type);
		}
	}
}