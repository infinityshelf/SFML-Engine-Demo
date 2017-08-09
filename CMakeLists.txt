cmake_minimum_required(VERSION 3.8)
project(SFML-Engine-Demo)

set(CMAKE_CXX_STANDARD 11)

set(SFML_DEMO_SOURCES main.cpp
        Player.cpp
        Player.hpp
        PlayerGraphicsComponent.cpp
        PlayerGraphicsComponent.hpp
        PlayerInputComponent.hpp
        PlayerInputComponent.cpp
        PlayerPhysicsComponent.cpp
        PlayerPhysicsComponent.hpp
        GameWorld.cpp
        GameWorld.hpp
        Game.hpp
        Game.cpp)

add_executable(SFML-Engine-Demo ${SFML_DEMO_SOURCES})
add_subdirectory(SFML-Engine)
target_link_libraries(SFML-Engine-Demo LINK_PUBLIC SFML-Engine -lsfml-graphics -lsfml-window -lsfml-system)