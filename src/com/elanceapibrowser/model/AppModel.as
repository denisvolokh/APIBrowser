package com.elanceapibrowser.model
{
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Actor;
	
	public class AppModel extends Actor
	{
		public function AppModel()
		{
			super();
		}
		
		public var allMethodsCollection : ArrayCollection = new ArrayCollection;
		
		public var historyCollection : ArrayCollection = new ArrayCollection;
	}
}