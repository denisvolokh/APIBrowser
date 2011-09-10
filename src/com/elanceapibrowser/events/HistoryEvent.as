package com.elanceapibrowser.events
{
	import flash.events.Event;
	
	public class HistoryEvent extends Event
	{
		
		public static const EVENT_ADDED_TO_HISTORY : String = "addedToHistoryEvent";
		
		public function HistoryEvent(type:String)
		{
			super(type, true, false);
		}
		
		override public function clone():Event
		{
			return new HistoryEvent(type);
		}
	}
}