package com.elanceapibrowser.services
{
	import com.elanceapibrowser.events.ExecuteMethodEvent;
	import com.elanceapibrowser.model.AppModel;
	import com.elanceapibrowser.model.MethodParams;
	
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
		override public function load(params : MethodParams):void
		{
			service.url = AppModel.apiBaseUrl + params.fullpath;
			service.send();
			
			model.historyCollection.addItem(params.signature);
		}
		
		override protected function onResultHandler(event : ResultEvent):void
		{
			this.dispatch(new ExecuteMethodEvent(ExecuteMethodEvent.EVENT_EXECUTE_METHOD_RESULT));
		}
		
		override protected function onFaultHandler(event : FaultEvent):void
		{
			this.dispatch(new ExecuteMethodEvent(ExecuteMethodEvent.EVENT_EXECUTE_METHOD_FAULT));
		}
	}
}