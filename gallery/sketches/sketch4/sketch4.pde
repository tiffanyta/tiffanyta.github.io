HColorPool colors;
HFollow mf;
HRect d;

void setup() {
	size(600,350);
	// 	HText f1 = new HText("move your mouse over the canvas",12);
	// f1.fill(#FFFFFF).anchorAt(H.CENTER).loc(width/2,height/2 - 100);
	// H.add(f1);
	H.init(this).background(#202020).autoClear(false);
	smooth();




	colors = new HColorPool(#000927, #031D58, #2A538C, #90C2BE, #AFD6D4);

	d = new HRect(50);
	d
		.rounding(40)
		.noStroke()
		.loc(width/2, height/2)
		.anchorAt(H.CENTER)
		.rotation(45)
		;

		H.add(d);

	mf = new HFollow()
		.target(d)
		.ease(0.1)
		.spring(0.95)
		;
	


}

void draw() {
	d.fill(colors.getColor() );

	H.drawStage();

	
}

