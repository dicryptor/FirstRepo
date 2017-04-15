
mem_block = [400, 350, 300, 210]
processes = [200, 300, 250, 100]
best_fit = []


def create_best_fit():
    """ Programmatically create best fit list """
    global best_fit
    for i in range(len(mem_block)):
        best_fit.append(0)

def find_best_fit(alist,p):
    """ Find best fit for process """
    global best_fit
    remainders = alist

    while True:
        best_fit_pos = max([n for n in remainders if n < 0])
        if best_fit[remainders.index(best_fit_pos)] == 0:
            print('Process {} best fits in memory block {}\n'.format(p, remainders.index(best_fit_pos)))
            best_fit[remainders.index(best_fit_pos)] = p
            break
        else:
            print('Memory block {} if already filled. Finding another slot...'.format(remainders.index(best_fit_pos)))
            remainders.remove(best_fit_pos)


def process_processes():
    for i,p in enumerate(processes):
        print("Finding best fit for process number {} with value of {}".format(i+1, p))
        remainders = []
        for j in mem_block:
            remainder = p - j
            remainders.append(remainder)
        find_best_fit(remainders, p)



create_best_fit()
process_processes()
print('{:15}: {}'.format("Memory block", mem_block))
print('{:15}: {}'.format("Best fit", best_fit))
