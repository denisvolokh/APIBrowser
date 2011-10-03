package com.elanceapibrowser.components
{
	import com.elanceapibrowser.events.HistoryEvent;
	import com.elanceapibrowser.model.AppModel;
	
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.events.IndexChangeEvent;
	
	public class HistoryPanelMediator extends Mediator
	{
		public function HistoryPanelMediator()
		{
			super();
		}
		
		[Inject]
		public var model : AppModel;
		
		[Inject]
		public var view : HistoryPanel;
		
		override public function onRegister():void
		{
			this.eventMap.mapListener(eventDispatcher, HistoryEvent.EVENT_ADDED_TO_HISTORY, handleAddedToHistoryEvent);
			this.eventMap.mapListener(view.buttonClearHistory, MouseEvent.CLICK, handleClearHistoryButton);
			this.eventMap.mapListener(view.listHistory, IndexChangeEvent.CHANGE, onListIndexChangedHandler);
		}
		
		private function onListIndexChangedHandler(event : IndexChangeEvent):void
		{
			
		}
		
		private function handleClearHistoryButton(event : *):void
		{
			model.historyCollection.removeAll();
		}
		
		private function handleAddedToHistoryEvent(event : HistoryEvent):void
		{
			view.listHistory.dataProvider = model.historyCollection;	
		}
	}
}