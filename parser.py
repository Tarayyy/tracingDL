from clingo import Control
from clingodl import ClingoDLTheory

thy = ClingoDLTheory()
ctl = Control(['0'])
thy.register(ctl)
ctl.load("main.lp")
ctl.ground([("base", [])])
thy.prepare(ctl)
ctl.solve(on_model=thy.on_model)