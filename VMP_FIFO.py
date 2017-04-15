import queue
import random

rand_list = random.sample(range(100), 6) # Random numbers to test VMP
my_queue = queue.Queue(maxsize=4) # FIFO store simulate 4 pages

print('List of items: ', rand_list)
for i in rand_list:
    if my_queue.full():
        print('Queue is full remove first item {} '.format(my_queue.get()))
    print('Placing {} in queue'.format(i))
    my_queue.put(i)

print('\nFinal items in queue...')
while not my_queue.empty():
    print(my_queue.get())