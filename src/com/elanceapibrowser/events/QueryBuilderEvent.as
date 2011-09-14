package com.elanceapibrowser.events
{
	import flash.events.Event;
	
	public class QueryBuilderEvent extends Event
	{
		public static const EVENT_PARAM_CHANGED : String = "paramChangedEvent"		
		
		public var paramName : String;
		
		public var paramValue : String;
		
		public function QueryBuilderEvent(type:String, paramName : String, paramValue : String)
		{
			super(type, true, false);
			
			this.paramName = paramName;
			this.paramValue = paramValue;
		}
		
		override public function clone():Event
		{
			return new QueryBuilderEvent(type, paramName, paramValue);
		}
	}
}