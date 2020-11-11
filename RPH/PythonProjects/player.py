import copy

class MyPlayer:
    '''V5.7 // Reversi player'''
    def __init__(self, my_color, opponent_color):
        self.name = 'jirajak2'
        self.my_color = my_color
        self.opp_color = opponent_color

    def move(self, board):
        '''

        Returns move base on which position is best for me and worst for my opponent.
        Choosing is based only on values of position - nothing else.

        '''

        coord1 = 9
        coord2 = 9

        delta = -10000
        best_opp_score = -10000
        possible_moves = self.gimme_moves(board, self.my_color, self.opp_color)

        if len(possible_moves) == 1:
            return possible_moves[0]

        for [x, y] in possible_moves:
            board_copy = copy.deepcopy(board)
            board_copy[x][y] = self.my_color

            self.flip_tokens((x, y), board_copy, self.my_color, self.opp_color)
            my_score = self.delta_score(board_copy,self.my_color,self.opp_color)

            possible_opp_moves = self.gimme_moves(board, self.opp_color, self.my_color)

            if possible_opp_moves is None:
                continue

            for [i, j] in possible_opp_moves:
                board2_copy = copy.deepcopy(board_copy)
                self.flip_tokens((i, j), board2_copy, self.opp_color, self.my_color)
                opp_score = self.delta_score(board_copy,self.opp_color,self.my_color)
                if opp_score > best_opp_score:
                    best_opp_score = opp_score

            if my_score-opp_score>delta:
                delta = my_score-opp_score
                coord1 = x
                coord2 = y
        if coord1 == 9 or coord2 == 9:   # From my expirience from Prisoners dilema I desided to put here last rescue... :D
            m = possible_moves[0]
        else:
            m = (coord1,coord2)
        return m

    def gimme_moves(self, board, my_color, opp_color):
        '''

        Returns possible moves

        '''
        possible_moves = []
        for i in range(len(board)):
            for j in range(len(board[i])):
                if board[i][j] == -1 and self.find_legit_move((i, j), board, my_color, opp_color) is True:
                    possible_moves.append((i, j))
        if possible_moves == []:
            return None
        return possible_moves

    def find_legit_move(self, coord, board, my_color, opp_color):
        directions = [(-1, 1), (0, 1), (1, 1), (-1, 0), (1, 0), (-1, -1), (0, -1), (1, -1)]
        for i in range(len(directions)):
            for j in range(1, len(board), 1):
                r = coord[0]
                c = coord[1]
                r = r + j * directions[i][0]
                c = c + j * directions[i][1]
                if r < len(board) and c < len(board[r]) and r >= 0 and c >= 0:
                    if board[r][c] == opp_color:
                        continue

                    if j != 1 and board[r][c] == my_color:
                        return True
                    else:
                        break
                else:
                    break
        return False

    def value_of_position(self, coord):
        '''

        Source for values is http://samsoft.org.uk/reversi/strategy.htm

        '''
        board_value = [
            [99, -8, 8, 6, 6, 8, -8,99],
            [-8,-24,-4,-3,-3,-4,-24,-8],
            [ 8, -4, 7, 4, 4, 7, -4, 8],
            [ 6, -3, 4, 0, 0, 4, -3, 6],
            [ 6, -3, 4, 0, 0, 4, -3, 6],
            [ 8, -4, 7, 4, 4, 7, -4, 8],
            [-8,-24,-4,-3,-3,-4,-24,-8],
            [99, -8, 8, 6, 6, 8, -8,99],
        ]
        x = board_value[coord[0]][coord[1]]
        return x

    def delta_score(self, board, player_color, opp_color):
        '''

        Diference in score, based on positions on board

        '''
        player_score = 0
        opp_score = 0
        for i in range(len(board)):
            for j in range(len(board)):
                if board[i][j] == player_color:
                    player_score += self.value_of_position([i,j])
                elif board[i][j] == opp_color:
                    opp_score += self.value_of_position([i,j])
        return player_score - opp_score

    def flip_tokens(self,coord,board,placed_color,opp_color):
        '''

        Used, when simulating next moves

        '''
        directions = [(-1, 1), (0, 1), (1, 1), (-1, 0), (1, 0), (-1, -1), (0, -1), (1, -1)]
        for i in range(len(directions)):
            for j in range(1, len(board), 1):
                r = coord[0]
                c = coord[1]
                r = r + j * directions[i][0]
                c = c + j * directions[i][1]
                if r < len(board) and c < len(board[r]) and r >= 0 and c >= 0:
                    if board[r][c] == opp_color:
                        continue
                    if j != 1 and board[r][c] == placed_color:
                        r = r - 1 * directions[i][0]
                        c = c - 1 * directions[i][1]
                        if r < len(board) and c < len(board[r]) and r >= 0 and c >= 0:
                            break
                        while board[r][c] == opp_color:
                            board[r][c] = placed_color
                            r = r - 1 * directions[i][0]
                            c = c - 1 * directions[i][1]
                            if r < len(board) and c < len(board[r]) and r >= 0 and c >= 0:
                                break
                    else:
                        break
                else:
                    break
