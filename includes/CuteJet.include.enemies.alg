// ennemies
loop(20) {
	set x = random(getWidth() - 1000) + 900;
	set y = random(getHeight() - 150) + 100;

	set enemy = createEnemy();
	enemy.move(x, y);
	enemy.setXVelocity(-50);

	set lose = function () {
		remove(enemy);
		life = life - 1;
		testGameOver();
	}

	if (exists(hero)) enemy.onContactWith(hero, lose);
}