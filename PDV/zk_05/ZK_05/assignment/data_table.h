#ifndef ZK_05_DATA_TABLE_H
#define ZK_05_DATA_TABLE_H

#include <vector>
#include <iostream>

const int MAX_VALUE = 100;

class data_table {
private:
    const unsigned int size;
    std::vector<unsigned int> data;

public:
    data_table(unsigned int size) : size(size), data(size * size) {}
    data_table(data_table& t) : size(t.getSize()) {
        data = std::vector<unsigned int>(t.getData());
    }
    inline unsigned int & operator()(unsigned int i, unsigned int j) {
        return data[i*size + j];
    }

    const unsigned int getSize() const {
        return size;
    }

    const std::vector<unsigned int> &getData() const {
        return data;
    }

    void print() const {
        for (int i=0; i<size; i++) {
            for (int j=0; j<size; j++) {
                std::cout << data[i*size + j] << " ";
            }
            std::cout << std::endl;
        }
    }
};

void generate_data(data_table& table);
long long generate_checksum(const std::vector<unsigned int>& vector);

#endif //ZK_05_DATA_TABLE_H
