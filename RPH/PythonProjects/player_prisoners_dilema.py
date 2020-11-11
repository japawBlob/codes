COOPERATE = False
DEFECT = True


class MyPlayer:
    """Player V4.3 // This player is Cooperative-type of player with some improvements"""

    def __init__(self, payoff_matrix, iterations=None):
        self.number_of_iterations = iterations
        self.payoff_matrix = payoff_matrix
        self.opp_move = 20 * [None]
        self.play_mode = 0
        self.change_strategy = 0

        if payoff_matrix[0][0][0] <= payoff_matrix[1][1][0]:        # is it even worth to cooperate?
            self.play_mode = 1

        if payoff_matrix[0][1][0]+3*payoff_matrix[0][0][0] < payoff_matrix[0][1][1]:  # isn't being defected too costly?
            self.play_mode = 2

    def move(self):
        how_many = 0

        if self.play_mode == 0:

            for i in range(len(self.opp_move)):
                if self.opp_move[i] == DEFECT:
                    how_many = how_many + 1

            if how_many <= 6:  # if opponent wants to cooperate at least 30% of the time - also cooperate
                return COOPERATE

            if self.opp_move[0] == COOPERATE:  # if opponents last three moves were cooperate - cooperate too
                x = 0
                for i in range(3):
                    if self.opp_move[i] == COOPERATE:
                        x = x + 1
                if x == 3:
                    return COOPERATE

            if how_many == 20 and self.change_strategy == 0:  # if there's chain of DEFECTIONS - try one COOPERATE
                self.play_mode = 3
                return COOPERATE

            else:  # if it looks like opponent is playing random - play Defect
                return DEFECT

        if self.play_mode == 3:  # play sequence after trying to regain the trust
            if self.opp_move[0] == COOPERATE:
                return COOPERATE
            else:
                self.change_strategy = self.change_strategy + 1
                self.play_mode = 0
                return DEFECT

        if self.play_mode == 1:  # when coop is not worth it
            return DEFECT

        if self.play_mode == 2:  # if being defected is too costly remove one forgiving factor
            for i in range(len(self.opp_move)):
                if self.opp_move[i] == DEFECT:
                    how_many = how_many + 1

            if how_many <= 4:
                return COOPERATE

            if how_many == 20 and self.change_strategy == 0:
                self.play_mode = 4
                return COOPERATE

            else:
                return DEFECT

        if self.play_mode == 4:
            if self.opp_move[0] == COOPERATE:
                return COOPERATE
            else:
                self.change_strategy = self.change_strategy + 1
                self.play_mode = 2
                return DEFECT

    def record_opponents_move(self, opponent_move):
        del self.opp_move[-1]
        self.opp_move.insert(0, opponent_move)
