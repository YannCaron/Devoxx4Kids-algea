// -----------------------------------------------------------------------------
// CuteJet by CyaNn & ALGEA
// NE PAS MODIFIER CETTE PARTIE DU CODE

include("../includes/CuteJet.include.base");

// On commence à partir d'ici
// A NOUS DE JOUER
// -----------------------------------------------------------------------------
// Variables utiles : score, life, hero

// le hero
set hero = createHero()
hero.tell("Allons y !")

// le sol
set x = 50
loop(100) {
	set ground = createGround()
	ground.setX(x)
	ground.setY(50)
	
	x = x + 100
}

hero.applyForceX(25)

onTap({
    hero.impulseY(15)
})

loop(25) {
    set x = random(getWidth())
    set tree = createTree()
    tree.setX(x)
    tree.setY(100)
}

// -----------------------------------------------------------------------------
// NE PAS MODIFIER LA PARTIE SUIVANTE DU CODE

include("../includes/CuteJet.include.end");
