import random

class PrintField:
    '''
    def __init__(self,data):
        self.2d = data
    '''

    def print_data(data):
        for i in range(len(data)):
            for j in range(len(data[0])):
                print(data[i][j], end =" ") #scitat do stringu?
            print()

    def print_random(r,s):
        pole = [[i * j for j in range(s)] for i in range(r)]
        for i in range(r):
            for j in range(s):
                pole[i][j] = random.randint(0,1)
        return pole

    '''def print_line(s,r):
        x = 0
        pole = [[i * j for j in range(s)] for i in range(r)]
        for i in range(r):
            for j in range(s):
                pole[i][j] = x
                x = x+1
        return pole
    '''
    def move(r, s, pole):
        for i in range(len(pole[0])):
            print(pole[r][s-i])

    def line_size(r, s, pole):
        print(pole[r][s])
        coord = pole[r][s]
        print("Targeted coord has value: " + str(coord))
        x = -3
        for i in range(len(pole)):
            if pole[r][s-i] == coord and s>=0:
                x = x+1
            else:
                break
        for i in range(len(pole[0])):
            if pole[r][s+i] == coord and s<len(pole[0]):
                x = x+1
            else:
                break
        for i in range(len(pole)):
            if pole[r+i][s] == coord and r+i<len(pole):
                x += 1
            else:
                break
        for i in range(len(pole)):
            if pole[r-i][s] == coord and r-1>=0:
                x += 1
            else:
                break
        print("Number of continuous repetition is: ", end=" ")
        return x

    '''
    def directions(self=None):
        for i in range(-1,2):
            for j in range(-1,2):
                if i == 0 and j ==0:
                    continue
                else:
                    print(str(i)+" "+str(j))
    '''
    def search_in_direction(coord, data):
        """ NEED TO BE MODIFIED """
        value = data[coord[0]][coord[1]]
        print("Zamerene pole je " + str(value))
        x=1
        directions = [(-1, 1), (0, 1), (1, 1), (-1, 0), (1, 0), (-1, -1), (0, -1), (1, -1)]
        for i in range(len(directions)):
            for j in range(1, len(data), 1):
                r = coord[0]
                c = coord[1]
                r = r + j * directions[i][0]
                c = c + j * directions[i][1]
                if r < len(data) and c < len(data[r]) and r >= 0 and c >= 0:
                    if data[r][c] == coord:
                        x += 1
                else:
                    break
        return x

    def nic(self):
        pass
        '''
        x = 1
        coord = pole[s][r]
        #print(coord)
        i = 1
        while(pole[s-i][r] == pole[s][r]):
            x = x+1
            i = i+1
        i = 1
        while(pole[s+i][r] == pole[s][r]):
            x = x+1
            i = i+1
        return x
        '''

    def find_legit_move(self, coord, board):
        """ NEED TO BE MODIFIED """
#        value = board[coord[0]][coord[1]]
#        print("Zamerene pole je " + str(value))
        directions = [(-1, 1), (0, 1), (1, 1), (-1, 0), (1, 0), (-1, -1), (0, -1), (1, -1)]
        for i in range(len(directions)):
            gamemode = 0
            count = 0
            for j in range(1, len(board), 1):
                r = coord[0]
                c = coord[1]
                r = r + j * directions[i][0]
                c = c + j * directions[i][1]
                if r < len(board) and c < len(board[r]) and r >= 0 and c >= 0:
                    if j == 1 and board[r][c] == self.my_color:
#                        print("Stejne cislo je i v poli na souradnicich [" + str(r) + "] [" + str(c) + "]")
                        continue
                    if j != 1 and board[r][c] == self.opp_color:
                        count += 1
                        gamemode = 1
                    if gamemode == 1 and board[r][c] == self.my_color:
                        return True
                    else:
                        break
                else:
                    break
        return False
