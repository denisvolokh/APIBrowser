package com.elanceapibrowser.components
{
	import com.elanceapibrowser.events.HistoryEvent;
	import com.elanceapibrowser.model.AppModel;
	
	import org.robotlegs.mvcs.Mediator;
	
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
			this.eventMap.mapListener(eventDispatcher, HistoryEvent.EVENT_ADDED_TO_HISTORY, handleAddedToHistoryEvent)
		}
		
		private function handleAddedToHistoryEvent(event : HistoryEvent):void
		{
			view.listHistory.dataProvider = model.historyCollection;	
		}
	}
}