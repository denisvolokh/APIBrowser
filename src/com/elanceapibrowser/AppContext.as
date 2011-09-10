package com.elanceapibrowser
{
	import com.elanceapibrowser.commands.GetAllMethodsCommand;
	import com.elanceapibrowser.components.HistoryPanel;
	import com.elanceapibrowser.components.HistoryPanelMediator;
	import com.elanceapibrowser.components.RequestNavContainer;
	import com.elanceapibrowser.components.RequestNavContainerMediator;
	import com.elanceapibrowser.events.GetAllMethodsEvent;
	import com.elanceapibrowser.model.AppModel;
	import com.elanceapibrowser.services.GetAllMethodsService;
	import com.elanceapibrowser.services.IGetAllMethodsService;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.Context;
	
	public class AppContext extends Context
	{
		public function AppContext(contextView:DisplayObjectContainer=null)
		{
			super(contextView, true);
		}
		
		override public function startup():void
		{
			injector.mapSingleton(AppModel);
			
			mediatorMap.mapView(RequestNavContainer, RequestNavContainerMediator);
			mediatorMap.mapView(HistoryPanel, HistoryPanelMediator);
			
			injector.mapSingletonOf(IGetAllMethodsService, GetAllMethodsService);
			
			commandMap.mapEvent(GetAllMethodsEvent.EVENT_GET_ALL_METHODS, GetAllMethodsCommand, GetAllMethodsEvent);
			
			super.startup();
		}
	}
}