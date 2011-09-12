package com.elanceapibrowser.events
{
	import com.elanceapibrowser.model.MethodParams;
	
	import flash.events.Event;
	
	public class ExecuteMethodEvent extends Event
	{
		public static const EVENT_EXECUTE_METHOD : String = "executeMethodEvent";
		public static const EVENT_EXECUTE_METHOD_RESULT : String = "executeMethodResultEvent";
		public static const EVENT_EXECUTE_METHOD_FAULT : String = "executeMethodFaultEvent";
		
		public var params : MethodParams;
		
		public function ExecuteMethodEvent(type:String, params : MethodParams = null)
		{
			super(type, true, false);
			
			this.params = params
		}
		
		override public function clone():Event
		{
			return new ExecuteMethodEvent(type, this.params);
		}
	}
}