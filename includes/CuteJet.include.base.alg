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
set gameOver = function (rock, actor) {
	life--;
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
		gameLayer.remove(rock);

		set sound = game.createSound("Game/Explode1").play();

		actor.onPulse({
			actor.setAlpha(if (actor.getAlpha() == 1) 0.2 else 1)
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
set random = math.random;
set getWidth = gameLayer.getWidth;
set getHeight = gameLayer.getHeight;

set createHero = function () {
	set hero = gameLayer.createActor("PlanetCute/beetleship")
		.move(200, 700)
		.typeDynamic().hitCircle(15);	

	set hero.tell = function (msg) {
		hero.say(font, msg);
	}
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

set createRock = function () {
	return gameLayer.createActor("PlanetCute/Rock")
		.typeSensor().hitCircle();
}

set createEnemy = function (x, y) {
	return gameLayer.createActor("PlanetCute/Enemy Bug", x, y)
		.typeDynamic().hitCircle().fixeRotation();
}

set createShoot = function (x, y) {
	return gameLayer.createActor("PlanetCute/Star", x, y)
		.typeDynamic().hitCircle();
}