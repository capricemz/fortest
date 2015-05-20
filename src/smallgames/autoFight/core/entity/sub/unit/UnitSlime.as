package smallgames.autoFight.core.entity.sub.unit
{
	import smallgames.autoFight.core.entity.StringEntity;
	import smallgames.autoFight.core.entity.base.unit.Unit;
	
	public class UnitSlime extends Unit implements IUnitSlime
	{
		override public function get name():String
		{
			return StringEntity.UNIT_SLIME + data.id;
		}
		
		public function UnitSlime()
		{
			super();
		}
	}
}