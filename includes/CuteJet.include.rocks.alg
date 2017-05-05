set throwRock = function () {
	set x = hero.getX() + 750;
	set rock = createRock();

	if (x > getWidth()) return;

	rock.move(x, getHeight() - 50);
	rock.setYVelocity(-7);
	
	set contact = function (rock, other) {
		if (other.getName() == "PlanetCute/Star") {
			gameLayer.remove(rock);
			score = score + 10;
			game.createSound("Game/Toc1").play();
		}
	}
	
	rock.onContact(contact);
	if (exists(hero)) rock.onContactWith(hero, gameOver);
} 
if (exists(hero)) hero.onPulse(throwRock, 1500);
