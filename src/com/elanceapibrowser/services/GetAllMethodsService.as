package com.elanceapibrowser.services
{
	import com.adobe.serialization.json.JSON;
	import com.elanceapibrowser.events.GetAllMethodsEvent;
	import com.elanceapibrowser.model.AppModel;
	import com.elanceapibrowser.model.Method;
	
	import flash.display.Loader;
	import flash.net.URLRequest;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	import org.robotlegs.mvcs.Actor;

	public class GetAllMethodsService extends Actor implements IGetAllMethodsService
	{
		protected var service : HTTPService;
		
		[Inject]
		public var model : AppModel;
		
		public function GetAllMethodsService()
		{
			service = new HTTPService();
			service.method = "POST";
			service.useProxy = false;
			service.showBusyCursor = true;
			service.url = "https://externaldev.elance.com:15069/api2/reflection/apis"
			service.addEventListener(ResultEvent.RESULT, onResultHandler);
			service.addEventListener(FaultEvent.FAULT, onFaultHandler);
		}
		
		public function load(... params):void
		{
			service.send();
			
			model.historyCollection.addItem("new method");
		}
		
		protected function onResultHandler(event : ResultEvent):void
		{
			removeListeners();
			
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
				model.allMethodsCollection.addItem(method);
			}
			
			dispatch(new GetAllMethodsEvent(GetAllMethodsEvent.EVENT_GET_ALL_METHODS_RESULT));
		}
		
		protected function onFaultHandler(event : FaultEvent):void
		{
			removeListeners();
			
		}
		
		private function removeListeners():void
		{
			service.removeEventListener(ResultEvent.RESULT, onResultHandler);
			service.removeEventListener(FaultEvent.FAULT, onFaultHandler);
		}
	}
}