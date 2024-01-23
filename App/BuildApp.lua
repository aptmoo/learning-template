project "App"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++20"
    targetdir "Binaries/"
    staticruntime "off"

    files
    {
        "./Source/**.h", "./Source/**.cpp",
    }

    includedirs
    {
        "./",
        "./Source/",

        -- Deps
        "../Dependencies/GLFW/include",
    }

    links
    {
        "GLFW",
    }

    targetdir ("../Binaries/")
    objdir ("../Intermediates/%{prj.name}")

    filter "system:windows"
        systemversion "latest"
        defines { "PLATFORM_WINDOWS" }

    filter "system:linux"
        defines { "PLATFORM_LINUX" }
        libdirs { "/usr/lib", "../lib", }
        files { "Backend/linux/**.h", "Backend/**.cpp" }
        links { "dl", "m", "pthread", "GL" }
        targetname "App.out"

    filter "configurations:Debug"
        defines { "DEBUG" }
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines { "RELEASE" }
        runtime "Release"
        optimize "On"
        symbols "On"

    filter "configurations:Dist"
        defines { "DIST" }
        runtime "Release"
        optimize "On"
        symbols "Off"