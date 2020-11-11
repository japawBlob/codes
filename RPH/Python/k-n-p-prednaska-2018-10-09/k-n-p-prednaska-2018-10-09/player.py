import random

class BasePlayer:
    def __init__(self, given_answer="R"):
        self.answer = given_answer
        self.opp_moves = 5*[None]  # [none,none,none,none,none]

    def play(self):
        raise NotImplementedError

        """if not(None in self.opp_moves):  # kdyz je nejaky none v pameti
            return random.choice(self.opp_moves)  # hraj nahodne ze souperovych kroku (kdyz on 5x kamen tak ja taky kamen)
        else:
            return self.answer  # dej odpovek
        """
    def record_opp_move(self,opp_move):
        del self.opp_moves[-1]  # smaze posledni pozici
        self.opp_moves.insert(0, opp_move)  # uloz na 0tou pozici tah oponenta

    def __str__(self):
        return ' '+ self.answer

class RandomPlayer(BasePlayer):
    def play(self):
        return random.choice(['R', 'P', 'S'])

class RandomMemoryPlayer(BasePlayer):
    def play(self):
        in not(None in self.opp_moves):

MyPlayer = RandomPlayer

if __name__ == '__main__':
    p = MyPlayer()
    for i in range(10):
        print(p.play())
    p.record_opp_move('R')