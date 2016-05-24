#include "Category.h"

Category::Category(QString name, double allowance, bool type):
    m_name(name), m_allowance(allowance), m_type(type){
    m_sum = 0;
}

Category & Category::operator=(const Category & arg)
{
    if(this != &arg)
    {
        m_name = arg.m_name;
        m_type = arg.m_type;
        m_allowance = arg.m_allowance;
    }
    return *this;
}

Category::Category(const Category & copy)
{
    m_name = copy.m_name;
    m_type = copy.m_type;
    m_allowance = copy.m_allowance;
    m_sum = copy.m_sum;
}
void Category::addExpense(double spent, QString reason)
{
    //m_expenses.insert(m_expenses.begin(),Expense(spent, reason));
    m_expenses.push_back(Expense(spent,reason));
    m_sum += m_expenses.back().getSpent();
}

void Category::subtractFromTotal(double spent)
{
    if(m_type)
        m_allowance += spent;
    else
        m_allowance -= spent;
}

QString Category::getExpenseReason(int index)
{
    return m_expenses[index].getReason();
}

double Category::getExpenseSpent(int index)
{
    return m_expenses[index].getSpent();
}

double Category::sumExpenses()
{
    return m_sum;
}

int Category::numberofExpenses()
{
    return m_expenses.size();
}

void Category::setName(QString name)
{
    m_name = name;
}

QString Category::getName()
{
    return m_name;
}

void Category::setType(bool type)
{
    m_type = type;
}

bool Category::getType()
{
    return m_type;
}

void Category::setAllowance(double allowance)
{
    m_allowance = allowance;
}

double Category::getAllowance()
{
    return m_allowance;
}
