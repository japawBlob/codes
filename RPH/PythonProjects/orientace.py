import random


class PrintField:
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

    def line_size(r, s, pole):
        print(pole[r][s])
        coord = pole[r][s]
        print("Targeted coord has value: " + str(coord))
        x = -6
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



    def search(coord, pole):
        value = pole[coord[0]][coord[1]]
        print("Zamerene pole je " + str(value))
        count = 1;
        directions = [(-1, 1), (0, 1), (1, 1), (-1, 0), (1, 0), (-1, -1), (0, -1), (1, -1)]
        for i in range(len(directions)):
            '''r = coord[0]
            c = coord[1]'''
            for j in range(1,len(pole),1):
                r = coord[0]
                c = coord[1]
                r = r + j * directions[i][0]
                c = c + j * directions[i][1]
                if r < len(pole) and c < len(pole) and r >= 0 and c >= 0:
                    if pole[r][c] == value:
                        print("Stejne cislo je i v poli na souradnicich ["+str(r)+"] ["+str(c)+"]")
                        count += 1
                    else:
                        break
                else:
                    break
        return count

    def find_legit_move(coord, board):
        value = 1
        print("Zamerene pole je " + str(value))
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
                    if j == 1 and board[r][c] == value:
                        print("Stejne cislo je i v poli na souradnicich [" + str(r) + "] [" + str(c) + "]")
                        continue
                    if j != 1 and board[r][c] == 0:
                        count += 1
                        gamemode = 1
                        print("Cisla, ktera bych prehodil jsou na souradnici [" + str(r) + "] [" + str(c) + "]")
                    if gamemode == 1 and board[r][c] == value:
                        print("Cislo ktere radu uzavira je na souradnici [" + str(r) + "] [" + str(c) + "]")
                        return True
                    else:
                        break
                else:
                    break
        return False

    def value_of_position(r,c):
        #r = coord[0]
        #c = coord[1]
        board_value = [
            [0, 1, 1, 1, 1, 1, 1, 0],
            [1, 4, 3, 3, 3, 3, 4, 1],
            [1, 3, 2, 2, 2, 2, 3, 1],
            [1, 3, 2, 9, 9, 2, 3, 1],
            [1, 3, 2, 9, 9, 2, 3, 1],
            [1, 3, 2, 2, 2, 2, 3, 1],
            [1, 4, 3, 3, 3, 3, 4, 1],
            [0, 1, 1, 1, 1, 1, 1, 0]
        ]
        return board_value[r][c]


'''
    hraci_pole = 
    [[-1,-1,-1,-1,-1,-1,-1,-1],
    [-1,-1,-1,-1,-1,-1,-1,-1],
    [-1,-1,-1,-1,-1,-1,-1,-1],
    [-1,-1,-1,0,1,-1,-1,-1],
    [-1,-1,-1,1,0,-1,-1,-1],
    [-1,-1,-1,-1,-1,-1,-1,-1],
    [-1,-1,-1,-1,-1,-1,-1,-1],
    [-1,-1,-1,-1,-1,-1,-1,-1]]
    
                
'''