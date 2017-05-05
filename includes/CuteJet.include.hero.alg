set hero = createHero();

// le hero avance
hero.applyForceX(25);

// faire sauter le hero
set jump = function() {
	if (hero.getY() < stage.getHeight() - 200) {
		hero.impulseY(15);
	}
}
stage.onTap(jump);

// le hero dit quelque chose
hero.say(font, "Allons y !");
