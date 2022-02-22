# import h5py
import numpy as np
import struct
import ctypes
from tensorflow import keras

def float_to_bin(value):
  return ''.join('{:0>8b}'.format(c) for c in struct.pack('!f', value))


# Ham chuyen so decimal sang so hexa floating point
def dec2hex_fp(x):
    if (x != 0):
        return hex(ctypes.c_uint.from_buffer(ctypes.c_float(x)).value)[2:]  # bo ki tu 0x o dau chuoi hex
    else: 
        return '00000000'



# load model
model_done = keras.models.load_model("/home/truong/Downloads/model_optimal.h5")
print()


# get filter, bias weights in conv layer
i = 0
for layer in model_done.layers:
    if 'conv' not in layer.name:
        continue

    filters, biases = layer.get_weights()

    file_name = '_bias.txt'
    f_b = open('../Dataset/0_bias/' + layer.name + file_name, "w")
    for bias_weight in biases:
        f_b.writelines(dec2hex_fp(bias_weight)+'\n')
    f_b.close()

    for number_filter in range(filters.shape[3]):
        for channel in range(filters.shape[2]):
            file_name =  layer.name + '_filter_' + str(number_filter) + '_channel_' + str(channel) +  '.txt'
            f_f = open('../Dataset/1_weight/' + file_name, 'w')
            for h in range(filters.shape[0]):
                for w in range(filters.shape[1]):
                    f_f.writelines(dec2hex_fp(filters[h, w, channel, number_filter])+'\n')
            f_f.close()


# get filter, bias weights in dense layer
for layer_dense in model_done.layers:
    if 'sigmoid' not in layer_dense.name:
        continue

    filters, bias = layer_dense.get_weights()

    file_name = '_bias.txt'
    f_b = open('../Dataset/2_dense/' + layer_dense.name + file_name, "w")
    for bias_weight in bias:
        f_b.writelines(dec2hex_fp(bias_weight)+'\n')
    f_b.close()

    file_name = '_bias.txt'
    f_f = open('../Dataset/2_dense/' + layer_dense.name + '_filter.txt', 'w')
    for h in range (filters.shape[0]):
        for w in range (filters.shape[1]):
            f_f.writelines(dec2hex_fp(filters[h][w])+'\n')
    f_f.close()

print('All Doneeeee')


        


    