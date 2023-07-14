#!/Users/seungjoonlee/git/learn-ansible/venv/bin/python

class FilterModule(object):
    def filters(self):
        return {
            "total": self.total,
            "average": self.average
        }
    
    def total(self, numbers):
        return sum(numbers)
    
    def average(self, numbers):
        return float(sum(numbers)) / len(numbers)
