
require 'base_project'

libraries = { }

function library( name )
	group 'Libraries'
	base_project( name )
	kind 'StaticLib'

	links( libraries )

	files {
		-- C/C++ headers
		'include/%{prj.name}/**.h',
		'include/%{prj.name}/**.hh',
		'include/%{prj.name}/**.hpp',
		'include/%{prj.name}/**.hxx',
	}

	vpaths {
		[ 'Header Files' ] = 'include/**',
		[ 'Source Files' ] = 'src/**',
	}

	filter 'system:macosx or ios'
		files { 'src/%{prj.name}/**.mm' }

	filter { 'system:macosx or ios', 'files:**.cpp' }
		compileas 'Objective-C++'

	filter { }

	table.insert( libraries, name )
end
