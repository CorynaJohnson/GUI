#ifndef EXPENSE_H
#define EXPENSE_H
#include <QString>
#include <QObject>

using std::string;


class Expense
{
public:
    Expense(double spent,QString reason);
    void setSpent(double spent);

    void setReason(QString reason);

public slots:
    double getSpent();
    QString getReason();
private:
    double m_spent;                   //money spent
    QString m_reason;                  //reason for purchase
};

#endif // EXPENSE_H
