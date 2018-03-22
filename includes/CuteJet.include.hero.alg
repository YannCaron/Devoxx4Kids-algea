// création du hero
set hero = createHero();

// le hero dit quelque chose
hero.tell("Allons y !");

// le hero avance
hero.applyForceX(25);

// faire sauter le hero
onTap({
	hero.impulseY(15);
});
