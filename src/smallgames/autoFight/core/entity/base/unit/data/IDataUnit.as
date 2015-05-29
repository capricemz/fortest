package smallgames.autoFight.core.entity.base.unit.data
{
	import flash.geom.Point;
	
	import smallgames.autoFight.core.entity.base.entity.data.IDataEntity;
	import smallgames.autoFight.core.entity.base.unit.IUnit;
	import smallgames.autoFight.data.configs.subs.ConfigAction;
	import smallgames.autoFight.data.configs.subs.ConfigUnit;

	public interface IDataUnit extends IDataEntity
	{
		function get configUnit():ConfigUnit;
		//
		function get idAction():int;
		function set idAction(value:int):void;
		function get isIdActionChange():Boolean;
		function get isActionOverByTime():Boolean;
		function get configAction():ConfigAction;
		function get idActionNext():int;
		function set idActionNext(value:int):void;
		//
		function get target():IUnit;
		function set target(value:IUnit):void;
		//
		function get dirctionTarget():Number;
		function set dirctionTarget(value:Number):void;
		function get isDirctionTargetReached():Boolean;
		function get dirctoinTargetByTarget():Number;
		//
		function get locationTarget():Point;
		function set locationTarget(value:Point):void;
		function get isLocationTargetReached():Boolean;
		function get isAtkRangeReached():Boolean;
		//
		function get isNeedThink():Boolean;
		function set isNeedThink(value:Boolean):void;
		//
		function get attrHp():int;
		function set attrHp(value:int):void;
		function get attrHpMax():int;
		function get attrAtkMax():int;
		function get attrAtkImport():int;
		function set attrAtkImport(value:int):void;
		function get isAlive():Boolean;
	}
}