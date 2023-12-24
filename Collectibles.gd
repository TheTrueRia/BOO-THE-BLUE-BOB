extends Object
static var textDebut = false
static var textFin = false
static var potion = 0
static var gem = 2

static func displayfin():
	textFin = true
	
static func displayDebut():
	textDebut = true
	
static func incrementPotion():
	potion += 1

static func decrementPotion():
	potion-=1

static func incrementGem():
	gem += 1
