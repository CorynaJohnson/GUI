#include "Budget.h"

Budget::Budget()
{
}

void Budget::insertCategory(QString name, double allowance, bool type)
{
    //m_categories.insert(m_categories.begin(),Category(name, allowance, type));
    m_categories.push_back(Category(name, allowance, type));
}

QString Budget::getExpenseReason(int cat_index, int exp_index)
{
    return m_categories[cat_index].getExpenseReason(exp_index);
}

double Budget::getExpenseSpent(int cat_index, int exp_index)
{
    return m_categories[cat_index].getExpenseSpent(exp_index);
}

void Budget::setCurrentCategory(int index)
{
    m_current_category = index;
}

double Budget::getBudgetTotal()
{
    double sum = 0;
    for(int i = 0; i < m_categories.size(); i++)
    {
        sum += m_categories[i].sumExpenses();
    }
    return sum;
}

int Budget::getCurrentCategory()
{
    return m_current_category;
}

int Budget::numofTypes()
{
    return 2;
}

int Budget::numberofExpenses(int index)
{
    return m_categories[index].numberofExpenses();
}

int Budget::numberofCategories()
{
    return m_categories.size();
}

QString Budget::getName(int index)
{
    return m_categories[index].getName();
}

double Budget::getAllowance(int index)
{
    return m_categories[index].getAllowance();
}
void Budget::subtractFromTotal(int index, double spent)
{
    m_categories[index].subtractFromTotal(spent);
}

double Budget::getTotalSpent(int index)
{
    return m_categories[index].sumExpenses();
}

void Budget::addExpense(int index, double spent, QString reason)
{
    m_categories[index].addExpense(spent, reason);
}

bool Budget::getType(int index)
{
    return m_categories[index].getType();
}

Budget & Budget::operator=(const Budget & arg)
{
    if(this != &arg)
    {
        m_categories.clear();
        for(int i = 0; i < arg.m_categories.size(); i++)
        {
            m_categories.push_back(arg.m_categories[i]);
        }
    }
    return *this;
}

Budget::Budget(const Budget & copy)
{
    m_categories.clear();
    m_categories = copy.m_categories;
}


