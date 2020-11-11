class TepleNapoje:
    def __init__(self, aditivum):
        self.aditivum = aditivum

    def priprav(self):
        self.var_vodu()
        self.pridej_substanci()
        self.nalej_vodu()
        self.pridej_aditivum()

    def var_vodu(self):
        print("Vařím vodu.")

    def pridej_substanci(self):
        raise NotImplementedError("Implementovano jinde.")

    def nalej_vodu(self):
        print("Nalevam vodu do salku")

    def pridej_aditivum(self):
        print("Přidávám %s." % self.aditivum)


class Caj(TepleNapoje):
    def pridej_substanci(self):
        print("Dávám do šálku sáček s čajem.")


class TureckaKava(TepleNapoje):
    def pridej_substanci(self):
        print("Dávám do šálku lžičku mleté kávy.")


if __name__ == "__main__":
    objednavka = [TureckaKava('mléko a cukr'),
                  Caj('citrón'),
                  TureckaKava('mléko')]
    for napoj in objednavka:
        napoj.priprav()
        print()

