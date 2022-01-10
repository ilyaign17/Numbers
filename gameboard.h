#ifndef GAMEBOARD_H
#define GAMEBOARD_H
#include <QAbstractListModel>
#include <vector>

class GameBoard : public QAbstractListModel
{
    Q_OBJECT
public:
    static constexpr size_t DEFAULT_DIMENSION  {5};

    GameBoard(const size_t board_dimension = DEFAULT_DIMENSION, QObject* parent = nullptr);

    struct Tile {
        size_t value {};

        Tile& operator= (const size_t new_value){
            value = new_value;
            return *this;
        }
        bool operator==(const size_t other) {
            return other == value;
        }
    };

    Q_INVOKABLE bool move(int index);
    Q_INVOKABLE bool check(int index);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    void shuffle();

private:
    std::vector<Tile> m_raw_board;

    const size_t m_dimension;
    const size_t m_boardSize;
};

#endif // GAMEBOARD_H
