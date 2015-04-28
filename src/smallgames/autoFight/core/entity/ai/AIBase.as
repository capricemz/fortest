package smallgames.autoFight.core.entity.ai
{
	import smallgames.autoFight.core.entity.base.IUnit;

	public class AIBase
	{
		/**思考时间间隔*/		
		private const SPACING_INTERVAL:int = 3000;
		
		private var _timeNow:int;
		private var _timeLast:int;
		private var _user:IAIUser;
		
		public function AIBase(user:IAIUser)
		{
			_user = user;
		}
		
		public function think(timeDiff:int):void
		{
			_timeNow += timeDiff;
			if(_timeNow > _timeLast + SPACING_INTERVAL)
			{
				_timeLast = _timeNow;
				var value:int = int(Math.random()*3);
				_user.actionSet(value);
			}
		}
	}
}