select 
    name,
    exp_residents AS residents
from planets
CROSS JOIN UNNEST(SPLIT(residents[1],',')) as t(exp_residents)
