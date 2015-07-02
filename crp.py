# Generate table assignments for "num_customers" customers, according to a Chinese Restaurant Process with dispersion parameter "alpha"

from scipy import stats

def chinese_restaurant_process(num_customers, alpha):
	table_assignments = []
	if num_customers <= 0:
		return table_assignments
	else:
		for i in range(num_customers):
			if i == 0:
				table_assignments.append(1)
			else:
				xk = set(table_assignments)
				xk.add(max(table_assignments)+1)
				pk = []
				for j in range(1, max(table_assignments)+1):
					pk.append(table_assignments.count(j)/(len(table_assignments)+alpha))
				pk.append(alpha/(len(table_assignments)+alpha))
				if len(xk) != len(pk): print("something's wrong")
				distribution = stats.rv_discrete(name="distribution", values = (list(xk), pk))
				table_assignments.append(distribution.rvs(size=1)[0])
		return table_assignments
