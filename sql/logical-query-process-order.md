**logical SQL execution order**


```sql
#1	FROM	Identify source tables / views
#2	JOIN / ON	Combine rows according to join conditions
#3	WHERE	Filter individual rows
#4	GROUP BY	Split remaining rows into groups
#5	AGGREGATE FUNCTIONS	Compute COUNT, SUM, AVG, etc. per group
#6	HAVING	Filter groups (after aggregation)
#7	SELECT	Choose output columns / expressions
#8	DISTINCT	Remove duplicate result rows
#9	ORDER BY	Sort final result
#10	LIMIT / OFFSET	Trim result set
```
