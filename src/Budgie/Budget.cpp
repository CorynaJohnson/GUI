#include "Budget.h"

Budget::Budget(double spent, double left, string reason):
    m_spent(spent), m_left(left), m_reason(reason){}

void Budget::setSpent(double spent)
{
    m_spent = spent;
}

double Budget::getSpent()
{
    return m_spent;
}

void Budget::setLeft(double left)
{
    m_left = left;
}

double Budget::getLeft()
{
    return m_left;
}

void Budget::setReason(string reason)
{
    m_reason = reason;
}

string Budget::getReason()
{
    return m_reason;
}
