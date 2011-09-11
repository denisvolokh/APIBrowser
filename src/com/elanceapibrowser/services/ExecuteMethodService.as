package com.elanceapibrowser.services
{
	import com.elanceapibrowser.events.ExecuteMethodEvent;
	import com.elanceapibrowser.model.AppModel;
	
	import org.robotlegs.mvcs.Actor;
	
	public class ExecuteMethodService extends Actor implements IExecuteMethodService
	{
		public function ExecuteMethodService()
		{
			super();
		}
		
		[Inject]
		public var model : AppModel;
		
		public function load(...params):void
		{
			model.historyCollection.addItem("new method");
			
			this.dispatch(new ExecuteMethodEvent(ExecuteMethodEvent.EVENT_EXECUTE_METHOD_RESULT));
		}
	}
}