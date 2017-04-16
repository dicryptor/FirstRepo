import time
import random

rand_list = [random.randint(0, 10) for x in range(1, random.randrange(1, 20))] # Random numbers to test VMP
print(rand_list)
first_loop = [1, 2, 3, 1, 4, 5]
mem_slots = [[-1,-1],[-1,-1],[-1,-1]]


def insert_mem_slots(alist):
    global mem_slots

    for i in alist:
        # print('\ni =', i)
        time.sleep(0.5)
        epoch_time = time.time()
        time_calc = []
        for slot, val in enumerate(mem_slots):
            # print('\nSlot: ', slot, 'Value: ', val)
            if val[1] == -1:
                # print('Slot {} is empty, have at it!'.format(slot))
                mem_slots[slot] = [epoch_time, i]
                break
            elif i == val[1]:
                # print(i, 'is already in slot, ', slot)
                val[0] = epoch_time
                break
            else:
                # print(i, 'is not in slot, ', slot)
                time_calc.append(val[0])

        if len(time_calc) == len(mem_slots):
            # print('For time calc: ', time_calc)
            index = time_calc.index(min(time_calc))
            mem_slots[index] = [epoch_time, i]
        print(mem_slots)


insert_mem_slots(rand_list)
