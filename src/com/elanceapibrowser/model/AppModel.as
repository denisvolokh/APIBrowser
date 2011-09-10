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
		
		public var allMethodsCollection : ArrayCollection = new ArrayCollection;
		
		public var historyCollection : ArrayCollection;
	
		private function handleHistoryCollectionChanged(event : CollectionEvent):void
		{
			this.dispatch(new HistoryEvent(HistoryEvent.EVENT_ADDED_TO_HISTORY));	
		}
	}
}