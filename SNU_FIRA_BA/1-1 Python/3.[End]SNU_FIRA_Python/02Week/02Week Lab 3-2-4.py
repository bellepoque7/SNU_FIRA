from typing import Dict, Union, Tuple

d: Dict[str, Union[Tuple[int, int, int, int, int], Tuple[int, int, int, int], Tuple[int, int, int, int, int, int, int, int, int, int]]] = {'even': (2, 4, 6, 8, 10), 'odd': (1, 3, 5, 7, 9), 'prime': (2, 3, 5, 7)}
print(d)
d['all'] = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
print(d)
del d['odd']
print(d)