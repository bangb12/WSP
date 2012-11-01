package
{
	import flash.events.Event; //Imported for Event.ENTER_FRAME

	public class Ship extends ShipBase
	{
		private var _speedX:Number = .15; //Variable used to determine speed of ships
		public function Ship()
		{
			super();
			this.addEventListener(Event.ENTER_FRAME, move); //adds event listener to Ship that activates move(); based on framerate
			this.buttonMode = true; //adds hand icon to cursor on Ship
			this.scaleX = 1; //Sets the scaleX of ship to 1
		}
		private function move(event:Event):void
		{
			if(this.scaleX == 1) //If Ship.scaleX == 1 then this activates
			{
				this.x += _speedX //moves Ship to the right
			}
			if(this.scaleX == -1) //If Ship.scaleX == -1 then this activates 
			{
				this.x += -_speedX //moves Ship to the left
			}
			if(this.x < - 50) //If Ship.x is less than - 50 resets to opposite side of the stage
			{
				this.x = 850; //Changes Ship.x to 850
			}
			if(this.x > 850) //If Ship.x is more than 850 resets to opposite side of the stage
			{
				this.x = -50 //Changes Ship.x to -50
			}
		}
		public function update():void //Function occurs when a ship is clicked in Main. Increments speed and flips ship
		{
			this.scaleX *= -1; //Flips ship by multiplying Ship.scaleX by -1 (this will cause it to reverse position)
			_speedX *= 2; //Increments the speed of the ship by 2 each time
		}
	}
}