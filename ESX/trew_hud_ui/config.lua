Config = {}

Config.Locale = 'en'

Config.serverLogo = '/opt/FXServer/server-data/BERP-Logo.png'

Config.font = {
	name 	= 'Montserrat',
	url 	= 'https://fonts.googleapis.com/css?family=Montserrat:300,400,700,900&display=swap'
}

Config.date = {
	format	 	= 'default',
	AmPm		= true
}

Config.voice = {

	levels = {
		default = 5.0,
		shout = 12.0,
		whisper = 1.0,
		current = 0
	},

	keys = {
		distance 	= 'g',
	}
}


Config.vehicle = {
	speedUnit = 'MPH',
	maxSpeed = 150,

	keys = {
		seatbelt 	= 'K',
		cruiser		= 'CAPS',
		signalLeft	= 'LEFT',
		signalRight	= 'RIGHT',
		signalBoth	= 'DOWN',
		controlkey = 'X'
	}
}


Config.ui = {
	showServerLogo		= false,

	showJob		 		= true,

	showWalletMoney 	= true,
	showBankMoney 		= true,
	showBlackMoney 		= true,
	showSocietyMoney	= true,

	showDate 			= true,
	showLocation 		= true,
	showVoice	 		= false,

	showHealth			= true,
	showArmor	 		= true,
	showStamina	 		= true,
	showHunger 			= true,
	showThirst	 		= true,

	showMinimap			= false,

	showWeapons			= true,
}

-- Amount of Time to Blackout, in milliseconds
-- 2000 = 2 seconds
Config.BlackoutTime = 20000

-- Enable blacking out due to vehicle damage
-- If a vehicle suffers an impact greater than the specified value, the player blacks out
Config.BlackoutFromDamage = true
Config.BlackoutDamageRequired = 25

-- Enable blacking out due to speed deceleration
-- If a vehicle slows down rapidly over this threshold, the player blacks out
Config.BlackoutFromSpeed = true
Config.BlackoutSpeedRequired = 85 -- Speed in MPH

-- Enable the disabling of controls if the player is blacked out
Config.DisableControlsOnBlackout = true
