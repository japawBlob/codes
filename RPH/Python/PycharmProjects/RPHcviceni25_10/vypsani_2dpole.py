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

    def print_random(s,r):
        pole = [[i * j for j in range(s)] for i in range(r)]
        for i in range(r):
            for j in range(s):
                pole[i][j] = random.randint(0,1)
        return pole

    def print_line(s,r):
        x = 0
        pole = [[i * j for j in range(s)] for i in range(r)]
        for i in range(r):
            for j in range(s):
                pole[i][j] = x
                x = x+1
        return pole

    def move(r, s, pole):
        for i in range(len(pole[0])):
            print(pole[r][s-i])

    def print_repetition(r, s, pole):
        coord = pole[r][s]
        print("Targeted coord has value: " + str(coord))
        x = -1
        for i in range(s+1):
            if pole[r][s-i] == coord:
                x = x+1
            else:
                break
        for i in range((len(pole)-(s))):
            if pole[r][s+i] == coord:
                x = x+1
            else:
                break
        print("Number of continuous repetition is: ", end=" ")
        return x




        '''x = 1
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