# Chuong trinh python dung de tao data_input cho modelsim

import cv2
import numpy as np
import ctypes
# import math
import struct

# Ham tao ma tran numpy ngau nhien. VD: a = create_rand_matrix(1, (200, 200, 3))
## mode = 0:    tao ra ma tran int khac nhau trong moi lan chay lai
## mode = 1:    chi tao 1 kieu ma tran duy nhat trong moi lan chay lai
## else:        tao ra ma tran float khac nhau trong moi lan chay lai
def create_rand_matrix(mode, dim):
    if mode == 0:
        img = np.uint8(np.random.random((dim))*255)
    elif mode == 1:
        rand_array = np.random.RandomState(2021)
        size_matrix = 1
        for item in dim:
            size_matrix *= item
        # img = np.uint8(rand_array.randint(0, 20, size = size_matrix)).reshape(dim)
        img = rand_array.randint(-255, 255, size = size_matrix).reshape(dim)
    else:
        img = np.random.uniform(low = -255, high = 255, size = dim)
    return img


# Ham chuyen so decimal sang so hexa floating point
def dec2hex_fp(x):
    if (x != 0):
        return hex(ctypes.c_uint.from_buffer(ctypes.c_float(x)).value)[2:]  # bo ki tu 0x o dau chuoi hex
    else: 
        return '00000000'


# Ham chuyen so decimal sang so binary
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


# Ham chuyen so hexa sang so binary
def hex2dec(x):
    if (x == "xxxxxxxx"):
        return 2**32
    else:
        return struct.unpack('!f', bytes.fromhex(x))[0]


# Ham chuyen so binary sang so hexa
def bin2hex(input):
    return hex(int(input, 2))[2:]


def gen_multi_data(i_start, i_finish, file_name = '', set = 0):
    OUT_ARR = []
    for i in range(i_start, i_finish+1):
        f_name = file_name.format(i) 
        img_rgb = cv2.imread('../Dataset/Flower' + f_name)
        img_rgb = cv2.resize(img_rgb, (56, 56))
        img_rgb = cv2.cvtColor(img_rgb, cv2.COLOR_BGR2RGB)
        OUT_ARR.append(img_rgb)
    
    dim = img_rgb.shape

    for k in range(dim[2]):
        if 'daisy' in file_name:
            f_name = '{0}_data_daisy_00{1}.txt'.format(set, k)        # Edit here
        else:
            f_name = '{0}_data_sun_00{1}.txt'.format(set, k)        # Edit here

        f  = open('../Data/3_data_in/{0}_data/'.format(set) + f_name, 'w')

        for lap in range(0, i_finish - i_start+1):        
            for i in range (dim[0]):
                for j in range (dim[1]):
                    r = OUT_ARR[lap][i, j, k]
                    s = dec2hex_fp(r)
                    string = s + '\n'
                    f.write(string)
        f.close()
        # f2.close()
        print('File {0} has done!'.format(f_name))
    print('\nPLEASE UPDATE DIMENSION IN TESTBENCH & VERIFY: h = {0}, w = {1}'.format(dim[0], dim[1]))

    return





#------------------- MAIN #-------------------
if __name__ == "__main__":

    # file_name = '/dir_sun_image/sun_{0}.jpg'        # Edit here - dir to source image
    file_name = '/dir_daisy_image/daisy_{0}.jpg'        # Edit here - dir to source image

    START = 50                                      # Edit index start
    FINISH = 99                                     # Edit index finish
    SET = 7                                         # Edit index dataset

    print('\nCONVERT IMAGE {1} - {0}'.format(FINISH, START))
    gen_multi_data(i_start = START, i_finish = FINISH, file_name = file_name, set = SET)





# img_rgb = cv2.imread('../Data/5_image/' + file_name)
# img_rgb = cv2.resize(img_rgb, (56, 56))
# img_rgb = cv2.cvtColor(img_rgb, cv2.COLOR_BGR2RGB)

# # cv2.imshow('input56x56', img_rgb)
# # cv2.waitKey(0)
# # cv2.destroyAllWindows()
# # cv2.imwrite('../Data/5_image/daisy_02_56x56.jpg', img_rgb)    # CHI CHAY 1 LAN


# dim = img_rgb.shape
# print(dim)

# #------------------- Dung python tao data input cho modelsim #-------------------
# # ------- Ghi file Anh dau vao 3D
# for k in range(dim[2]):
#     f_name = file_name[:-4] + '_channel_00{0}.txt'.format(k)

#     f  = open('../Data/3_data_in/data_fp_' + f_name, 'w')
#     # f2 = open('../Data/3_data_in/data_dec_' + f_name, 'w')     # Edit here
#     for i in range (dim[0]):
#         for j in range (dim[1]):
#             r = img_rgb[i][j][k]
#             # f2.write(str(r) + '\n')    # Edit here
#             s = dec2hex_fp(r)
#             string = s + '\n'
#             f.write(string)
#     f.close()
#     # f2.close()        # Edit here
#     print('File {0} has done!'.format(f_name))
# print('\nPLEASE UPDATE DIMENSION IN TESTBENCH & VERIFY: h = {0}, w = {1}'.format(dim[0], dim[1]))


# # -------------- Tao file dimension.v --------------
# file_name = 'dimension.v'
# f  = open('../Verilog/rtl/' + file_name, 'w')
# string = "`define IMG_HEIGHT {0}\n`define IMG_WIDTH {1}".format(dim[0], dim[1])
# f.write(string)
# f.close()
# print('\nFile {0} has done!'.format(file_name))
