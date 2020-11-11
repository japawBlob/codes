import player

def evaluate(m1,m2):
    if (m1, m2) in [('R','S'), ('P', 'R'), ('S', 'P')]:
        return 1, 0
    else:
        return 0, 1

class Game:
    def __init__(self, p1, p2, minwin):
        self.p1 = p1
        self.p2 = p2
        self.minwin = minwin

    def run(self):
        draw = True
        while draw:
            p1_move = self.p1.play()
            p2_move = self.p2.play()
            draw = (p1_move == p2_move)
        score = evaluate(p1_move, p2_move)
        if score[0] > score[1]:
            return self.p1
        else:
            return self.p2

if __name__ == "__main__":
    p1 = player.MyPlayer('S')
    p2 = player.MyPlayer('R')
    g = Game(p1, p2, 1)
    winner = g.run()
    print(winner)

