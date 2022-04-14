def get_departements(largest_ones_first=False):
    departements = ["{:02d}".format(d) for d in range(1, 96)] + ['97']
    return departements


DEPARTEMENTS = get_departements()
