try:
    # for Python2
    from Tkinter import Tk,Canvas,Label,IntVar,Scale,Button,StringVar,OptionMenu,HORIZONTAL,font
except ImportError:
    # for Python3
    from tkinter import Tk, Canvas,Label,IntVar,Scale,Button,StringVar,OptionMenu,HORIZONTAL,font
    

class GameState:
    STOPPED = 1
    RUNNING = 2
    PAUSED = 3

class ReversiView:
    '''
    Creates window with the reversi board and controls the game using gui.
    '''

    def __init__(self, players,boardSize=8, w=850, h=410):
        '''
        :param w: width of the window
        :param h: height of the window
        '''
        self.root = Tk()
        self.boardSize = boardSize
        self.stone_board = [-1] * self.boardSize
        for row in range(self.boardSize):
            self.stone_board[row] = [-1] * self.boardSize
        self.w = w
        self.h = h
        self.offx = 5
        self.offy = 5
        self.gridw = 410
        self.gridh = 410
        self.gridspacing = 50
        self.ovalDiamPart = 0.8
        self.colors = ["blue", "red"]
        self.root.title("Reversi")
        
        self.interactive_player_ids = []
        self.interactivePlayers = []
        
        self.interractivePlayerName = 'Interactive'
        self.possiblePlayers = {
           self.interractivePlayerName :-1,
        }
        for player_name in players.keys():
            self.possiblePlayers[player_name] = players[player_name]

        self.wrong_move = False
        ws = self.root.winfo_screenwidth()
        hs = self.root.winfo_screenheight()
        x = (ws / 2) - (self.w / 2)
        y = (hs / 2) - (self.h / 2)
        
        self.root.geometry('%dx%d+%d+%d' % (self.w, self.h, x, y))
        self.draw_game_grid()
        self.draw_game_info_grid()
        
        self.game_state = GameState.STOPPED

    def set_game(self, game):
        '''
        Sets the game to the GUI.
        '''
        self.game = game
        
    def set_board(self , board):
        '''
        Sets the game board to the GUI.
        '''
        self.board = board

    def draw_stone(self, x, y, color):
        '''
        Draw stone on position [x,y] in gui
        :param x: x coordinate of the stone
        :param y: y coordinate of the stone
        :param color: 0 for blue, 1 fro red
        '''
        x_coord = (self.gridspacing * x) + (1.0 - self.ovalDiamPart) * self.gridspacing
        y_coord = (self.gridspacing * y) + (1.0 - self.ovalDiamPart) * self.gridspacing
        diameter = self.ovalDiamPart * self.gridspacing
        self.clear_stone(x, y)
        self.stone_board[x][y] = self.grid.create_oval(x_coord, y_coord, x_coord + diameter, y_coord + diameter, fill=self.colors[color])
    
    def clear_stone(self, x, y):
        '''
        Delete stone on position [x,y] from the gui
        :param x: x coordinate of the stone
        :param y: y coordinate of the stone
        '''
        if self.stone_board[x][y] != -1:
            self.grid.delete(self.stone_board[x][y])
            self.stone_board[x][y] = -1

    def draw_game_info_grid(self):
        '''
        Draw control and inform part of game to right side of the window.
        '''
        self.info = Canvas(self.root, height=self.h - self.gridh, width=self.w - self.gridw)
        self.info.pack(side="left")
        
        label_stones = Label(self.info, text="Current stones:", font=("Helvetica", 10))
        label_stones.grid(row=1, column=0)
        label_max_time = Label(self.info, text="Max time:", font=("Helvetica", 10))
        label_max_time.grid(row=2, column=0)
        
        label_scale = Label(self.info, text='Game speed [ms]:', font=("Helvetica", 10), foreground='black')
        label_scale.grid(row=5, column=0)
      
        helv36 = font.Font(family="helvetica", size=16, weight='bold')
        self.scale_var = IntVar()
        scale = Scale(self.info, variable=self.scale_var, command=self.sleep_time_change_handler, from_=0, to=1000, resolution=10, width="15", orient=HORIZONTAL, length="225")
        scale.set(200)
        scale.grid(row=5, column=1, columnspan=3)
        
        self.button = Button(self.info, text="Play", width="20", height="2", command=self.play_button_click_handler)
        self.button['font'] = helv36
        self.button.grid(row=6, column=0, columnspan=4)
        
        # labels for num stones, max time of move, etc
        self.label_player_stones = [-1, -1]
        self.label_player_max_time = [-1, -1]
        self.labels_inform = [-1, -1]
        self.labels_player_name = [-1, -1]
        self.option_menus = [-1, -1]
        self.option_menus_vars = [-1, -1]
        
        for i in range(2):
            self.label_player_stones[i] = Label(self.info, text='2', font=("Helvetica", 10), foreground=self.colors[i])
            self.label_player_stones[i].grid(row=1, column=2 * (i + 1) - 1, columnspan=2)
        
            self.label_player_max_time[i] = Label(self.info, text="%.2f [ms]" % 0.0, font=("Helvetica", 10), foreground=self.colors[i])
            self.label_player_max_time[i].grid(row=2, column=2 * (i + 1) - 1, columnspan=2)
        
            self.labels_inform[i] = Label(self.info, text='', font=("Helvetica", 10), foreground='black')
            self.labels_inform[i].grid(row=i + 3, column=0, columnspan=4)  
        
            self.labels_player_name[i] = Label(self.info, text="Player%d:" % (i), font=("Helvetica", 12), foreground=self.colors[i])
            self.labels_player_name[i].grid(row=0, column=2 * i)    
            
            self.option_menus_vars[i] = StringVar(self.root)
            self.option_menus_vars[i].set(self.interractivePlayerName)
            self.option_menus[i] = OptionMenu(self.info, self.option_menus_vars[i], *self.possiblePlayers)
            self.option_menus[i].grid(row=0, column=2 * i + 1)

    def draw_game_grid(self):
        '''
        Draw empty 8x8 grid on the left side of the window.
        '''
        self.grid = Canvas(self.root, bg="white", height=self.gridh, width=self.gridw)
        self.grid.bind("<Button 1>", self.place_stone_click_handler)
        gridsize = self.boardSize
        offy = self.offy
        offx = self.offx
        w = self.gridw
        h = self.gridh
        spacing = self.gridspacing
        # line around
        self.grid.create_line(offx, offy, offx, h - offy, w - offx, h - offy, w - offx, offy, offx, offx)
        
        for x in range(0, gridsize):
            for y in range(0, gridsize):
                arrayText = '[' + str(y) + ',' + str(x) + ']'
                self.grid.create_text(offx + (spacing * x) + spacing / 2, offy + (spacing * y) + spacing / 2, text=arrayText)
        # line rows
        for rowy in range(offy + spacing, h - offy, spacing):
            self.grid.create_line(offx, rowy, w - offx, rowy)
        
        # line columns
        for colx in range(offx + spacing, w - offx, spacing):
            self.grid.create_line(colx, offy, colx, h - offy)
        
        self.grid.pack(side="left")
    
    def sleep_time_change_handler(self, event):
        '''
        Called after scale value change, updates the wait time between moves.
        :param event: slider change event
        '''
        self.game.sleep_time_ms = self.scale_var.get()
        
    
    def play_button_click_handler(self):
        '''
        Button listener for Play/Pause/RePlay etc.
        On button click prints slider value and start game.
        '''
       
        # set the players from dropdown menu if game is stopped
        if self.game_state == GameState.STOPPED:
            print("game_state " + str(self.game_state))
            self.interactive_player_ids = []
            for i in range(2):
                print(self.option_menus_vars[i].get())
                if self.option_menus_vars[i].get() == self.interractivePlayerName:
                    self.interactive_player_ids.append(i)
                    
                    if i == 0:
                        self.game.player1.name = self.interractivePlayerName
                    else:
                        self.game.player2.name = self.interractivePlayerName
                        
                else:
                    if i == 0:
                        player_class = self.possiblePlayers[self.option_menus_vars[i].get()]
                        self.game.player1 = player_class(self.game.player1_color, self.game.player2_color)
    
                    else:
                        player_class = self.possiblePlayers[self.option_menus_vars[i].get()]
                        self.game.player2 = player_class(self.game.player2_color, self.game.player1_color)
                        
                    self.game.clear_game()

            self.game.current_player = self.game.player1
            self.game.current_player_color = self.game.player1_color
            print('player1 ' + str(self.game.player1_color))   
            print('player2 ' + str(self.game.player2_color))
        
        #play game or start game if interactive           
        if len(self.interactive_player_ids) != 0:
            if self.game_state == GameState.STOPPED:
                    print("revert this commented out section below")
                #if not self.board.can_play(self.game.current_player, self.game.current_player_color):
                #    self.game.clear_game()
                #    self.button['text'] = 'Play'
                #else:
                    self.game_state = GameState.RUNNING
                    self.button['text'] = 'RePlay'
                    print('can play ', self.interactive_player_ids)
                    inform_str = 'Player%d plays' % (self.interactive_player_ids[0])
                    self.inform(inform_str, 'green')
                    if len(self.interactive_player_ids) == 1 and self.interactive_player_ids[0] == 1:
                        self.game.play_game(self.interactive_player_ids[0])
                
            else:
                self.game_state = GameState.STOPPED
                self.button['text'] = 'Play'
                self.game.clear_game()
                # self.game.play_game(self.interactivePlayerId)
        else:
            if  self.game_state == GameState.STOPPED or self.game_state == GameState.PAUSED:
                print('start')
                print('player1 ' + str(self.game.player1_color))   
                print('player2 ' + str(self.game.player2_color))  
                self.button['text'] = 'Pause'
                self.game.sleepTimeMS = self.scale_var.get()
                if self.game_state == GameState.STOPPED:
                    self.game.clear_game()
                self.game.pause(False)
                self.game_state = GameState.RUNNING
                print('player1 ' + str(self.game.player1_color))   
                print('player2 ' + str(self.game.player2_color))  
                self.game.play_game()
                print('game exited')
                if self.board.can_play(self.game.current_player_color) and not self.wrong_move:
                    print('set pause state')
                    self.button['text'] = 'Continue'
                    self.game_state = GameState.PAUSED
                else:
                    print('set stopped state')
                    self.button['text'] = 'RePlay'
                    self.game_state = GameState.STOPPED
                    # self.game.clear_game()
                
            elif self.game_state == GameState.RUNNING:
                print('pause')
                self.game_state = GameState.PAUSED
                self.game.pause(True)
     
    def print_score(self):  
        '''
        Set number of stones for both players.
        '''      
        stones = self.board.get_score()           
        self.print_player_num_stones(0, stones[0])
        self.print_player_num_stones(1, stones[1])
        
    def print_num_stones(self, stones):
        '''
        Set number of stones for both players.
        :param stones: array of player number of stones
        '''
        self.print_player_num_stones(0, stones[0])
        self.print_player_num_stones(1, stones[1])
        
    def print_player_num_stones(self, playerID, stones):
        '''
        Set player number of stones.
        :param playerID: 0 for player 1, 1 for player 2
        :param maxTime: maximal time of player
        '''
        self.label_player_stones[playerID]['text'] = str(stones)
        self.root.update()
        
    def print_move_max_times(self, maxTimesMS):
        '''
        Print maximal times for both players to the gui.
        :param max_times_ms: array of max time needed for move.
        '''
        self.print_player_move_max_time(0, maxTimesMS[0])
        self.print_player_move_max_time(1, maxTimesMS[1])
        
    def print_player_move_max_time(self, playerID, maxTime):
        '''
        Set player maximal time.
        :param playerID: 0 for player 1, 1 for player 2
        :param maxTime: maximal time of player
        '''
        self.label_player_max_time[playerID]['text'] = '%.2f [ms]' % maxTime
        self.root.update()
        
    def print_board_state(self):
        '''
        Show the state of the board in gui.
        '''
        # self.board.print_board()
        for y in range(self.board.board_size):
            for x in range(self.board.board_size):
                if self.board.board[y][x] == -1:
                    self.clear_stone(x, y)
                else:
                    self.draw_stone(x, y, self.board.board[y][x])
        self.root.update()
        
    def place_stone_click_handler(self, event):
        '''
        For interactive player places stone to mouse click position. 
        :param event: mouse click event
        '''
        print("place_stone_click_handler")
        if self.game_state != GameState.STOPPED and len(self.interactive_player_ids) >= 1 and self.game.current_player_color in self.interactive_player_ids:
            pos_move = [int((event.y - self.offy) / self.gridspacing), int((event.x - self.offx) / self.gridspacing)]

            if self.board.is_correct_move(pos_move, self.game.current_player_color):

                next_player_id = self.game.play_move(pos_move)
                self.print_board_state()
                self.print_score()
                self.print_move_max_times(self.game.max_times_ms)
                inform_str = 'Player%d plays' % (self.game.current_player_color)
                self.inform(inform_str, 'green')
                if len(self.interactive_player_ids) == 1:
                    self.game.play_game(self.interactive_player_ids[0])

                if next_player_id == -1:
                    self.game_state = GameState.STOPPED
                    self.button['text'] = 'RePlay'
                    self.game.print_final_info()
            else:
                print('incorrect move', pos_move)
                self.inform('incorrect move to %d %d' % (pos_move[0], pos_move[1]), 'red')    
    

    def inform(self, text_strs, color_str):
        '''
        Show inform text in gui.
        :param text_strs: string or string array of size 2 that is shown in gui
        :param color_str: color of shown text_strs
        '''
        inform_str_all = ['', '']
        if not isinstance(text_strs, list):
            inform_str_all[0] = text_strs
        else:
            inform_str_all = text_strs
        # print(inform_str_all)    
        for i in range(2):
            self.labels_inform[i]['text'] = inform_str_all[i]
            self.labels_inform[i]['foreground'] = color_str
        self.root.update()
            
