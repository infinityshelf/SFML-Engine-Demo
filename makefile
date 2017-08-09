CFLAGS = -std=c++14 -Wall -Winit-self -Wextra -pedantic -Wredundant-decls -Wcast-align -Wmissing-declarations -Wmissing-include-dirs -Wswitch-enum -Wswitch-default -Winvalid-pch -flto -Wodr -Wformat=2 -Wmissing-format-attribute -Wformat-nonliteral -Werror
PROJECT = SFML-Engine-Demo

all:
	make run

run: $(PROJECT)
	./$(PROJECT) $(PROJECT)

$(PROJECT): main.o Game.o GameWorld.o Player.o PlayerGraphicsComponent.o PlayerInputComponent.o PlayerPhysicsComponent.o libSFML-Engine.a
	g++ $(CFLAGS) main.o Game.o GameWorld.o Player.o PlayerGraphicsComponent.o PlayerInputComponent.o PlayerPhysicsComponent.o -o $(PROJECT) -lsfml-window -lsfml-system -lsfml-graphics -L. -lSFML-Engine

main.o: main.cpp
	g++ $(CFLAGS) -c main.cpp

Game.o: Game.hpp Game.cpp
	g++ $(CFLAGS) -c Game.cpp

GameWorld.o: GameWorld.hpp GameWorld.cpp
	g++ $(CFLAGS) -c  GameWorld.cpp

Player.o: Player.hpp Player.cpp
	g++ $(CFLAGS) -c Player.cpp

PlayerGraphicsComponent.o: PlayerGraphicsComponent.hpp PlayerGraphicsComponent.cpp
	g++ $(CFLAGS) -c PlayerGraphicsComponent.cpp

PlayerInputComponent.o: PlayerInputComponent.hpp PlayerInputComponent.cpp
	g++ $(CFLAGS) -c PlayerInputComponent.cpp

PlayerPhysicsComponent.o: PlayerPhysicsComponent.hpp PlayerPhysicsComponent.cpp
	g++ $(CFLAGS) -c PlayerPhysicsComponent.cpp

###

EntityManager.o: SFML-Engine/EntityManager.cpp SFML-Engine/EntityManager.hpp
	g++ $(CFLAGS) -c SFML-Engine/EntityManager.cpp

GraphicsComponent.o: SFML-Engine/GraphicsComponent.cpp SFML-Engine/GraphicsComponent.hpp
	g++ $(CFLAGS) -c SFML-Engine/GraphicsComponent.cpp

Input.o: SFML-Engine/Input.cpp SFML-Engine/Input.hpp
	g++ $(CFLAGS) -c SFML-Engine/Input.cpp

CollidableManager.o: SFML-Engine/CollidableManager.cpp SFML-Engine/CollidableManager.hpp
	g++ $(CFLAGS) -c SFML-Engine/CollidableManager.cpp

Component.o: SFML-Engine/Component.hpp SFML-Engine/Component.cpp
	g++ $(CFLAGS) -c SFML-Engine/Component.cpp

TextureManager.o: SFML-Engine/TextureManager.cpp SFML-Engine/TextureManager.hpp
	g++ $(CFLAGS) -c SFML-Engine/TextureManager.cpp

World.o: SFML-Engine/World.cpp SFML-Engine/World.hpp
	g++ $(CFLAGS) -c SFML-Engine/World.cpp

libSFML-Engine.a: Input.o EntityManager.o GraphicsComponent.o TextureManager.o World.o CollidableManager.o Component.o
	ar rcs libSFML-Engine.a Input.o EntityManager.o GraphicsComponent.o TextureManager.o World.o CollidableManager.o Component.o

libs: libSFML-Engine.a

clean:
	rm *.o
	rm *.a
	rm *.gch
	rm $(PROJECT)

recompile:
	make clean
	make $(PROJECT)
