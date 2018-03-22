// -----------------------------------------------------------------------------
// CuteJet by CyaNn & ALGEA
// NE PAS MODIFIER CETTE PARTIE DU CODE

include("../includes/CuteJet.include.base");

include("../includes/CuteJet.include.level");
include("../includes/CuteJet.include.hero");
include("../includes/CuteJet.include.gems");

// On commence à partir d'ici
// A NOUS DE JOUER
// -----------------------------------------------------------------------------
// Variables utiles : score, life, hero

loop(20) {

}

onKey({
	set x = hero.getX() + 50
	set y = hero.getY()
	
	set shoot = createShoot(x, y)
	shoot.setXVelocity(25)
})














// -----------------------------------------------------------------------------
// NE PAS MODIFIER LA PARTIE SUIVANTE DU CODE

include("../includes/CuteJet.include.end");
