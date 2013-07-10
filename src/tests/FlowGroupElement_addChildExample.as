package tests {    
	import flash.display.Sprite;
	import flash.text.engine.GraphicElement;
	
	import flashx.textLayout.container.ContainerController;
	import flashx.textLayout.elements.ParagraphElement;
	import flashx.textLayout.elements.SpanElement;
	import flashx.textLayout.elements.TextFlow;
	
	public class FlowGroupElement_addChildExample extends Sprite
	{        
		public function FlowGroupElement_addChildExample()
		{
			// create string for text flow
			var simpleText:String = "It was a dark and stormy night.";        
			
			// define TextFlow, ParagraphElement, and SpanElement objects
			var textFlow:TextFlow = new TextFlow();            
			var paragraph:ParagraphElement = new ParagraphElement();
			var span:SpanElement = new SpanElement();
			span.text = simpleText;
			var span1:SpanElement = new SpanElement();
			span1.text = simpleText;
			var pic:GraphicElement
			// add span to paragraph and add paragraph to text flow
			paragraph.addChild(span);
			paragraph.addChild(span1);
			textFlow.addChild(paragraph);
			// assign composer and controller and update controller to display text
			textFlow.flowComposer.addController(new ContainerController(this,200,200));
			textFlow.flowComposer.updateAllControllers();
		}
	}
}
