import cv2
import numpy as np
import ctypes
import struct


# Ham chuyen so decimal sang so hexa floating point
def dec2hex_fp(x):
    if (x != 0):
        return hex(ctypes.c_uint.from_buffer(ctypes.c_float(x)).value)[2:]  # bo ki tu 0x o dau chuoi hex
    else: 
        return '00000000'


def dec2bin(x):
    if x == 0:
        tempp = '00000000000000000000000000000000'
    else:
        tempp = bin(ctypes.c_uint.from_buffer(ctypes.c_float(x)).value)[2:]
        if (len(tempp) < 32):
            pad = 32 - len(tempp)
            for i in range(pad):
                tempp = '0' + tempp
    return tempp

def hex2dec(x):
    if (x == "xxxxxxxx"):
        return 2**32
    else:
        return struct.unpack('!f', bytes.fromhex(x))[0]

# img = cv2.imread('/v_env/ce434/W2/pypic.png')
####### Doc data image dau vao
input = []
# with open('E:\LAB\LAB_20_21_HK_II\CE434-ChuyenDeTKVM\git_vgg16\VGG16\CodePythonCNN\data_mult_decimal.txt') as f:
with open('/home/truong/Desktop/BT-Tuan10/data_fp_mult_555.txt') as f:
    if f.mode == 'r':
        data = f.readlines()
        for line in data:
            if (line.find("//") == -1):
                temp = line[:-1]
                input.append(hex2dec(temp))
f.close()

########## Doc ket qua modelsim ##########
pixels = []
# with open("E:/LAB/LAB_20_21_HK_II/CE434-ChuyenDeTKVM/git_vgg16/VGG16/CodePythonCNN/modelsim_out_floating_point.txt") as file:
with open("/home/truong/Desktop/BT-Tuan10/modelsim_mult_555.txt") as file:
    if file.mode == 'r':
        data = file.readlines()
        for line in data:
            if (line.find("//") == -1):
                pixels.append(line)
file.close()


############ Tinh do sai lech ###############
correct = 0
fault = []
error = 0.0
max_err = 0.0
min_err = 0.0
py_error = 0.0
py_max_err = 0.0
py_min_err = 0.0
for i in range(0, len(input), 2):
    # mult_py = float(input[i]) + float(input[i+1])
    mult_py = float(input[i]) * float(input[i+1])

    bin_mult_py = dec2bin(mult_py)

    hex_mult_sim = pixels[i//2][:-1]    # chu y file out modelsim co ki tu \n nen can loai bo
    dec_mult_sim = hex2dec(hex_mult_sim)
    bin_mult_sim = dec2bin(dec_mult_sim)
    # print('{0}\t{1}\t{2}'.format(i+1, hex_mult_py, hex_mult_sim))

    if (bin_mult_py[0:9] == bin_mult_sim[0:9]):

        error = 0.0
        for j in range (9, 32, 1):
            if bin_mult_py[j] > bin_mult_sim[j]:
                error += 2**(8 - j)
            elif bin_mult_py[j] < bin_mult_sim[j]:
                error -= 2**(8 - j)
        error = abs(error)
        
    else:
        fault.append(i)
        # print(bin_mult_py, " <> " ,bin_mult_sim)
        # py_error = abs(mult_py - dec_mult_sim)
        # continue

    py_error = abs(mult_py - dec_mult_sim)

    if (i == 0):
        max_err = error
        min_err = error
        py_max_err = py_error
        py_min_err = py_error
    else:
        if (error > max_err):
            max_err = error
        if (error < min_err):
            min_err = error

        if (py_error > py_max_err):
            py_max_err = py_error
        if (py_error < py_min_err):
            py_min_err = py_error
        
    if (bin_mult_py == bin_mult_sim):
        correct += 1
    #     print(i, bin_mult_py, " == " ,bin_mult_sim)
    # else:
    #     print(i, bin_mult_py, " <> " ,bin_mult_sim)
        

print('So phep tinh chinh xac: ', correct)
print('So phep tinh gan dung: ', len(pixels) - correct - len(fault))
print('So phep tinh sai: ', len(fault))
print('Do sai lech phep tinh GAN DUNG modelsim vs python: max = {0}, min = {1}'.format(max_err, min_err))
print('Do sai lech modelsim vs python: max = {0}, min = {1}'.format(py_max_err, py_min_err))


for i in range(len(fault)):
    print('{0}   \t{1}   \t{2}'.format(fault[i], dec2hex_fp(float(input[fault[i]]) * float(input[fault[i]+1])) , pixels[fault[i]//2][:-1] ))




# ############ Tinh do sai lech ###############
# correct = 0
# fault = []
# error = 0.0
# # max = min = int(input[0]) * int(input[1]) - int(struct.unpack('!f', bytes.fromhex(pixels[0]))[0])
# # max = min = float(input[0]) * float(input[1]) - float(struct.unpack('!f', bytes.fromhex(pixels[0]))[0])
# max_err = 0.0
# min_err = 0.0
# for i in range(0, len(input), 2):

#     mult_py = float(input[i]) + float(input[i+1])    
    
#     hex_mult_py = dec2hex_fp(mult_py)
#     hex_mult_sim = pixels[i//2][:-1]    # chu y file out modelsim co ki tu \n nen can loai bo
#     print('{0}\t{1}\t{2}'.format(i+1, hex_mult_py, hex_mult_sim))

#     if (hex_mult_py[0:5] == hex_mult_sim[0:5]):
#         sub = int(hex_mult_py[5:8], 16) - int(hex_mult_sim[5:8], 16)
#         bin_sub = bin(sub)

#         error = 0.0
#         len_sub = len(bin_sub)
#         for j in range (len_sub):
#             if bin_sub[len_sub-1 - j] == '1':
#                 error += 2**(-23 + j)
#             elif bin_sub[len_sub-1 - j] == 'b':
#                 break
#     else:
#         fault.append(i)
#         continue

#     if (i == 0):
#         max_err = error
#         min_err = error
#     else:
#         if (error > max_err):
#             max_err = error
#         if (error < min_err):
#             min_err = error
        
#     if (hex_mult_py == hex_mult_sim):
#         correct += 1
