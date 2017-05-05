set hero = gameLayer.createActor("PlanetCute/beetleship");
hero.move(200, 700);
hero.typeDynamic().hitCircle(15);

// floor
set x = 0;
set i = 0;
set grounds = array {"Grass Block", "Dirt Block", "Brown Block"};
loop(200) {
	if (math.random(5) == 0) {
		i = math.random(grounds.length());
	}
	
	set ground = gameLayer.createActor("PlanetCute/" .. grounds[i]);
	ground.move(x, 50);
	ground.typeStatic().hitSquare(75);
	x = x + ground.getWidth();
}

// trees
set trees = array {"Tree Short", "Tree Tall", "Tree Ugly"};
loop(25) {
	set x = math.random(gameLayer.getWidth());
	set i = math.random(trees.length());
	
	set tree = gameLayer.createActor("PlanetCute/" .. trees[i]);
	tree.move(x, 100);
	tree.typeStatic().hitSquare();
}

// le hero avance
hero.applyForceX(25);

// on limite sa vitesse
hero.setMaxVelocity(10);

// mais ne tourne pas
hero.fixeRotation();

// et la caméra le suit
gameLayer.follow(hero);

// jump
set jump = function() {
	if (hero.getY() < stage.getHeight() - 200) {
		hero.impulseY(15);
	}
}
stage.onTap(jump);
