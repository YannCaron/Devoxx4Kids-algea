// CuteJet by CyaNn & ALGEA

// variables
set font = game.createFont("emulogic", 12, game.color.WHITE);

// stage
set stage = game.createStage(0, -10);
set gameLayer = stage.createLayer();
set scoreLayer = stage.createLayer();

set onTap = function(f) {
	stage.onTap(f)
}

// score
set score;
set scoreLabel = scoreLayer.createLabel(font, score, 10, stage.getHeight() - 25);
score.onChanged( {scoreLabel.setText("score:: " .. score); } );
score = 0;

// button
scoreLayer
	.createButton(font, "black", "debug", stage.getWidth() - 115, stage.getHeight() - 70)
	.onTap ({ game.setDebug(!game.getDebug()); });

// gameover
set testGameOver = function () {
	if (life == 0) {
		set font = game.createFont("emulogic", 25, game.color.RED);
		set over = game.createStage(0, 0);
		set layer = over.createLayer();

		layer.createRepeatedImage("PlanetCute/Sky");
		layer.createActor("PlanetCute/planet", 300, 250);
		layer.createLabel(font, "Game Over", over.getWidth() / 2 - 75, over.getHeight() / 2);
		game.goNext();

		set sound = game.createSound("Game/Explode1").play();

	} else {
		set sound = game.createSound("Game/Explode1").play();

		if (exists(hero))
			hero.onPulse({
				hero.setAlpha(if (hero.getAlpha() == 1) 0.2 else 1)
			}, 20, 20);

	}
};

// life
set life;
set lifeLabel = scoreLayer.createLabel(font, score, 150, stage.getHeight() - 25);
life.onChanged ( {lifeLabel.setText("life:: " .. life); testGameOver(); } );
life = 5;

set gameWin = function (wall, actor) {
	set font = game.createFont("emulogic", 25, game.color.WHITE);
	set over = game.createStage(0, 0);
	set layer = over.createLayer();

	layer.createRepeatedImage("PlanetCute/Sky");
	layer.createActor("PlanetCute/planet", 300, 250);
	layer.createLabel(font, "You win", over.getWidth() / 2 - 75, over.getHeight() / 2);
	game.goNext();

	set sound = game.createSound("Game/Win1").play();
};

// background
gameLayer.createRepeatedImage("PlanetCute/Sky");

// simplifications
set random = function(x) { return math.random(x + 1) };
set getWidth = gameLayer.getWidth;
set getHeight = gameLayer.getHeight;
set remove = gameLayer.remove;
set onKey = stage.onKey;

set createHero = function (path) {
	set img = if (path.isNull()) "PlanetCute/beetleship" else path
	set hero = gameLayer.createActor(img)
		.move(200, 700)
		.typeDynamic().hitCircle(15)	
		.fixeRotation()
		.setMaxVelocity(20);

	set hero.tell = function (msg) {
		hero.say(font, msg);
	}

	gameLayer.follow(hero);

	return hero;
}

set groundType = 0;
set createGround = function (path) {
	if (math.random(5) == 0) groundType = math.random(3);

	//set img = if (path.isNull()) "PlanetCute/" .. array {"Grass Block", "Dirt Block", "Brown Block"}[groundType] else path

	return gameLayer.createActor("PlanetCute/" .. array {"Grass Block", "Dirt Block", "Brown Block"}[groundType])
		.typeStatic().hitSquare(75);	
}

set createTree = function (path) {
	set img = if (path.isNull()) "PlanetCute/" .. array {"Tree Short", "Tree Tall", "Tree Ugly"}[math.random(3)] else path

	return gameLayer.createActor(img)
		.typeStatic().hitSquare();	
}

set createGem = function (path) {
	set type = math.random(3);
	set img = if (path.isNull()) "PlanetCute/" .. array {"Gem Green", "Gem Blue", "Gem Orange"}[type] else path

	set gem = gameLayer.createActor(img)
		.typeSensor().hitCircle();
	set gem.score = array {10, 20, 30}[type];

	return gem;
}

set createEnemy = function (path) {
	set img = if (path.isNull()) "PlanetCute/Enemy Bug" else path

	return gameLayer.createActor(img)
		.move(500, 500)
		.typeSensor().hitCircle()
		.fixeRotation().flipX()
		.setMaxVelocity(35);
}

set createShoot = function (x, y, path) {
	set img = if (path.isNull()) "PlanetCute/Star" else path

	set shoot = gameLayer.createActor(img, x, y)
		.typeDynamic().hitCircle().setGravityScale(0)
		.scale(0.5);

	game.createSound("Futur/Zap3").play()

	shoot.onContact((self, other) {
		if (!exists(hero) || other != hero) remove (self);
		if (other.getName().contains("Enemy")) {
			remove (other);
			game.createSound("Game/Toc1").play()
		}
	});

	return shoot;
}