package com.ponyMVC.core
{
	import com.ponyMVC.IMediator;

	public interface IViewTier extends IBusinessLogicItem
	{
		function registerMediator(mediatorName:String, mediator:IMediator):void;
		
		function findMediator(mediatorName:String):IMediator;
		
		function removeMediator(mediatorName:String):IMediator;
		
		function hasMediator(mediatorName:String):Boolean;
		
		function removeAllMediator():void;
	}
}