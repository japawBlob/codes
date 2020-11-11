#ifndef SPIN_H
#define SPIN_H

// Implementace spinlocku pomoci atomicke promenne. Jelikoz 'spin_mutex' implementuje
// stejne jako 'std::mutex' metody 'lock' a 'unlock', muzete ho pouzit napriklad i
// v std::unique_lock a jinych strukturach, na ktere jste zvykli.
class spin_mutex {
private:

		// Informaci o tom, zda je mutex zamceny si drzime v promenne 'flag'
		// typu 'std::atomic'.
    std::atomic_flag flag;

public:

		// 'flag' inicializujeme hodnotou 'ATOMIC_FLAG_INIT'.
    spin_mutex() : flag(ATOMIC_FLAG_INIT) {}

    void lock() {
    		// Prvni operaci, kterou muzeme nad 'std::atomic_flag' provest je operace
    		// 'test_and_set'. Ta nastavi 'flag' na true, pokud jeho predchazejici hodnota
    		// byla false (tedy z odemknuteho stavu se 'flag' dostane do zamceneho).
    		// Na rozdil od operace 'compare_exchange_strong', kterou si vyzkousite na
    		// slozitejsich atomickych typech, operace 'test_and_set' vraci predchozi
    		// hodnotu promenne 'flag' (a nikoliv informaci o tom, zda se nam 'flag'
    		// podarilo uspesne zmenit). Musime proto ve while smycce cekat do te doby,
    		// nez nam metoda 'test_and_set' vrati, ze predchazejici hodnota 'flag' byla
    		// false (tedy provedli jsme operaci 'test_and_set' na odemknutem mutexu).
        while(flag.test_and_set(std::memory_order_acq_rel));

        // BONUS: Atomicke operace maji volitelne parametry 'std::memory_order_*'.
        // Tyto parametry ovlivnuji zpusob, jakym dochazi k synchronizaci pameti.
        // Ve vychozim nastaveni tyto parametry nabyvaji hodnoty 'std::memory_order_seq_cst',
        // tj., atomicke promenne garantuji tzv. sekvencni konzistenci. V tomto rezimu,
        // lze operace nad atomickou promennou (provadene vice vlakny) seradit do sekvence
        // tak, ze vlakna vzdy pracuji s aktualni hodnotou.
        //
        // To ale vyzaduje, ze hodnoty pameti musi procesorova jadra stale synchronizovat.
        // Na nekterych architekturach ale muze byt takovato synchronizace draha a muzeme
        // nad ni chtit prevzit rucni kontrolu (a vynucovat ji pouze tehdy, pokud ji
        // potrebujeme). To nam prave umoznuji parametry 'std::memory_order_*', ktere nam
        // dovoli relaxovat sekvencni konzistenci.
    }

    void unlock() {
    		// Pro odemceni mutexu staci nastavit priznak zpet na false.
        flag.clear(std::memory_order_release);

        // POZOR! Mutex by melo vzdy odemykat pouze vlakno, ktere ho vlastni! Vsimnete
        // si, ze pokud by se mutex pokusilo odemknout jine vlakno, stale dojde k jeho
        // odemceni.
    }

};

#endif
