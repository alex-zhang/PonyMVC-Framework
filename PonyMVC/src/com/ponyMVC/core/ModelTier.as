package com.ponyMVC.core
{
	import com.ponyMVC.IModel;
	use namespace ponyMVCS_internal;
	
	public class ModelTier extends BusinessLogicTierBase implements IModelTier
	{
		public function ModelTier()
		{
			super();
		}
		
		public function registerModel(name:String, model:IModel):void
		{
			registerBusinessLogicItem(name, model);
		}
		
		public function findModel(name:String):IModel
		{
			return findBusinessLogicItem(name) as IModel;
		}
		
		public function removeModel(name:String):IModel
		{
			return removeBusinessLogicItem(name) as IModel;
		}
		
		public function hasModel(name:String):Boolean
		{
			return hasBusinessLogicItem(name);
		}
		
		public function removeAllModels():void
		{
			removeAllBusinessLogicItems();
		}
	}
}