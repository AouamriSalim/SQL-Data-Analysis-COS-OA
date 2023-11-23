use cosider_oa
go 
WITH cte AS (
    SELECT
        Pole,
        CODE_NT,
        act,
        MONT,
        Q_propre,
        CONCAT(ANNEE, MONT,'01') AS MonthYear,
        CLE_PR
    FROM (
             SELECT
                 Pole,
                 Code_NT,
                 act,
                 ANNEE,
                 CLE_PR,
                 SUM(q_propre_1) AS [01],
                 SUM(q_propre_2) AS [02],
                 SUM(q_propre_3) AS [03],
                 SUM(q_propre_4) AS [04],
                 SUM(q_propre_5) AS [05],
                 SUM(q_propre_6) AS [06],
                 SUM(q_propre_7) AS [07],
                 SUM(q_propre_8) AS [08],
                 SUM(q_propre_9) AS [09],
                 SUM(q_propre_10) AS [10],
                 SUM(q_propre_11) AS [11],
                 SUM(q_propre_12) AS [12]
             FROM cht.budget_production
             GROUP BY Pole,Code_NT, act, ANNEE,CLE_PR
         ) sbm
             UNPIVOT (
             Q_propre FOR MONT IN
            ([01], [02], [03], [04], [05], [06], [07], [08], [09], [10], [11], [12])
             ) AS SalesUnPivot
),

     cte1 AS (
         SELECT
             Pole,
             Code_NT,
             act,
             MONT,
             V_propre,
             CLE_PR,
             CONCAT(ANNEE, MONT,'01') AS MonthYear
         FROM (
                  SELECT
                      Pole,
                      Code_NT,
                      act,
                      ANNEE,
                      CLE_PR,
                      SUM(V_propre_1) AS [01],
                      SUM(V_propre_2) AS [02],
                      SUM(V_propre_3) AS [03],
                      SUM(V_propre_4) AS [04],
                      SUM(V_propre_5) AS [05],
                      SUM(V_propre_6) AS [06],
                      SUM(V_propre_7) AS [07],
                      SUM(V_propre_8) AS [08],
                      SUM(V_propre_9) AS [09],
                      SUM(V_propre_10) AS [10],
                      SUM(V_propre_11) AS [11],
                      SUM(V_propre_12) AS [12]
                  FROM cht.budget_production
                  GROUP BY Pole,Code_NT, act, ANNEE,CLE_PR
              ) sbm
                  UNPIVOT (
                  V_propre FOR MONT IN
                 ([01], [02], [03], [04], [05], [06], [07], [08], [09], [10], [11], [12])
                  ) AS SalesUnPivot
     ),
     cte2 AS (
         SELECT
             Pole,
             Code_NT,
             act,
             MONT,
             ST,
             CLE_PR,
             CONCAT(ANNEE, MONT,'01') AS MonthYear
         FROM (
                  SELECT
                      Pole,
                      Code_NT,
                      act,
                      ANNEE,
                      CLE_PR,
                      SUM(ST_1) AS [01],
                      SUM(ST_2) AS [02],
                      SUM(ST_3) AS [03],
                      SUM(ST_4) AS [04],
                      SUM(ST_5) AS [05],
                      SUM(ST_6) AS [06],
                      SUM(ST_7) AS [07],
                      SUM(ST_8) AS [08],
                      SUM(ST_9) AS [09],
                      SUM(ST_10) AS [10],
                      SUM(ST_11) AS [11],
                      SUM(ST_12) AS [12]
                  FROM cht.budget_production
                  GROUP BY Pole,Code_NT, act, ANNEE,CLE_PR
              ) sbm
                  UNPIVOT (
                  ST FOR MONT IN
                 ([01], [02], [03], [04], [05], [06], [07], [08], [09], [10], [11], [12])
                  ) AS SalesUnPivot
     ),
     cte3 AS (
         SELECT
             Pole,
             Code_NT,
             act,
             MONT,
             Q_Preste,
             CLE_PR,
             CONCAT(ANNEE, MONT,'01') AS MonthYear
         FROM (
                  SELECT
                      Pole,
                      Code_NT,
                      act,
                      ANNEE,
                      CLE_PR,
                      SUM(q_preste_1) AS [01],
                      SUM(q_preste_2) AS [02],
                      SUM(q_preste_3) AS [03],
                      SUM(q_preste_4) AS [04],
                      SUM(q_preste_5) AS [05],
                      SUM(q_preste_6) AS [06],
                      SUM(q_preste_7) AS [07],
                      SUM(q_preste_8) AS [08],
                      SUM(q_preste_9) AS [09],
                      SUM(q_preste_10) AS [10],
                      SUM(q_preste_11) AS [11],
                      SUM(q_preste_12) AS [12]
                  FROM cht.budget_production
                  GROUP BY Pole,Code_NT, act, ANNEE,CLE_PR
              ) sbm
                  UNPIVOT (
                  Q_Preste FOR MONT IN
                 ([01], [02], [03], [04], [05], [06], [07], [08], [09], [10], [11], [12])
                  ) AS SalesUnPivot
     ),
     cte4 AS (
         SELECT
             Pole,
             Code_NT,
             act,
             MONT,
             V_Preste,
             CLE_PR,
             CONCAT(ANNEE, MONT,'01') AS MonthYear
         FROM (
                  SELECT
                      Pole,
                      Code_NT,
                      act,
                      ANNEE,
                      CLE_PR,
                      SUM(v_preste_1) AS [01],
                      SUM(v_preste_2) AS [02],
                      SUM(v_preste_3) AS [03],
                      SUM(v_preste_4) AS [04],
                      SUM(v_preste_5) AS [05],
                      SUM(v_preste_6) AS [06],
                      SUM(v_preste_7) AS [07],
                      SUM(v_preste_8) AS [08],
                      SUM(v_preste_9) AS [09],
                      SUM(v_preste_10) AS [10],
                      SUM(v_preste_11) AS [11],
                      SUM(v_preste_12) AS [12]
                  FROM cht.budget_production
                  GROUP BY Pole,Code_NT, act, ANNEE,CLE_PR
              ) sbm
                  UNPIVOT (
                  V_Preste FOR MONT IN
                 ([01], [02], [03], [04], [05], [06], [07], [08], [09], [10], [11], [12])
                  ) AS SalesUnPivot
     )

select d.Pole,d.CODE_NT, d.act, d.MonthYear, Q_propre,V_propre,ST,Q_Preste,V_Preste,CLE_PR  from  cte d  
cross apply (select V_propre from cte1 t where t.pole=d.pole and t.CODE_NT=d.CODE_NT and t.act=d.act and t.MonthYear=d.MonthYear ) as V
cross apply ( select ST from cte2 g where g.pole=d.pole and g.CODE_NT=d.CODE_NT and g.act=d.act and g.MonthYear=d.MonthYear ) as S
cross apply ( select Q_Preste from cte3 o where o.pole=d.pole and o.CODE_NT=d.CODE_NT and o.act=d.act and o.MonthYear=d.MonthYear ) as QP
cross apply ( select V_Preste from cte4 i where i.pole=d.pole and i.CODE_NT=d.CODE_NT and i.act=d.act and i.MonthYear=d.MonthYear ) as VP
order by pole, act , MonthYear