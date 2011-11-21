package com.elanceapibrowser.model
{
	import com.abdulqabiz.QueryString;
	import com.elanceapibrowser.events.HistoryEvent;
	
	import flash.external.ExternalInterface;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.core.FlexGlobals;
	import mx.events.CollectionEvent;
	import mx.utils.URLUtil;
	
	import org.robotlegs.mvcs.Actor;
	
	public class AppModel extends Actor
	{
		public function AppModel()
		{
			super();
			
			var server : String = URLUtil.getServerName(FlexGlobals.topLevelApplication.url)
			if (server != "")
			{
				serversCollection.addItem(server);
			}
			
			if (FlexGlobals.topLevelApplication.parameters.hasOwnProperty("access_token"))
			{
				accessToken = FlexGlobals.topLevelApplication.parameters.access_token;
			}
			else
			{
				var queryString : QueryString = new QueryString();
				if (queryString.parameters.hasOwnProperty("access_token"))
				{
					accessToken = queryString.parameters.access_token;
				}
			}
			
			historyCollection = new ArrayCollection;
			historyCollection.addEventListener(CollectionEvent.COLLECTION_CHANGE, handleHistoryCollectionChanged);
		}
		
		public var serversCollection : ArrayCollection = new ArrayCollection(['https://api.elance.com/', 'https://externaldev.elance.com:15069/']);
		
		public var selectedServer : String; // = "https://api.elance.com/api2/" //https://externaldev.elance.com:15069/api2/";
		
		public var allMethodsCollection : ArrayCollection = new ArrayCollection;
		
		public var historyCollection : ArrayCollection; // collection of 
	
		public var  accessToken : String = "";
		
		private function handleHistoryCollectionChanged(event : CollectionEvent):void
		{
			this.dispatch(new HistoryEvent(HistoryEvent.EVENT_ADDED_TO_HISTORY));	
		}
		
		public function getAPIUrl():String
		{
			return selectedServer + "api2/reflection/apis?access_token=" + accessToken;
		}
	}
}