 // shoot
set shoot = function () {
	set x = hero.getX();
	set y = hero.getY() - hero.getHeight() / 2;

	set shoot = createShoot(x, y);
	shoot.scale(0.5);
	shoot.setXVelocity(hero.getXVelocity());
	shoot.setYVelocity(-10);
	
	shoot.onContact((shoot) { gameLayer.remove(shoot); });
}
if (exists(hero)) hero.onPulse(shoot, 100);