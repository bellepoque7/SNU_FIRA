class PartTimer:
    """ 느티나무 카페에서 일하는 아르바이트 생 클래스"""

    hour_rate = 7500
    total_part_timers = 0

    def __init__(self, name, place='113동'):
        self.total_wage = 0
        self.nickname = name
        self.workplace = place
        PartTimer.total_part_timers += 1

    def getnickname(self):
        return 'My nickname is  ' + self.nickname

    def calculate_wage(self, hours):
        daily_wage = PartTimer.hour_rate * hours
        self.total_wage += daily_wage
        return self.total_wage