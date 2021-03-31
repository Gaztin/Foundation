
local p = premake

require 'base_project'
require 'library'
require 'third_party_library'

apps = { }

function app( name )
	group 'Apps'
	base_project( name )
	kind 'WindowedApp'

	debugdir 'src/%{prj.name}/Assets'
	links( libraries )
	links( third_party_libraries )
	xcodebuildresources 'src/%{prj.name}/Assets'

	filter 'system:linux'
		linkoptions { '-Wl,-rpath=\\$$ORIGIN' }

	filter 'system:ios'
		files { 'src/%{prj.name}/Resources/Info.plist', 'src/%{prj.name}/Assets' }

	filter { }

	table.insert( apps, name )
	
	-- Set the last declared app as startup
	p.api.scope.current = p.api.scope.workspace
	startproject( name )
end
