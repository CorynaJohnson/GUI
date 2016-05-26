#ifndef BUDGET_H
#define BUDGET_H
#include "Category.h"
#include <vector>
#include <QObject>
using std::vector;

class Budget : public QObject
{
    Q_OBJECT
public:
    Budget();
    Budget(const Budget & copy);
    Budget & operator=(const Budget & arg);
public slots:
    void insertCategory(QString name, double allowance, bool type);
    void subtractFromTotal(int index, double spent);
    double getTotalSpent(int index);
    void addExpense(int index, double spent, QString reason);
    QString getExpenseReason(int cat_index, int exp_index);
    double getExpenseSpent(int cat_index, int exp_index);
    int numberofCategories();
    int numberofExpenses(int index);
    QString getName(int index);
    double getAllowance(int index);
    bool getType(int index);
    int numofTypes();
    void setCurrentCategory(int index);
    int getCurrentCategory();
    double getBudgetTotal();
    double getExpensesLeft();
private:
    vector<Category> m_categories;
    int m_current_category;
};

#endif // BUDGET_H
