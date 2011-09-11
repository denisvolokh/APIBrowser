package com.elanceapibrowser.commands
{
	import com.elanceapibrowser.events.ExecuteMethodEvent;
	import com.elanceapibrowser.services.IExecuteMethodService;
	
	import org.robotlegs.mvcs.Command;
	
	public class ExecuteMethodCommand extends Command
	{
		public function ExecuteMethodCommand()
		{
			super();
		}
		
		[Inject]
		public var event : ExecuteMethodEvent;
		
		[Inject]
		public var service : IExecuteMethodService;
		
		override public function execute():void
		{
			service.load();	
		}
	}
}