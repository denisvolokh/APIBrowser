package com.elanceapibrowser.services
{
	import com.adobe.serialization.json.JSON;
	import com.elanceapibrowser.events.GetAllMethodsEvent;
	import com.elanceapibrowser.model.AppModel;
	import com.elanceapibrowser.model.Method;
	import com.elanceapibrowser.model.MethodParam;
	
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	import org.robotlegs.mvcs.Actor;

	public class GetAllMethodsService extends BasicService implements IGetAllMethodsService
	{
		
		public function GetAllMethodsService()
		{
			super();
			
			service.url = AppModel.apiBaseUrl + "reflection/apis";
		}
		
		override public function load(params : MethodParam):void
		{
			service.send();
			
			model.historyCollection.addItem("new method");
		}
		
		override protected function onResultHandler(event : ResultEvent):void
		{
			super.onResultHandler(event);
			
			var projectObject:Object = JSON.decode(event.result as String);
			for (var p : String in projectObject["data"])
			{
				var m : Object = projectObject["data"][p];
				var method : Method = new Method();
				for (var prop : String in m)
				{
					if (method.hasOwnProperty(prop))
					{
						method[prop] = m[prop];
					}
				}
				
				if (method.methodsInjectablesHash)
				{
					var obj : Object = method.methodsInjectablesHash
					for (var param : String in obj)
					{
						var methodParam : MethodParam = new MethodParam;
						if (obj[param].providersHash.hasOwnProperty("PathParamProvider"))
						{
							methodParam.name = param;
							method.requestParams.push(methodParam);
						}
						
						if (obj[param].providersHash.hasOwnProperty("QueryParamProvider") || obj[param].providersHash.hasOwnProperty("ContextParamProvider"))
						{
							methodParam.name = param;
							method.queryParams.push(methodParam);
						}
					}
				}
				model.allMethodsCollection.addItem(method);
			}
			
			//providersHash: PathParamProvider | QueryParamProvider
			
			dispatch(new GetAllMethodsEvent(GetAllMethodsEvent.EVENT_GET_ALL_METHODS_RESULT));
		}
		
		override protected function onFaultHandler(event : FaultEvent):void
		{
			super.onFaultHandler(event);
			
		}
		
		private function removeListeners():void
		{
			service.removeEventListener(ResultEvent.RESULT, onResultHandler);
			service.removeEventListener(FaultEvent.FAULT, onFaultHandler);
		}
	}
}