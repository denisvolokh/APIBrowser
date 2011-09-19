package com.elanceapibrowser.services
{
	import com.elanceapibrowser.model.AppModel;
	import com.elanceapibrowser.model.MethodParam;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	import org.robotlegs.mvcs.Actor;

	public class BasicService extends Actor implements IBasicService
	{
		[Inject]
		public var model : AppModel;
		
		public function BasicService()
		{
			service = new HTTPService();
			service.method = "POST";
			service.useProxy = false;
			service.showBusyCursor = true;
			service.addEventListener(ResultEvent.RESULT, onResultHandler);
			service.addEventListener(FaultEvent.FAULT, onFaultHandler);
		}
		
		protected var service : HTTPService;
		
		public function load(params : MethodParam):void
		{
			
		}
		
		protected function onResultHandler(event : ResultEvent):void
		{
			service.removeEventListener(ResultEvent.RESULT, onResultHandler);
		}
		
		protected function onFaultHandler(event : FaultEvent):void
		{
			service.removeEventListener(FaultEvent.FAULT, onFaultHandler);
		}
	}
}