package com.elanceapibrowser.events
{
	import flash.events.Event;
	
	public class ExecuteMethodEvent extends Event
	{
		public static const EVENT_EXECUTE_METHOD : String = "executeMethodEvent";
		public static const EVENT_EXECUTE_METHOD_RESULT : String = "executeMethodResultEvent";
		public static const EVENT_EXECUTE_METHOD_FAULT : String = "executeMethodFaultEvent";
		
		public function ExecuteMethodEvent(type:String)
		{
			super(type, true, false);
		}
		
		override public function clone():Event
		{
			return new ExecuteMethodEvent(type);
		}
	}
}