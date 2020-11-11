Dostali jste k dispozici dva nástroje, které Vám pomohou s odladěním finálního reversi hráče pro turnaj.
Jsou to tyto dva moduly:
* headless_reversi_creator.py	- zahraje reversi hru v command line
* reversi_creator.py			- spustí GUI s možnosí hry dvou python hráčů proti sobě, python hráče proti Vám nebo dvou živých hráčů proti sobě


** headless_reversi_creator **
Spustíte v command line příkazem:

>> python headless_reversi_creator

V takovém případě pustí hru dvou random hráčů napevno zadaných v headless_reversi_creator.

headless_reversi_creator přijímá dva nepovinné argumenty, ve kterých můžete specifikovat hráče.
Pokud nakopirujete svého hráče do složky k přiloženému kódu, můžete spustit hru Vašeho hráče proti přiloženému random hráči následovně:

>> python headless_reversi_creator player

(Předpokládá se že váš hráč třídy MyPlayer je v souboru player.py)

Případně můžete pustit Vašeho hráče proti Vašemu hráči příkazem

>> python headless_reversi_creator player player

Nebo vytvořte hráčů více a nechte je hrát proti sobě:

>> python headless_reversi_creator player another_player

(Předpokládá se že Váš další hráč třídy MyPlayer je v souboru another_player.py)

Můžete samozřejmě také upravit headless_reversi_creator podle svého a hráče například přidat přímo.
V takovém případě je potřeba přidat import vašeho hráče a pozměnit volání herního kontroléru nějak takto:

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
Spustíte v command line příkazem:

>> python reversi_creator

V takovém případě můžete v GUI okně za jednotlivé hráče vybrat sebe nebo random hráče.

reversi_creator přijímá nepovinné argumenty, ve kterých můžete specifikovat další hráče.
Pokud nakopirujete své hráče do složky k přiloženému kódu, můžete je přidat do výběru.

>> python reversi_creator player another_player

Takový příkaz přidá hráče player a another_player do menu, ze kterého můžete vybírat.
Opět můžete upravit reversi_creator podle svého a hráče přidat přímo.
V takovém případě je potřeba přidat import vašeho hráče a do dictionary přidat další hráče.

import player

...
...
...

if __name__ == "__main__": 
--> players_dict = {'random':random_player.MyPlayer, 'my_player':player.MyPlayer}
    game = ReversiCreator(players_dict)
    game.gui.root.mainloop()