// CuteJet by CyaNn & ALGEA

// variables
set font = game.createFont("emulogic", 12, game.color.WHITE);

// stage
set stage = game.createStage(0, -10);
set gameLayer = stage.createLayer();
set scoreLayer = stage.createLayer();

// score
set score;
set scoreLabel = scoreLayer.createLabel(font, score, 10, stage.getHeight() - 25);
score.onChanged( {scoreLabel.setText("score:: " .. score); } );
score = 0;

// button
scoreLayer
	.createButton(font, "black", "debug", stage.getWidth() - 115, stage.getHeight() - 70)
	.onTap ({ game.setDebug(!game.getDebug()); });

// life
set life;
set lifeLabel = scoreLayer.createLabel(font, score, 150, stage.getHeight() - 25);
life.onChanged ( {lifeLabel.setText("life:: " .. life); } );
life = 5;

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

set createHero = function () {
	set hero = gameLayer.createActor("PlanetCute/beetleship")
		.move(200, 700)
		.typeDynamic().hitCircle(15)	
		.fixeRotation().setMaxVelocity(20);

	set hero.tell = function (msg) {
		hero.say(font, msg);
	}

	gameLayer.follow(hero);

	return hero;
}

set groundType = 0;
set createGround = function () {
	if (math.random(5) == 0) groundType = math.random(3);
	return gameLayer.createActor("PlanetCute/" .. array {"Grass Block", "Dirt Block", "Brown Block"}[groundType])
		.typeStatic().hitSquare(75);	
}

set createTree = function () {
	set type = math.random(3);
	return gameLayer.createActor("PlanetCute/" .. array {"Tree Short", "Tree Tall", "Tree Ugly"}[type])
		.typeStatic().hitSquare();	
}

set createGem = function () {
	set type = math.random(3);
	set gem = gameLayer.createActor(
	"PlanetCute/" .. array {"Gem Green", "Gem Blue", "Gem Orange"}[type], 0, 0)
		.typeSensor().hitCircle();
	set gem.score = array {10, 20, 30}[type];

	return gem;
}

set createEnemy = function () {
	return gameLayer.createActor("PlanetCute/Enemy Bug", 100, 100)
		.typeSensor().hitCircle()
		.fixeRotation().flipX()
		.setMaxVelocity(20);
}

set createShoot = function (x, y) {
	set shoot = gameLayer.createActor("PlanetCute/Star", x, y)
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