#ifndef CATEGORY_H
#define CATEGORY_H
#include "Expense.h"
#include <QString>
#include <vector>
#include "Expense.h"
#include <QObject>
using std::vector;

class Category : public QObject
{
    Q_OBJECT
public:
    Category(QString name, double allowance, bool type);
    Category(const Category & copy);
    Category & operator=(const Category & arg);
    void setName(QString name);
    void setType(bool type);
    void setAllowance(double allowance);

public slots:
    QString getName();
    bool getType();
    double getAllowance();
    double sumExpenses();
    QString getExpenseReason(int index);
    double getExpenseSpent(int index);
    void addExpense(double spent, QString reason);
    void subtractFromTotal(double spent);
    int numberofExpenses();
private:
    QString m_name;          //name of category
    bool m_type;            //true is add, false is subtract
    double m_allowance;     //amount of money that is allowed to be spent
    double m_sum;           //sum of the expenses
    vector<Expense> m_expenses;     //list of expenses made from each category
};


#endif // CATEGORY_H
