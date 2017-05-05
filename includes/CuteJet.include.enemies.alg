// enemies
loop (25) {
	set x = random(getWidth());
	
	set enemy = createEnemy(x, 100);
	set enemy.force = 15;
	
	enemy.applyForceX(enemy.force);
	
	set contact = function (enemy, other) {
		if (other.getName() == "PlanetCute/Star") {
			gameLayer.remove(enemy);
			score = score + 15;
			game.createSound("Game/Toc1").play();
		} elseif (!other.getName().contains("Block")) {
			enemy.force = -enemy.force;
			enemy.applyForceX(enemy.force);
			enemy.flipX();
		}
	}
	
	enemy.onContact(contact);
	
} 
