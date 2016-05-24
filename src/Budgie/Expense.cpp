#include "Expense.h"

Expense::Expense(double spent, QString reason):
    m_spent(spent), m_reason(reason) {}

void Expense::setSpent(double spent)
{
    m_spent = spent;
}

double Expense::getSpent()
{
    return m_spent;
}

void Expense::setReason(QString reason)
{
    m_reason = reason;
}

QString Expense::getReason()
{
    return m_reason;
}
