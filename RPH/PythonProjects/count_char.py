def count_chars_in_string(retezec):
    cetnosti = {}
    for i in range(len(retezec)):
        pismenko = retezec[i]
        if pismenko in cetnosti:
            cetnosti[pismenko]+=1
            continue
        cetnosti.append(pismenko)
        cetnosti[pismenko]+=1

        cetnosti.get[retezec[i]] == None

def word_count(link):
    dic = {}
    with open(link, 'r', encoding='utf-8') as f:
        for line in f:
            words = line.split(' ')
            dic[words[i]]

