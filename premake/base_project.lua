
function base_project( name )
	project( name )

	location 'build/%{_ACTION}'
	sysincludedirs { 'include' }

	files {
		-- C/C++
		'src/%{prj.name}/**.c',
		'src/%{prj.name}/**.cc',
		'src/%{prj.name}/**.cpp',
		'src/%{prj.name}/**.cxx',
		'src/%{prj.name}/**.h',
		'src/%{prj.name}/**.hh',
		'src/%{prj.name}/**.hpp',
		'src/%{prj.name}/**.hxx',

		-- Objective-C/C++
		'src/%{prj.name}/**.m',
		'src/%{prj.name}/**.mm',
	}

	-- Compile all C++ files as Objective-C++ on macOS and iOS
	filter { 'system:macosx or ios', 'files:**.cc or **.cpp or **.cxx' }
		compileas 'Objective-C++'

	filter { }
end
