# Jolt Physics Submodule project
file(GLOB_RECURSE JPH_PROJECT_SOURCES
		CONFIGURE_DEPENDS
		${CMAKE_CURRENT_SOURCE_DIR}/Jolt/*.cpp
		${CMAKE_CURRENT_SOURCE_DIR}/Jolt/*.h
	)

add_library(JoltLib ${JPH_PROJECT_SOURCES})

target_include_directories(JoltLib PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
    )

target_compile_definitions(JoltLib
		PUBLIC JPH_DEBUG_RENDERER
		PRIVATE JPH_USE_SSE4_1
		PRIVATE JPH_USE_AVX
	)

# Enable SIMD flags
target_compile_options(JoltLib PRIVATE -mavx)
