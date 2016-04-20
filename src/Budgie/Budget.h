#ifndef BUDGET_H
#define BUDGET_H
#include <string>
using std::string;

class Budget
{
public:
    Budget(double spent, double left, string reason);
    void setSpent(double spent);
    double getSpent();
    void setLeft(double left);
    double getLeft();
    void setReason(string reason);
    string getReason();
private:
    double m_spent;
    double m_left;
    string m_reason;        //reason for purchase
};

#endif // BUDGET_H
