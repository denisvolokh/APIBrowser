package com.elanceapibrowser.commands
{
	import com.elanceapibrowser.events.GetAllMethodsEvent;
	import com.elanceapibrowser.services.GetAllMethodsService;
	import com.elanceapibrowser.services.IGetAllMethodsService;
	
	import org.robotlegs.mvcs.Command;
	
	public class GetAllMethodsCommand extends Command
	{
		public function GetAllMethodsCommand()
		{
			super();
		}
		
		[Inject]
		public var service : IGetAllMethodsService;
		
		[Inject]
		public var event : GetAllMethodsEvent;
		
		override public function execute():void
		{
			service.load(event.params);
		}
	}
}