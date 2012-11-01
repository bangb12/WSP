package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent; //Imported for MouseEvent.CLICK
	import flash.text.TextField; //Imported to edit dynamic text
	
	[SWF(width = "800", height ="600", backgroundColor = "#000000")]
	
	public class Main extends Sprite
	{
		private var _ships:Array = [] //Private variable for array of various Ship variables. Made private for removal purposes.
		private var _scoreCounter:ScoreCounter = new ScoreCounter(); //Private variable for score counter. Made private for onClick function and inIt function
		private var _numClicks:uint = 0; //Private variable for numClicks. Used to determine score and if score is high enough to win the game. Removed in reset function
		private var _youWin:YouWinMsg = new YouWinMsg; //Private variable for YouWinMsg. Display if numClick == 10 and removed in reset function.
		public function Main()
		{
			var bg:Background = new Background(); //Variable containing background
			this.addChild(bg); //background added as child of Main
			inIt(); //runs the inIt function that builds most elements of the game.
		}
		private function inIt():void
		{
			for(var i:uint=0; i<6; i++) //For loop used to create 6 ships
			{
				var ship:Ship = new Ship(); //Variable contating Ship
				this.addChild(ship); //Ship added as child of Main
				ship.x = 400; //X coordinate
				ship.y = 90 + shipY; //Y coordinate. 90 + ShipY - variable used to change Y position.
				var shipY:uint = ship.y //Variable used to change the Y position of ship. Changes value each passover with ship.y.
				ship.scaleX = 1; //Declares ship.scaleX
				_ships.push(ship); //Pushes ship to _ships array
				if(i % 2 == 1) //if statement saying if i % 2 == 1. This means that if the ship is odd this activates.
				{
					ship.scaleX = -1; //changes ship scaleX to flip it in opposite direction
				}
				ship.addEventListener(MouseEvent.CLICK, onClick) //Adds mouse event to ship, activates onClick function
			}
			
			this.addChild(_scoreCounter); //_scoreCounter added as child of Main
			_scoreCounter.x = 150; //_scoreCounter x coordinate
			_scoreCounter.y = 15; //_scoreCounter y coordinate
		}
		private function onClick(event:MouseEvent):void
		{
			_numClicks++; //Adds 1 to numClicks each time ship is clicked (which activates onClick function)
			_scoreCounter.score_txt.text = "Score: " + _numClicks; //.text of _scoreCounter changed to show the text Score: and the value in _numClicks
			event.currentTarget.update(); //ship activates the update(); function in the Ship.as class.
			if(_numClicks == 50) //If numClicks == 10 then this activates
			{
				this.addChild(_youWin); //Adds _youWin as child of Main. Displayed only when you win the game which is numClicks == 10
				_youWin.x = 400; //X coordinate of _youWin
				_youWin.y = 300; //Y coordinate of _youWin
				while(_ships.length > 0) //While the _ships array has more than 0 items inside of it this will run
				{
					var removedShip:Ship = _ships.pop(); //Pops out the last item in the array into new variable removedShip
					this.removeChild(removedShip) //removes removedShip from the display list of Main
				}
				this.removeChild(_scoreCounter) //removes _scoreCounter from main display list
				_youWin.addEventListener(MouseEvent.CLICK, reset); //adds mouse event CLICK to _youWin which activates reset();
				_youWin.buttonMode = true; //changes mouse cursor to a hand on _youWin
				_youWin.scaleX = 1.2 //Changes _youWin scaleX to 1.2
			}
		}
		private function reset(event:MouseEvent):void //function that resets the game
		{
			inIt(); //Runs the inIt(); function
			this.removeChild(_youWin); //Removes _youWin from main's diplsay list
			_numClicks -= 10 //Resets numClicks to 0
			_scoreCounter.score_txt.text = "Score: " + _numClicks; //Resets score counter text back to 0 
		}
	}
}