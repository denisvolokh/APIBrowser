package com.elanceapibrowser.model
{
	import com.elanceapibrowser.events.HistoryEvent;
	
	import mx.collections.ArrayCollection;
	import mx.events.CollectionEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	public class AppModel extends Actor
	{
		public function AppModel()
		{
			super();
			
			historyCollection = new ArrayCollection;
			historyCollection.addEventListener(CollectionEvent.COLLECTION_CHANGE, handleHistoryCollectionChanged);
		}
		
		public static var apiBaseUrl : String = "https://api.elance.com/api2/" //https://externaldev.elance.com:15069/api2/";
		
		public var allMethodsCollection : ArrayCollection = new ArrayCollection;
		
		public var historyCollection : ArrayCollection; // collection of 
	
		private function handleHistoryCollectionChanged(event : CollectionEvent):void
		{
			this.dispatch(new HistoryEvent(HistoryEvent.EVENT_ADDED_TO_HISTORY));	
		}
	}
}