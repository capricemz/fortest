package smallgames.autoFight.core.entity.sub.unit.ai
{
	import smallgames.autoFight.core.entity.base.IUnit;

	public interface IAIUser
	{
		function actionSet(action:int,target:IUnit):void;
		function set beAtk(value:int):void;
	}
}