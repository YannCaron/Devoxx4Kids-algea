// floor
set x = 0;
loop(200) {
	set ground = createGround();
	ground.move(x, 50);
	x = x + ground.getWidth();
}

// trees
loop(25) {
	set x = math.random(getWidth());
	set tree = createTree();
	tree.move(x, 100);
}
