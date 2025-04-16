project "JoltPhysics"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files {
		"Jolt/**.cpp",
		"Jolt/**.h"
	}

	includedirs {
		"%{prj.location}"
    }

	defines { "JPH_DEBUG_RENDERER" }

    filter "system:windows"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "Off"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "Off"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
        defines { "NDEBUG", "JPH_DEBUG" }
		runtime "Release"
		optimize "on"
