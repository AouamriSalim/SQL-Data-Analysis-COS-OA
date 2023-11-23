# SQL Data Analysis
The provided SQL query is designed to transform and aggregate data from a table named cht.budget_production. 

The objective is to pivot the data based on different columns representing months and then unpivot it to provide a normalized view. Subsequently, the query creates several Common Table Expressions (CTEs) to handle different aspects of the data, such as quantities (Q_propre), values (V_propre), sales tax (ST), quantities for services (Q_Preste), and values for services (V_Preste).

The final result is a unified view of these metrics for each combination of Pole, CODE_NT, act, and month-year.

 #  Summary:

    Pivoting and Unpivoting: 
           The initial part of the query uses the UNPIVOT operation to transform columns representing quantities and values for each month into rows, making the data more manageable.
      
    Common Table Expressions (CTEs): 
           The query then creates five CTEs (cte, cte1, cte2, cte3, and cte4), each corresponding to a specific metric (quantities, values, sales tax, quantities for services, and values for services).
           
    Final Result: 
        The final result is obtained by joining the CTEs using the CROSS APPLY clause, 
        combining the data for each metric into a single row based on the common attributes (Pole, CODE_NT, act, and MonthYear).
