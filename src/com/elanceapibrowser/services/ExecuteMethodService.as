package com.elanceapibrowser.services
{
	import com.elanceapibrowser.events.ExecuteMethodEvent;
	import com.elanceapibrowser.model.AppModel;
	import com.elanceapibrowser.model.Method;
	import com.elanceapibrowser.model.MethodParam;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	public class ExecuteMethodService extends BasicService implements IExecuteMethodService
	{
		public function ExecuteMethodService()
		{
			super();
		}
		
		//0 - full path
		//1 - signature
		override public function load(method : Method):void
		{
			service.url = model.selectedServer + method.fullpathQueryUrl;
			//service.url = "https://api.elance.com/api2/jobs/my?access_token=4e83b8f0a76da1af49000006%7C2866767%7C7O7Lx7r2kZdOCEd8FF4Veg&expires_in=1321409650&refresh_token=2866767%7CXy7zW1o7x3itG0j3ZTwZVQ&token_type=bearer&signature=f9423c8d7e93d04d1c2b86d5d5fda3a844d99dc56887b07cc61fb69c19a63727"
			service.send();
			
			model.historyCollection.addItem(method);
		}
		
		override protected function onResultHandler(event : ResultEvent):void
		{
			super.onResultHandler(event);
			
			var e : ExecuteMethodEvent = new ExecuteMethodEvent(ExecuteMethodEvent.EVENT_EXECUTE_METHOD_RESULT);
			e.content = event.result.content as String;
			this.dispatch(e);
		}
		
		override protected function onFaultHandler(event : FaultEvent):void
		{
			super.onFaultHandler(event);
			
			var e : ExecuteMethodEvent = new ExecuteMethodEvent(ExecuteMethodEvent.EVENT_EXECUTE_METHOD_FAULT);
			e.content = event.fault.content as String;
			this.dispatch(e);
		}
	}
}