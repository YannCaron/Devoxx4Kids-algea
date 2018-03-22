// -----------------------------------------------------------------------------
// CuteJet by CyaNn & ALGEA
// NE PAS MODIFIER CETTE PARTIE DU CODE

include("../includes/CuteJet.include.base");

include("../includes/CuteJet.include.level");
include("../includes/CuteJet.include.hero");

// On commence à partir d'ici
// A NOUS DE JOUER
// -----------------------------------------------------------------------------
// Variables utiles : score, life, hero

loop(50) {
	set x = random(getWidth())
	set y = random(getHeight() - 100) + 50
	
	set gem = createGem()
	gem.setX(x)
	gem.setY(y)
	gem.scale(0.5)
	
	gem.onContactWith(hero, {
		remove(gem)
		score = score + 10
	})
	
}

// -----------------------------------------------------------------------------
// NE PAS MODIFIER LA PARTIE SUIVANTE DU CODE

include("../includes/CuteJet.include.end");
