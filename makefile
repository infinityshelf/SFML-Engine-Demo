CFLAGS = -std=c++14 -Wall -Winit-self -Wextra -pedantic -Wredundant-decls -Wcast-align -Wmissing-declarations -Wmissing-include-dirs -Wswitch-enum -Wswitch-default -Winvalid-pch -flto -Wodr -Wformat=2 -Wmissing-format-attribute -Wformat-nonliteral -Werror
PROJECT = SFML-Engine-Demo

all:
	make run

run: $(PROJECT)
	./$(PROJECT) $(PROJECT)

$(PROJECT): main.o Game.o GameWorld.o Player.o PlayerGraphicsComponent.o PlayerInputComponent.o PlayerPhysicsComponent.o SFML-Engine/libSFML-Engine.a
	g++ $(CFLAGS) main.o Game.o GameWorld.o Player.o PlayerGraphicsComponent.o PlayerInputComponent.o PlayerPhysicsComponent.o -o $(PROJECT) -lsfml-window -lsfml-system -lsfml-graphics -L./SFML-Engine -lSFML-Engine

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

SFML-Engine/libSFML-Engine.a:
	$(MAKE) -C SFML-Engine

clean:
	make clean-SFML-Engine
	rm *.o
	rm *.a
	rm *.gch
	rm $(PROJECT)

clean-SFML-Engine:
	$(MAKE) -C SFML-Engine clean

recompile:
	make clean
	make $(PROJECT)
