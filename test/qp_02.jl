# Quadratic programming in MATLAB-like style
#
#   minimize x^2 + xy + y^2 + yz + z^2
#
#   s.t.    x + 2 y + 3 z >= 4
#           x +   y       >= 1
#

using CPLEX

env = CPLEX.Env()

model = CPLEX.cplex_model(env; 
	name = "qp_02", 
	f = [0., 0., 0.],
	H = [2. 1. 0.; 1. 2. 1.; 0. 1. 2.],
	A = -[1. 2. 3.; 1. 1. 0.], 
	b = -[4., 1.])

CPLEX.optimize!(model)

println("sol = $(CPLEX.get_solution(model))")
println("obj = $(CPLEX.get_objval(model))")
