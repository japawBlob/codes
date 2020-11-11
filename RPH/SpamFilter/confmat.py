
class BinaryConfusionMatrix:

    def __init__(self, pos_tag, neg_tag):
        self.pos_tag = pos_tag
        self.neg_tag = neg_tag
        self.tp = 0
        self.tn = 0
        self.fp = 0
        self.fn = 0

    def as_dict(self):
        matrix = {'tp': self.tp, 'tn': self.tn, 'fp': self.fp, 'fn': self.fn}
        return matrix

    def update(self, truth, prediction):
        if prediction == self.pos_tag:
            if truth == prediction:
                self.tp += 1
            else:
                if truth != self.neg_tag:
                    raise ValueError
                else:
                    self.fp += 1
        elif prediction == self.neg_tag:
            if truth == prediction:
                self.tn += 1
            else:
                if truth != self.pos_tag:
                    raise ValueError
                else:
                    self.fn += 1
        else:
            raise ValueError

    def compute_from_dicts(self, truth_dict, pred_dict):
        for i in truth_dict:
            self.update(truth_dict[i], pred_dict[i])
