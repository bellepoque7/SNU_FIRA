class PartTimer:
    hour_rate = 7500
    total_part_timers = 0

    def __init__(self, name, workplace='113동'):
        self.nickname = name
        self.workplace = workplace
        PartTimer.total_part_timers += 1
        return

    def getnickname(self):
        return '내 이름은 {0} 입니다.'.format(self.nickname)

    def calculate_wage(self, hour):
        return self.hour_rate*hour