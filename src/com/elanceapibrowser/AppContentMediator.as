package com.elanceapibrowser
{
	import org.robotlegs.mvcs.Mediator;
	
	public class AppContentMediator extends Mediator
	{
		public function AppContentMediator()
		{
			super();
		}
		
		[Inject]
		public var view : AppContent;
		
		override public function onRegister():void
		{
			
		}
	}
}