package com.elanceapibrowser.components
{
	import com.elanceapibrowser.events.ExecuteMethodEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class MainPanelMediator extends Mediator
	{
		public function MainPanelMediator()
		{
			super();
		}
		
		[Inject]
		public var view : MainPanel;
		
		override public function onRegister():void
		{
			this.eventMap.mapListener(eventDispatcher, ExecuteMethodEvent.EVENT_EXECUTE_METHOD_RESULT, handleExecuteMethodResult);
			this.eventMap.mapListener(eventDispatcher, ExecuteMethodEvent.EVENT_EXECUTE_METHOD_FAULT, handleExecuteMethodResult);
		}
		
		private function handleExecuteMethodResult(event : *):void
		{
			view.vs.selectedIndex = 1;
		}
	}
}