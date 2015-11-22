
class baseclass{
	
}

class app {
  include role_app
}

class app::discovery {
  include role_discovery
}

class app::router {
	include role_router
}