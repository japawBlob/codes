python means python3

* headless_reversi_creator.py	- play the reversi game without GUI
* reversi_creator.py			- run GUI where you can choose various players

** headless_reversi_creator **
in a terminal:

>> python headless_reversi_creator

It will run two random players against each other (specified in the headless_reversi_creator.py)

headless_reversi_creator accepts two optional parameters where you can specify the players. 

>> python headless_reversi_creator player

Expects MyPlayer class in player.py. 

>> python headless_reversi_creator player player

Will run your player againts itself. You can have more players. 

>> python headless_reversi_creator player another_player

Expects MyPlayer class in another_player.py

You can also freely modify the source of the headless_reversi_creator if you prefer

import player

...
...
...

    if len(args) == 0:
---->   p1 = player.MyPlayer(p1_color, p2_color)
        p2 = random_player.MyPlayer(p2_color, p1_color)
        game = HeadlessReversiCreator(p1, p1_color, p2, p2_color, 8)
        game.play_game()



** reversi_creator **
You can run the interactive version of the game by

>> python reversi_creator

Similarly to the non-gui version you can specify alternative players

>> python reversi_creator player another_player yet_another_player

Again, you can modify the source of he reversi_creator if you wish

import player

...
...
...

if __name__ == "__main__": 
--> players_dict = {'random':random_player.MyPlayer, 'my_player':player.MyPlayer}
    game = ReversiCreator(players_dict)
    game.gui.root.mainloop()
