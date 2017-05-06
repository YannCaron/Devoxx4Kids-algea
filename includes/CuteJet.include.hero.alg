// création du hero
set hero = createHero();

// le hero dit quelque chose
hero.say(font, "Allons y !");

// le hero avance
hero.applyForceX(25);

// faire sauter le hero
set jump = function() {
	hero.impulseY(15);
}
stage.onTap(jump);
