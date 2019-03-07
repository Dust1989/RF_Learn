# -*- coding:UTF-8 -*-
# 求质数的三个方法
import time
import math

# 第一版本-常规方法-最慢
def check_prime_01(num):
    if num == 1:
        return 0
    for i in range(2,num):
        if num % i == 0:
            return 0
    return 1

# 第二版本-对重复的除数进行筛减
def check_prime_02(num):
    if num == 1:
        return 0
    max_divisor = math.floor(math.sqrt(num))
    for i in range(2, max_divisor+1):
        if num % i == 0:
            return 0
    return 1
# 第三版本-在第而版本的基础上去除偶数
def check_prime_03(num):
    if num == 1:
        return 0
    if num == 2:
        return 1
    if num > 2 and num % 2 == 0:
        return 0
    max_divisor = math.floor(math.sqrt(num))
    for i in range(3, max_divisor, 2):
        if num % i == 0:
            return 0
    return 1

def list_prime_num(num):
    nums = []
    for i in range(1, num+1):
        if check_prime_03(i):
            nums.append(i)
    return nums

def run_fun(num):
    for i in range(1, num+1):
        check_prime_01(i)

t0 = time.time()
#print(len(list_prime_num(10000000)))
#print(list_prime_num(10000000))
run_fun(10000000)
t1 = time.time()
print('Time required: ',t1 -t0)