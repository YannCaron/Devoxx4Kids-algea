// -----------------------------------------------------------------------------
// CuteJet by CyaNn & ALGEA
// NE PAS MODIFIER CETTE PARTIE DU CODE

include("../includes/CuteJet.include1");
include("../includes/CuteJet.include2");

// On commence à partir d'ici
// A NOUS DE JOUER
// -----------------------------------------------------------------------------
// Variables utiles : score, life, hero

// gemmes
loop (25) {
	
	set x = math.random(gameLayer.getWidth())
	set y = math.random(gameLayer.getHeight())
	
	set gem = gameLayer.createActor(
	"PlanetCute/Gem Green");
	
	gem.scale(0.5)
	gem.move(x, y)
	
	gem.typeSensor().hitCircle()
	
	set winGem = function() {
		score = score + 10
		gameLayer.remove(gem)
	}
	
	gem.onContactWith(hero, winGem)
	
}

// pierres
set throwRock = function () {
  set y = math.random(gameLayer.getHeight())
  set rock = gameLayer.createActor("PlanetCute/Rock", 1500, y)

  rock.typeSensor().hitCircle();
  rock.setXVelocity(-5);

  rock.onContactWith(hero, gameOver);
}
hero.onPulse(throwRock, 1500);

// -----------------------------------------------------------------------------
// NE PAS MODIFIER LA PARTIE SUIVANTE DU CODE

include("../includes/CuteJet.include3");