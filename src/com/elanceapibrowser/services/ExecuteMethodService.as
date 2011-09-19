package com.elanceapibrowser.services
{
	import com.elanceapibrowser.events.ExecuteMethodEvent;
	import com.elanceapibrowser.model.AppModel;
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
		override public function load(params : MethodParam):void
		{
			service.url = AppModel.apiBaseUrl + params.fullpath;
			service.send();
			
			model.historyCollection.addItem(params.signature);
		}
		
		override protected function onResultHandler(event : ResultEvent):void
		{
			super.onResultHandler(event);
			
			this.dispatch(new ExecuteMethodEvent(ExecuteMethodEvent.EVENT_EXECUTE_METHOD_RESULT));
		}
		
		override protected function onFaultHandler(event : FaultEvent):void
		{
			super.onFaultHandler(event);
			
			this.dispatch(new ExecuteMethodEvent(ExecuteMethodEvent.EVENT_EXECUTE_METHOD_FAULT));
		}
	}
}