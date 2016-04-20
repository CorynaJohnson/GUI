#include "Category.h"

Category::Category(string name, double amount, bool type):
    m_name(name), m_amount(amount), m_type(type){}

void Category::setName(string name)
{
    m_name = name;
}

string Category::getName()
{
    return m_name;
}

void Category::setAmount(double amount)
{
    m_amount = amount;
}

double Category::getAmount()
{
    return m_amount;
}

void Category::setType(bool type)
{
    m_type = type;
}

bool Category::getType()
{
    return m_type;
}
