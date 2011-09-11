package com.elanceapibrowser.components
{
	import com.elanceapibrowser.events.ExecuteMethodEvent;
	import com.elanceapibrowser.events.GetAllMethodsEvent;
	import com.elanceapibrowser.model.AppModel;
	import com.elanceapibrowser.model.Method;
	
	import flash.events.MouseEvent;
	
	import mx.events.IndexChangedEvent;
	import mx.events.ListEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	import spark.events.IndexChangeEvent;
	
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
			eventMap.mapListener(view.buttonSend, MouseEvent.CLICK, handleButtonSend);
			eventMap.mapListener(view.comboAllMethods, IndexChangeEvent.CHANGE, handleComboAllMethods);
			
			dispatch(new GetAllMethodsEvent(GetAllMethodsEvent.EVENT_GET_ALL_METHODS));	
		}
		
		private function handleComboAllMethods(event : IndexChangeEvent):void
		{
			var selectedMethod : Method = view.comboAllMethods.selectedItem as Method;
			
			view.labelSelectedMethod.text = selectedMethod.fullPath;
		}
		
		private function handleButtonSend(event : *):void
		{
			dispatch(new ExecuteMethodEvent(ExecuteMethodEvent.EVENT_EXECUTE_METHOD));
		}
		
		private function handleGetAllMethodsResult(event : GetAllMethodsEvent):void
		{
			view.comboAllMethods.dataProvider = model.allMethodsCollection;
		}
	}
}