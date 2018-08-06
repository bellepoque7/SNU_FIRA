from parttimer import PartTimer


park = PartTimer('라이언')
print(park.nickname)
print(park.workplace)

lee = PartTimer('네오', '137-1동')
print(lee.nickname)
print(lee.workplace)

print(park.calculate_wage(3))
print(PartTimer.total_part_timers)