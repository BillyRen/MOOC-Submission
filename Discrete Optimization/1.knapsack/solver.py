#!/usr/bin/python
# -*- coding: utf-8 -*-

from collections import namedtuple
Item = namedtuple("Item", ['index', 'value', 'weight'])

def knapsack_dynamic(w, p, n, m, x):
    #计算optp[i][j]
    for i in range(1, n + 1):
        for j in range(1, m + 1):
            optp[i][j] = optp[i - 1][j]
            if (j >= w[i]) and (optp[i - 1][j - w[i]] + p[i] > optp[i - 1][j]):
                optp[i][j] = optp[i - 1][j - w[i]] + p[i]

    #递推装入背包的物体
    j = m
    for i in range(n, 0, -1):
        if optp[i][j] > optp[i - 1][j]:
            x[i-1] = True
            j = j - w[i]

    #返回最大价值
    v = optp[n][m]
    return v, x

def solve_it(input_data):
    # Modify this code to run your optimization algorithm

    # parse the input
    lines = input_data.split('\n')

    firstLine = lines[0].split()
    item_count = int(firstLine[0])
    capacity = int(firstLine[1])

    items = []

    for i in range(1, item_count+1):
        line = lines[i]
        parts = line.split()
        items.append(Item(i-1, int(parts[0]), int(parts[1])))

    # a trivial greedy algorithm for filling the knapsack
    # it takes items in-order until the knapsack is full

    value = 0
    weight = 0
    taken = [0]*len(items)

    #TODO: Transfer key into 2 lists
    value, taken = knapsack_dynamic(weight, value, item_count, capacity, taken)

    for item in items:
        if weight + item.weight <= capacity:
            taken[item.index] = 1
            value += item.value
            weight += item.weight

    '''
    #@TODO：尝试按照价值密度来写一个算法
    for i in range(1, item_count+1):
        line = lines[i]
        parts = line.split()
        items.append(Item(i-1, int(parts[0]), int(parts[1]), int(parts[0] / parts[1])))

    #sort using value / weight
    value = 0
    weight = 0
    taken = [0] * len(items)
    '''

    # prepare the solution in the specified output format
    output_data = str(value) + ' ' + str(0) + '\n'
    output_data += ' '.join(map(str, taken))
    return output_data


import sys

if __name__ == '__main__':
    if len(sys.argv) > 1:
        file_location = sys.argv[1].strip()
        input_data_file = open(file_location, 'r')
        input_data = ''.join(input_data_file.readlines())
        input_data_file.close()
        print solve_it(input_data)
    else:
        print 'This test requires an input file.  Please select one from the data directory. (i.e. python solver.py ./data/ks_4_0)'

