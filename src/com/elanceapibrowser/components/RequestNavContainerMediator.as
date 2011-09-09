package com.elanceapibrowser.components
{
	import com.elanceapibrowser.events.GetAllMethodsEvent;
	import com.elanceapibrowser.model.AppModel;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class RequestNavContainerMediator extends Mediator
	{
		public function RequestNavContainerMediator()
		{
			super();
		}
		
		[Inject]
		public var view : RequestNavContainer;
		
		[Inject]
		public var model : AppModel;
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, GetAllMethodsEvent.EVENT_GET_ALL_METHODS_RESULT, handleGetAllMethodsResult);
			
			dispatch(new GetAllMethodsEvent(GetAllMethodsEvent.EVENT_GET_ALL_METHODS));	
		}
		
		private function handleGetAllMethodsResult(event : GetAllMethodsEvent):void
		{
			view.comboAllMethods.dataProvider = model.allMethodsCollection;
		}
	}
}