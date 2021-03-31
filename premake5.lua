require 'premake/app'
require 'premake/defaults'
require 'premake/library'
require 'premake/options'
require 'premake/target'
require 'premake/utils'

local project_name = 'MyProject'

workspace( project_name )
platforms( utils.get_platforms() )
configurations { 'Debug', 'Release' }

library 'MyLibrary'
app 'MyApp'
