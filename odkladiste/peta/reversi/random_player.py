from random import randint

class MyPlayer(object):
    '''
    Random reversi player class.
    '''
   

    def __init__(self, my_color, opponent_color):
        self.name = 'random'
        self.my_color = my_color
        self.opponentColor = opponent_color
        self.moveCount = 1;
        #self.move_i = 0
        print('create random player')
        

    def move(self,board):
        boardSize = len(board)
        possible = []
        for x in range(boardSize):
            for y in range(boardSize):
                if (board[x][y] == -1) and self.is_correct_move([x,y],board,boardSize):
                    possible.append((x,y))

        possible_moves = len(possible)-1
        if possible_moves < 0:
            print('No possible move!')
            return None
        my_move = randint(0,possible_moves)
        #self.move_i += 1
        #print('move_i',self.move_i)
        return possible[my_move]

    def is_correct_move(self,move,board,boardSize):
        dx = [-1,-1,-1,0,1,1,1,0]
        dy = [-1,0,1,1,1,0,-1,-1]
        for i in range(len(dx)):
            if self.confirm_direction(move,dx[i],dy[i],board,boardSize):
                return True
        return False

    def confirm_direction(self,move,dx,dy,board,boardSize):
        posx = move[0]+dx
        posy = move[1]+dy
        if (posx>=0) and (posx<boardSize) and (posy>=0) and (posy<boardSize):
            if board[posx][posy] == self.opponentColor:
                while (posx>=0) and (posx<=(boardSize-1)) and (posy>=0) and (posy<=(boardSize-1)):
                    posx += dx
                    posy += dy
                    if (posx>=0) and (posx<boardSize) and (posy>=0) and (posy<boardSize):
                        if board[posx][posy] == -1:
                            return False
                        if board[posx][posy] == self.my_color:
                            return True

        return False
