package com.elanceapibrowser.components
{
	import org.robotlegs.mvcs.Mediator;
	
	public class MainPanelMediator extends Mediator
	{
		public function MainPanelMediator()
		{
			super();
		}
		
		[Inject]
		public var view : MainPanel;
		
		override public function onRegister():void
		{
			
		}
	}
}