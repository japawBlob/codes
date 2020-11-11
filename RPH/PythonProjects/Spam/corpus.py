import os


class Corpus:
    def __init__(self, path):
        self.path = path
        self.corp_emails = []
        for email in os.listdir(path):
            if email[0] != '!':
                self.corp_emails.append(email)

    def emails(self):
        for name in self.corp_emails:
            with open(os.path.join(self.path, name), 'r', encoding='utf-8') as f:
                body = ""
                for line in f:
                    body += line
            yield name, body


