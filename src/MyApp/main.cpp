#include "MyLibrary/MyClass.h"

#include <iostream>

int main( int /*argc*/, char* /*argv*/[] )
{
	MyClass a( 50 );

	std::cout << "Hello, world!\n";
	std::cout << "A: " << a.Value() << "\n";

	return 0;
}

#if defined( _WIN32 )

#include <Windows.h>

int WINAPI WinMain( HINSTANCE /*instance*/, HINSTANCE /*prev_instance*/, LPSTR /*cmd_line*/, int /*cmd_show*/ )
{
	return main( __argc, __argv );
}

#elif defined( __ANDROID__ ) // _WIN32

#include <android/native_activity.h>

extern "C" void ANativeActivity_onCreate( ANativeActivity* /*activity*/, void* /*saved_state*/, size_t /*saved_state_size*/ )
{
	main( 0, nullptr );
}

#endif // __ANDROID__
