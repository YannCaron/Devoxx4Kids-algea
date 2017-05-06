 // shoot
set shoot = function () {
	set x = hero.getX() + 100;
	set y = hero.getY();

	set shoot = createShoot(x, y);
	shoot.setXVelocity(25);

}

onKey(shoot);