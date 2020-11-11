

class TrainingCorpus:
    def get_class(self, name):
        return 'SPAM'

    def is_ham(self, name):
        True

    def is_spam(self, name):
        if self.is_ham():
            return False
