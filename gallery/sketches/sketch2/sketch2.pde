HSwarm swarm;
HDrawablePool pool;
HTimer timer;

void setup() {
	size(650,300);
	H.init(this).background(#ffffff).autoClear(false);
	smooth();

	swarm = new HSwarm()
		.addGoal(H.mouse())
		.speed(3)
		.turnEase(0.1f)
		.twitch(1)
	;

	pool = new HDrawablePool(40);
	pool.autoAddToStage()
		.add (
			new HRect()
			.rounding(4)
			
		)

		.colorist(new HColorPool(#234D20, #36802D, #77AB59, #C9DF8A, #F0F7DA).fillOnly())

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.size((int)random(1,4), (int)random(10,30) )
						//.strokeWeight(2)
						.noStroke()
						.loc( 0,0)
						.anchorAt( H.CENTER )
					;

					swarm.addTarget(d);
				}
			}
		)
	;

	timer = new HTimer()
		.numCycles( pool.numActive() )
		.interval(250)
		.callback(
			new HCallback() { 
				public void run(Object obj) {
					pool.request();
				}
			}
		)
	;
}

void draw() {
	H.drawStage();
}