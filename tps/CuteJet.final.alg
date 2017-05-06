// -----------------------------------------------------------------------------
// CuteJet by CyaNn & ALGEA
// NE PAS MODIFIER CETTE PARTIE DU CODE

include("../includes/CuteJet.include.base");


// On commence à partir d'ici
// A NOUS DE JOUER
// -----------------------------------------------------------------------------
// Variables utiles : score, life, hero


set hero = createHero();
hero.tell("Allons y!")

set x = 0;
loop(200) {
    set ground = createGround();
    ground.move(x, 50);

    x = x + 100;
}

hero.applyForceX(25);

set jump = function() {
    hero.impulseY(15);
}

stage.onTap(jump);
/*
loop(25) {
    set x = random(getWidth());
    set tree = createTree();
    tree.move(x, 100);
}*/



// -----------------------------------------------------------------------------
// NE PAS MODIFIER LA PARTIE SUIVANTE DU CODE

include("../includes/CuteJet.include.end");
