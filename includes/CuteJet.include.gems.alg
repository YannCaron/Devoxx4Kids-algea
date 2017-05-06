loop(50) {
	set x = random(getWidth());
	set y = random(getHeight() - 150) + 100;
	
	set gem = createGem();
	gem.move(x, y);
	gem.scale(0.5);
	
	set winGem = function () {
		score = score + gem.score;
		remove(gem);
		game.createSound("Game/Ring2").play();
	};
	
	if (exists(hero)) gem.onContactWith(hero, winGem);
}