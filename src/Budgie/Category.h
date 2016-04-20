#ifndef CATEGORY_H
#define CATEGORY_H
#include <string>
using std::string;

class Category
{
public:
    Category(string name, double amount, bool type);
    void setName(string name);
    string getName();
    void setAmount(double amount);
    double getAmount();
    void setType(bool type);
    bool getType();
private:
    string m_name;          //name of category
    double m_amount;        //amount allocated for budget
    bool m_type;            //true is add, false is subtract
};


#endif // CATEGORY_H
