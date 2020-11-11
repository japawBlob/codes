import random_player
#import greedy_player
#import alphabeta_player
#import heuristic_player

from game_board import GameBoard
from reversi_view import ReversiView
import time
import multiprocessing 
import copy, getopt, sys

class ReversiCreator(object):
    '''
    Creator of the Reversi game with the GUI.
    '''

    def __init__(self, player_array):
        '''
        :param playerArray: Array of possible players
        :param boardSize: Board will have size [boardSize x boardSize]
        '''
        player_class = player_array['random']
        self.player1_color = 0
        self.player2_color = 1
        self.player1 = player_class(self.player1_color,self.player2_color)
        self.player2 = player_class(self.player2_color,self.player1_color)
        self.board = GameBoard()
        self.sleep_time_ms = 200
        self.gui = ReversiView(player_array)
        self.gui.set_game(self)
        self.gui.set_board(self.board)
        self.clear_game()
        self.paused = False
        print('gui created')
        
    def clear_game(self):
        '''
        Sets the game state to the initial value.
        '''
        print('clear_game')
        self.max_times_ms = [0 , 0]
        self.board.init_board()
        self.board.clear()
        stones = self.board.get_score()
        self.gui.print_board_state()
        self.gui.print_num_stones(stones)
        self.gui.inform(['', ''], 'black')

    def pause(self, to_pause):
        '''
        Pause the game when it computer vs computer.
        :param to_pause: to pause or unpause.
        '''
        self.paused = to_pause

    def get_player_move(self, q):
        '''
        Returns current player move to Queue, meant for threaded call.  Now deprecaded.
        :param q: Queue for returning the move with spent time.
        '''
        start_time = time.time()
        move = self.current_player.move(self.board.get_board_copy())
        endTime = time.time()
        moveTime = (endTime - start_time) * 1000
        q.put({'time':moveTime, 'move':move})

        

    def play_game(self, interactivePlayerColor=-1):
        '''
        This function contains game loop that plays the game. Loop is exited when paused or interactive game.
        :param interactivePlayerColor: id of interactive player. If no interactive player then -1.
        '''
        print('play game with interractive %d' % interactivePlayerColor)
        player_move_overtime = -1
        next_player_id = -1
        self.paused = False
        wrong_move = False

        while self.board.can_play( self.current_player_color) and not self.paused:
            if interactivePlayerColor == self.current_player_color:
                inform_str = 'It is your turn'
                self.gui.inform(inform_str, 'green')
                break
            #q = multiprocessing.Queue()
            #p = multiprocessing.Process(target=self.get_player_move, args=(q,))
            #p.start()
            # Wait for 1 second
            #p.join(1)
            #if p.is_alive():
            #    print("running too long - killing it")
            #    p.terminate()
            #    p.join()
            #    player_move_overtime = self.current_player_color
            #if player_move_overtime != -1:
            #    inform_str = 'Player %d move took to long - killed' % (self.current_player_color)
            #    self.gui.inform(inform_str, 'red')
            #    break
            #returned_move = q.get()
            #move_time = returned_move['time']
            #move = returned_move['move']
            
            start_time = time.time()
            move = self.current_player.move(self.board.get_board_copy())
            endTime = time.time()
            move_time = (endTime - start_time) * 1000
            
            if move_time > 1000:
                print("running too long - killing it")
                player_move_overtime = self.current_player_color
            
            if player_move_overtime != -1:
                inform_str = 'Player %d move took to long - killed' % (self.current_player_color)
                self.gui.inform(inform_str, 'red')
                break
            
            self.max_times_ms[self.current_player_color] = max(self.max_times_ms[self.current_player_color], move_time)
            if move is None:
                print('Move is not correct!!!!')
                inform_str = 'Player %d return None instad of a valid move.' % (self.current_player_color)
                self.gui.inform(inform_str, 'red')
                self.gui.wrong_move = True
                wrong_move = True
                break
            else:
                print('Player %d wants move [%d,%d]. Move takes %.3f ms.' % (self.current_player_color, move[0], move[1], move_time))
            next_player_id = -1

            move = (int(move[0]),int(move[1]))
            if self.board.is_correct_move(move, self.current_player_color):
                print('Move is correct')
                wrong_move = False
                self.gui.wrong_move = False
                next_player_id = self.play_move(move)
            else:
                print('Move is not correct!!!!')
                inform_str = 'Player %d made wrong move [%d,%d]' % (self.current_player_color, move[0], move[1])
                self.gui.inform(inform_str, 'red')
                self.gui.wrong_move = True
                wrong_move = True
                break
                
            self.gui.print_board_state()
            self.gui.print_score()
            self.gui.print_move_max_times(self.max_times_ms)
            time.sleep (self.sleep_time_ms / 1000.0)


        current_player_oponent_color = self.get_opponent_player_color(self.current_player_color)
        if next_player_id == -1 and self.board.can_play( current_player_oponent_color) :
            print("oponent player can play an current can not")
            self.change_player()
            next_player_id = current_player_oponent_color


        if next_player_id == -1 and not self.paused and not wrong_move :
            self.print_final_info()
        
        
    def play_move(self, move):
        '''
        Play move for current player.
        :param move: [x,y] move to play using current_player.
        '''
        self.board.play_move(move, self.current_player_color)
        self.change_player()
        if not self.board.can_play(self.current_player_color):
            inform_str = 'No possible move for Player %d' % (self.current_player_color)
            self.gui.inform(inform_str, 'red')
            self.change_player()
            if self.board.can_play( self.current_player_color):
                inform_str = 'Player %d plays again ' % (self.current_player_color)
                self.gui.inform(inform_str, 'black')
            else:
                print('Game over')
                self.print_final_info()
                return -1
        return self.current_player_color

    def get_opponent_player_color(self,player_color):
        if player_color == self.player1_color:
            return self.player2_color
        else:
            return self.player1_color

    def change_player(self):
        '''
        Change the current_player.
        '''
        if self.current_player == self.player1:
            self.current_player = self.player2
            self.current_player_color = self.player2_color
        else:
            self.current_player = self.player1
            self.current_player_color = self.player1_color

    def print_final_info(self):
        '''
        Prints the info after game is finished.
        '''
        print('print_final_info')
        stones = self.board.get_score()  
        self.gui.print_num_stones(stones) 
        self.gui.print_move_max_times(self.max_times_ms)
        final_score = 'Final score:\tPlayer%d:Player%d\t[%d:%d]' % (self.player1_color, self.player2_color, stones[0], stones[1])
        print(final_score)
        who_wins = 'Draw'
        if stones[0] > stones[1]:
            who_wins = 'Player %d wins!' % (self.player1_color)
        elif stones[1] > stones[0]:
            who_wins = 'Player %d wins!' % (self.player2_color)
        print(who_wins)
        self.gui.inform([final_score, who_wins], 'green')

if __name__ == "__main__": 
    (choices,args) = getopt.getopt(sys.argv[1:],"")
    players_dict = {'random':random_player.MyPlayer}
    #players_dict = {'random':random_player.MyPlayer,'greedy':greedy_player.MyPlayer,'alphabeta':alphabeta_player.MyPlayer,'heuristic':heuristic_player.MyPlayer}
    
    for arg in args:
        try:
            to_import = arg
            if ".py" in arg:
                to_import = arg.replace(".py","")
            print('Adding player from %s.py file' %(to_import))
            player_module = __import__(to_import)
            players_dict[to_import] = player_module.MyPlayer
        except:
            print('ERROR: Unable to add player from %s.py file' %(arg))

    game = ReversiCreator(players_dict)
    game.gui.root.mainloop()
