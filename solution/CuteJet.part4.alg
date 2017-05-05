// -----------------------------------------------------------------------------
// CuteJet by CyaNn & ALGEA
// NE PAS MODIFIER CETTE PARTIE DU CODE

include("../includes/CuteJet.include1");
include("../includes/CuteJet.include2");

// On commence à partir d'ici
// A NOUS DE JOUER
// -----------------------------------------------------------------------------
// Variables utiles : score, life, hero

loop (25) {
	
	set x = math.random(gameLayer.getWidth())
	set y = math.random(gameLayer.getHeight())
	
	set gem = gameLayer.createActor(
	"PlanetCute/Gem Green");
	
	gem.scale(0.5)
	gem.move(x, y)
	
	gem.typeSensor().hitCircle()
	
}













// -----------------------------------------------------------------------------
// NE PAS MODIFIER LA PARTIE SUIVANTE DU CODE

include("../includes/CuteJet.include3");