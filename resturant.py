import cplex


def restaurant():
    employee_needed = {
        'Monday': 4,
        'Tuesday': 5,
        'Wednesday': 5,
        'Thursday': 10,
        'Friday': 12,
        'Saturday': 12,
        'Sunday': 2
    }
    employee_needed_list = [4, 5, 5, 10, 12, 12, 2]

    cpx = cplex.Cplex()
    cpx.objective.set_sense(cpx.objective.sense.minimize)

    x_var_names = list()
    y_var_names = list()
    for i in employee_needed:
        x_var_names.append("x_{" + i + "}")  # number of employees who start on i
        y_var_names.append("y_{" + i + "}")  # number of employees who are working on i

    cpx.variables.add(names=y_var_names,
                      lb=[0.0] * len(y_var_names),
                      obj=[100] * len(y_var_names),
                      types=['I'] * len(y_var_names))
    cpx.variables.add(names=x_var_names,
                      lb=[0.0] * len(x_var_names),
                      obj=[0] * len(x_var_names),
                      types=['I'] * len(x_var_names))

    # building demand constraint :
    for i in range(len(employee_needed_list)):
        _lin_expr = [[[y_var_names[i]], [1]]]
        _rhs = [employee_needed_list[i]]
        _senses = ['G']
        cpx.linear_constraints.add(lin_expr=_lin_expr, rhs=_rhs, senses=_senses)

    # building the 4 day shift constraint
    for i in range(len(employee_needed_list)):
        _lin_expr = [[y_var_names[i]], [1]]
        _rhs = [0]
        _senses = ['L']
        four_days_ago = (i - 4) % len(employee_needed_list)
        four_days_ago += 1
        for j in range(four_days_ago, four_days_ago + 4):
            _lin_expr[0].append(x_var_names[j % 7])
            _lin_expr[1].append(-1)
        cpx.linear_constraints.add(lin_expr=[_lin_expr], rhs=_rhs, senses=_senses)

    # building the 4 day shift constraint
    _lin_expr = [[], []]
    _rhs = [17]
    _senses = ['L']
    for i in range(len(employee_needed_list)):
        _lin_expr[0].append(x_var_names[i])
        _lin_expr[1].append(1)
    cpx.linear_constraints.add(lin_expr=[_lin_expr], rhs=_rhs, senses=_senses)
    cpx.write('restaurant.lp')
    cpx.solve()

    x = cpx.solution.get_values()
    n = cpx.variables.get_names()
    s = dict()
    for i in range(len(x)):
        s[n[i]] = x[i]
    pass


if __name__ == '__main__':
    restaurant()
