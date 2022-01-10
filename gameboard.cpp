#include "gameboard.h"
#include <algorithm>
#include <random>

int count = 1;

GameBoard::GameBoard(const size_t boardDimension, QObject *parent)
    :QAbstractListModel {parent},
      m_dimension {boardDimension},
      m_boardSize {m_dimension * (m_dimension + 2)}
{
    m_raw_board.resize(m_boardSize);
    std::iota(m_raw_board.begin(), m_raw_board.end(), 1);
    shuffle();
}

bool GameBoard::move(int index)
{
    if (m_raw_board[index].value == count){
        count++;
        return true;
    }
    else{
        return false;
    }
}

bool GameBoard::check(int index)
{
    if (m_raw_board[index].value == 35){
        return true;
    }
    else{
        return false;
    }
}

void GameBoard::shuffle()
{
    auto seed = std::chrono::system_clock::now().time_since_epoch().count();
    static std::mt19937 g(seed);

//    do {
    std::shuffle(m_raw_board.begin(), m_raw_board.end(), g);
//    } while (!isBoardValid());
}

int GameBoard::rowCount(const QModelIndex &/*parent*/) const
{
    return static_cast<int>(m_boardSize);
}

QVariant GameBoard::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || role != Qt::DisplayRole) {
        return {};
    }

    const auto index_row {static_cast<size_t>(index.row())};

//    if (!isPositionValid(index_row)) {
//        return {};
//    }

    return QVariant(static_cast<int>(m_raw_board[index_row].value));
}
