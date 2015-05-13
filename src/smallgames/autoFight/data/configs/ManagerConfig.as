package smallgames.autoFight.data.configs
{
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import mx.core.ByteArrayAsset;
	
	import smallgames.autoFight.common.ManagerBase;
	
	public class ManagerConfig extends ManagerBase
	{
		private static var _instance:ManagerConfig;
		public static function get instance():ManagerConfig
		{
			return _instance || new ManagerConfig(privateFunc);
		}
		private static function privateFunc():void{}
		
		private var _dictionary:Dictionary;
		
		public function ManagerConfig(func:Function)
		{
			if(func != privateFunc)
			{
				throw new Error("该类使用单例模式");
			}
			_instance = this;
			initialize();
		}
		
		private function initialize():void
		{
			_dictionary = new Dictionary();
		}
		
		public function initData():void
		{
			var cfgInfos:Vector.<DataConfigItem> = notify(ConstConfig.HANDLE_EMBED) as Vector.<DataConfigItem>;
			var time1:int = getTimer();
			var l:int = cfgInfos.length;
			for (var i:int = 0; i < l; i++)
			{
				var time3:int = getTimer();
				rslvData(cfgInfos[i].type, cfgInfos[i].keys, cfgInfos[i].ClassEmbed, cfgInfos[i].ClassConfig);
				var time4:int = getTimer();
				trace("ConfigDataManager.initData(cfgInfos) 表"+cfgInfos[i].ClassEmbed+"，花费："+(time4 - time3));
			}
			var time2:int = getTimer();
			trace("ConfigDataManager.initData(cfgInfos) 总消耗时间："+(time2 - time1));
		}
		/**解析配置信息*/
		private function rslvData(dicKey:int, idNames:String, EmbedClass:Class, DataItemClass:Class):void
		{
			var dictionary:Dictionary, tempDic:Dictionary, vctIdName:Vector.<String>, idName:String;
			var byteArray:ByteArrayAsset, infos:String;
			var split:Vector.<String>;
			var substr:String;
			var split2:Vector.<String>, header:String, varNames:Vector.<String>, dataItem:Object;
			var i:int, il:int, j:int, jl:int, k:int, kl:int;
			
			//构建储存字典以及id名称数组
			dictionary = new Dictionary();
			vctIdName = Vector.<String>(idNames.split(","));
			//
			byteArray = ByteArrayAsset(new EmbedClass());
			infos = byteArray.readUTFBytes(byteArray.length);
			/*trace(infos);*/
			//取变量名
			split = Vector.<String>(infos.split("[data]\r\n"));
			substr = split[0].substr(8);
			split2 = Vector.<String>(substr.split("\r\n"));
			while (split2[split2.length - 1] == "")
			{
				split2.pop()
			}
			while (split2[0] == "")
			{
				split2.shift();
			}
			varNames = new Vector.<String>();
			varNames = Vector.<String>(split2[0].split("\t"));
			//数据赋值
			split = Vector.<String>(split[1].split("\r\n"));
			while (split.length - 1 != -1 && split[split.length - 1] == "")
			{
				split.pop();//删除无用的最后一个空字符串
			}
			il = split.length;
			for (i = 0; i < il; i++)//行
			{
				split2 = Vector.<String>(split[i].split("\t"));//列
				dataItem = new DataItemClass();
				jl = varNames.length;
				for (j = 0; j < jl; j++)
				{
					dataItem[varNames[j]] = split2[j];
				}
				tempDic = dictionary;
				kl = vctIdName.length;
				for (k = 0; k < kl; k++)
				{
					if (k == kl - 1)
					{
						tempDic[dataItem[vctIdName[k]]] = dataItem;
					}
					else
					{
						if (!tempDic[dataItem[vctIdName[k]]])
							tempDic[dataItem[vctIdName[k]]] = new Dictionary();
						tempDic = tempDic[dataItem[vctIdName[k]]];
					}
				}
			}
			_dictionary[dicKey] = dictionary;
		}
		/**
		 * 在多层字典中搜索获取配置数据类（防报空）
		 * @param vars 键值数组，后入先出
		 * @param object 顶层字典
		 * @return
		 */
		private function searchGetCfgDt(vars:Vector.<int>, object:Object):Object
		{
			while (vars.length)
			{
				object = object[vars.pop()];
				if (!object)
				{
					return null;
				}
			}
			return object;
		}
	}
}