import queue
import random

rand_list = random.sample(range(10), 6) # Random numbers to test VMP
mem_slot = 4
alist = [] # FIFO store simulate 4 pages

# Programmatically create empty memory slots
for i in range(mem_slot):
    alist.append(-1)

print('List of items: ', rand_list)
print('Memory slots: ', alist)

def fifo():
    i = 0
    while True:
        for j in range(len(alist)):
            alist[j] = rand_list[i]
            i += 1
            print(alist)
            if i == len(rand_list):
                return


fifo()