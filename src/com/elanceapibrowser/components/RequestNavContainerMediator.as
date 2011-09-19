package com.elanceapibrowser.components
{
	import com.elanceapibrowser.events.ExecuteMethodEvent;
	import com.elanceapibrowser.events.GetAllMethodsEvent;
	import com.elanceapibrowser.events.QueryBuilderEvent;
	import com.elanceapibrowser.model.AppModel;
	import com.elanceapibrowser.model.Method;
	import com.elanceapibrowser.model.MethodParam;
	
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
		
		private var selectedMethod : Method;
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, GetAllMethodsEvent.EVENT_GET_ALL_METHODS_RESULT, handleGetAllMethodsResult);
			eventMap.mapListener(view.buttonSend, MouseEvent.CLICK, handleButtonSend);
			eventMap.mapListener(view.comboAllMethods, IndexChangeEvent.CHANGE, handleComboAllMethods);
			
			eventMap.mapListener(view.queryBuilder, QueryBuilderEvent.EVENT_PARAM_CHANGED, handleQueryParamChanged);
			
			dispatch(new GetAllMethodsEvent(GetAllMethodsEvent.EVENT_GET_ALL_METHODS));	
		}
		
		private function handleQueryParamChanged(event : QueryBuilderEvent):void
		{
			view.requestBuilder.queryString = view.queryBuilder.getQueryString();	
		}
		
		private function handleComboAllMethods(event : IndexChangeEvent):void
		{
			selectedMethod = view.comboAllMethods.selectedItem as Method;
			
			view.requestBuilder.method = selectedMethod;
			
			view.queryBuilder.method = selectedMethod;
			view.requestBuilder.queryString = view.queryBuilder.getQueryString();
			
			view.buttonSend.enabled = (selectedMethod != null);
		}
		
		private function handleButtonSend(event : *):void
		{
			if (view.queryBuilder.validateQueryBuilder())
			{
				var params : MethodParam = new MethodParam;
				params.fullpath = selectedMethod.fullPath;
				params.signature = selectedMethod.signature;
				dispatch(new ExecuteMethodEvent(ExecuteMethodEvent.EVENT_EXECUTE_METHOD, params));				
			}
		}
		
		private function handleGetAllMethodsResult(event : GetAllMethodsEvent):void
		{
			view.comboAllMethods.dataProvider = model.allMethodsCollection;
		}
	}
}