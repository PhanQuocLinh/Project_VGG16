import cv2
import numpy as np
import ctypes
import struct
import time


# Ham tao ma tran numpy ngau nhien. VD: a = create_rand_matrix(1, (200, 200, 3))
## mode = 0:    tao ra ma tran int khac nhau trong moi lan chay lai
## mode = 1:    chi tao 1 kieu ma tran duy nhat trong moi lan chay lai
## else:        tao ra ma tran float khac nhau trong moi lan chay lai
def create_rand_matrix(mode, dim, random = 2021):
    if mode == 0:
        img = np.uint8(np.random.random((dim))*255)
    elif mode == 1:
        rand_array = np.random.RandomState(random)
        size_matrix = 1
        for item in dim:
            size_matrix *= item
        # img = np.uint8(rand_array.randint(0, 20, size = size_matrix)).reshape(dim)
        img = rand_array.randint(0, 4, size = size_matrix).reshape(dim)
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


# Ham tinh conv2d tren 1 kernel 1 channel
def conv2d_single(img, filter):
    h, w = img.shape[:2]
    sobel_matrix = np.zeros((h-2, w-2)) ######
    
    for i in range(1, h-1):
        for j in range(1, w-1):
            sum = np.sum(img[i-1 : i+2, j-1 : j+2] * filter)
            sobel_matrix[i-1, j-1] = sum

    return sobel_matrix  


# Ham tinh conv3d tren 1 kernel n channel
def conv3d_single(img, filter, bias):
    h, w, d = img.shape
    sobel_matrix = np.zeros((h-2, w-2)) ######

    for i in range(1, h-1):
        for j in range(1, w-1):
            sum = np.sum(img[i-1 : i+2, j-1 : j+2] * filter)
            sobel_matrix[i-1, j-1] = sum + bias

    return sobel_matrix


# Ham tinh conv3d tren m kernel n channel
def conv3d_multi(img, num_channel_out = 8, weight_name = '', bias_name = ''):
    ############ PYTHON convolution ###############
    if (len(img.shape) == 2):
        #----------------- PYTHON conv2d tren anh dau vao 1 channel #-----------------
        # Lay thong tin anh img
        h, w = img.shape[:2]
        # Thuc hien padding cho ma tran img 
        img_padding = np.zeros((h+2, w+2))
        img_padding[1:h+1, 1:w+1] = img[:, :]
    
        # Filer Gx
        filter_Gx = np.array(
            [[  1,  1.1,  1],
            [   0,    0,  0],
            [  -1, -1.1, -1]])

        # Sobel Gx
        out_Gx = conv2d_single(img_padding, filter_Gx)

    else:
        #----------------- PYTHON conv3D tren anh dau vao n Channel #-----------------
        # Lay thong tin anh img
        h, w, num_channel_in = img.shape
        # Thuc hien padding cho ma tran img 
        img_padding = np.zeros((h+2, w+2, num_channel_in))
        img_padding[1:h+1, 1:w+1, :] = img[:, :, :]

        out_Gx = np.zeros((h, w, num_channel_out))

        # ------- Doc cac file trong so WEIGHT
        for kernel in range(num_channel_out):
            filter_Gx = np.zeros((3, 3, num_channel_in))
            filter_dim = filter_Gx.shape

            for channel in range(filter_dim[2]):
                # # weight_name = 'block1_conv1_3chanel_8filter_channel_{0}filter_{1}.txt'.format(channel, kernel)
                # # EX-open
                # with open('../Data/1_weight/' + weight_name.format(channel, kernel)) as f:

                # NEW-open
                with open('../Dataset/1_weight/' + weight_name.format(channel, kernel)) as f:
                    if f.mode == 'r':
                        data = f.readlines()
                        # print(type(data))
                        for h in range(filter_dim[0]):
                            for w in range(filter_dim[1]):
                                temp = data[h*filter_dim[1] + w][:-1]
                                # filter_Gx[h, w, channel] = hex2dec(bin2hex(temp))

                                filter_Gx[h, w, channel] = hex2dec(temp)
                    else:
                        print("can't read file" + weight_name )
                f.close()

            # # ----- Doc file trong so BIAS
            # # bias_name = 'block1_conv1_3chanel_8filter_bias.txt'
            # # EX-open
            # with open('../Data/0_bias/' + bias_name) as f:
            # NEW-open
            with open('../Dataset/0_bias/' + bias_name) as f:
                if f.mode == 'r':
                    data_bias = f.readlines()
                else:
                    print("can't read file" + bias_name )
            f.close()

            # # EX
            # bias_weight = hex2dec(bin2hex(data_bias[kernel]))
            # NEW
            bias_weight = hex2dec(data_bias[kernel])


            out_Gx[:, :, kernel] = conv3d_single(img_padding, filter_Gx, bias_weight)

    return out_Gx


# Ham doc data dau vao cho CONV PYTHON
def read_data_4conv_py(img_dim, file_name):
    img = np.zeros(img_dim)

    if (len(img_dim) == 2):
        #----------------- Doc data dau vao cho conv2D PYTHON -----------------
        with open(file_name) as f:
            if f.mode == 'r':
                data = f.readlines()
                for h in range(img_dim[0]):
                    for w in range(img_dim[1]):
                        temp = data[h*img_dim[1] + w][:-1]
                        img[h, w] = hex2dec(temp)
            else:
                print("can't read file" + file_name )
        f.close()
    else:
        # #----------------- Doc data dau vao cho conv3D PYTHON -----------------
        for i in range(img_dim[2]):
            # file_name = '../Data/' +  'data_fp_image_channel_00{0}.txt'.format(i)
            with open(file_name.format(i)) as f:
                if f.mode == 'r':
                    data = f.readlines()
                    # print(type(data))
                    for h in range(img_dim[0]):
                        for w in range(img_dim[1]):
                            temp = data[h*img_dim[1] + w][:-1]
                            img[h, w, i] = hex2dec(temp)
                else:
                    print("can't read file" + file_name )
            f.close()
    
    return img


# Ham doc data out CONV MODELSIM
def read_data_4conv_sim(sim_dim, file_name):
    sim = np.zeros(sim_dim)

    if (len(sim_dim) == 2):       
        # #----------------- Doc ket qua 2D #-----------------        
        with open(file_name) as f:
            if f.mode == 'r':
                data = f.readlines()
                for h in range(sim_dim[0]):
                    for w in range(sim_dim[1]):
                        # # OLD
                        # temp = data[3 + h*sim_dim[1] + w][:-1]
                        # # NEW
                        temp = data[h*sim_dim[1] + w][:-1]

                        sim[h, w] = hex2dec(temp)
            else:
                print("can't read file" + file_name )
        f.close()
    else:
        #----------------- Doc ket qua 3D #-----------------
        for kernel in range(sim_dim[2]):
            # file_name = '../Data/' +  'modelsim_block1_conv1_00{0}.txt'.format(kernel)
            with open(file_name.format(kernel)) as f:
                if f.mode == 'r':
                    data = f.readlines()
                    for h in range(sim_dim[0]):
                        for w in range(sim_dim[1]):
                            # # EX
                            # temp = data[3 + h*sim_dim[1] + w][:-1]
                            # # NEW
                            temp = data[h*sim_dim[1] + w][:-1]

                            sim[h, w, kernel] = hex2dec(temp)
                else:
                    print("can't read file" + file_name )
            f.close()

    return sim


# Ham tinh max pooling
def max_pooling(img):
    if len(img.shape) == 2:
        h, w = img.shape[:2]
        max_pool = np.zeros((h//2, w//2))

        for i in range(0, h-1, 2):
            for j in range(0, w-1, 2):
                max_pool[i//2, j//2] = np.max(img[ i: i+2, j: j+2])

    else:
        h, w, d = img.shape
        max_pool = np.zeros((h//2, w//2, d))

        for i in range(0, h-1, 2):
            for j in range(0, w-1, 2):
                for k in range(d):
                    max_pool[i//2, j//2, k] = np.amax(img[ i: i+2, j: j+2, k])
                # a = np.amax()
    return max_pool


# Ham RELU activation
def relu_activation(img):
    img[np.where(img < 0)] = 0
    return img


# Ham flatten
def flatten(img):
    return img.reshape(img.shape[2] * img.shape[1] * img.shape[0])


# Ham sigmoid 
def sigmoid(x):
    # sig = np.where(x < 0, np.exp(x)/(1 + np.exp(x)), 1/(1 + np.exp(-x)))
    sig = np.where(x < 0, np.exp(x)/(1 + np.exp(x)), 1./(1 + np.exp(-x)))

    return sig


# Ham fully connected sigmoid activation
def sigmoid_activation(img, weight_name = '', bias_name = ''):
    filter = np.zeros((img.shape[0]))
    with open('../Dataset/2_dense/' + weight_name) as f:
        if f.mode == 'r':
            data = f.readlines()
            for i in range(img.shape[0]):
                filter[i] = hex2dec(data[i][:-1]) 
        else:
            print("can't read file" + weight_name )
    f.close()

    # ----- Doc file trong so BIAS
    # bias_name = 'block1_conv1_3chanel_8filter_bias.txt'
    with open('../Dataset/2_dense/' + bias_name) as f:
        if f.mode == 'r':
            data_bias = f.readlines()
        else:
            print("can't read file" + bias_name )
    f.close()


    bias = hex2dec(data_bias[0][:-1]) 

    out = np.sum(img * filter) + bias
    out_fc = out.astype(np.float128)

    # print('gia tri fc = ', out)
    out = sigmoid(out_fc)
    # print('gia tri sigmoid = ', out)
    return out, out_fc


# Ham predict
def predict(x, threshold = 0.5):
    if x > threshold:
        img_class = 1
    else:
        img_class = 0
    return img_class


# Ham check function cua MODELSIM vs PYTHON
def verify_function(out_Gx, sim):
    if (len(sim.shape) == 2):  # ------- Verify Anh dau vao 2D
        correct = 0
        fault = []
        error = 0.0
        max_err = 0.0
        min_err = 0.0
        py_error = 0.0
        py_max_err = 0.0
        py_min_err = 0.0

        h2, w2 = out_Gx.shape[:2]
        for i in range (h2):
            for j in range (w2):        
                bin_conv_py = dec2bin(out_Gx[i, j])

                # hex_conv_sim = sim[i*w2 + j][:-1]    # chu y file out modelsim co ki tu \n nen can loai bo
                dec_conv_sim = sim[i, j]
                bin_conv_sim = dec2bin(dec_conv_sim)
                # print('{0}\t{1}\t{2}'.format(i, hex_conv_py, hex_conv_sim))

                py_error = abs(out_Gx[i, j] - dec_conv_sim)
                if (py_error < 2.0):
                    error = 0.0

                    for k in range (1, 32, 1):
                        if bin_conv_py[k] > bin_conv_sim[k]:
                            error += 2**(8 - k)
                        elif bin_conv_py[k] < bin_conv_sim[k]:
                            error -= 2**(8 - k)
                    error = abs(error)
                else:
                    fault.append((i, j))
                    # error = abs(out_Gx[i][j] - hex2dec(hex_conv_sim))
                    # continue


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
                    
                if (bin_conv_py == bin_conv_sim):
                    correct += 1

        print('\nSo phep tinh chinh xac: ', correct)
        print('So phep tinh gan dung: ', h2 * w2 - correct - len(fault))
        print('So phep tinh sai: ', len(fault))
        print('Do sai lech phep tinh GAN DUNG modelsim vs python: max = {0}, min = {1}'.format(max_err, min_err))
        print('Do sai lech modelsim vs python: max = {0}, min = {1}'.format(py_max_err, py_min_err))
    
        # for i in range(len(fault)):
        #     print('{0}   \t{1}   \t{2}'.format(fault[i], dec2hex_fp(out_Gx[fault[i]]) , sim[fault[i]]))

    else:   # ------- Verify Anh dau vao 3D
        for kernel in range(sim.shape[2]):
            correct = 0
            fault = []
            error = 0.0
            max_err = 0.0
            min_err = 0.0
            py_error = 0.0
            py_max_err = 0.0
            py_min_err = 0.0

            h2, w2 = out_Gx.shape[0:2]
            for i in range (h2):
                for j in range (w2):        
                    bin_conv_py = dec2bin(out_Gx[i, j, kernel])

                    # hex_conv_sim = sim[i*w2 + j][:-1]    # chu y file out modelsim co ki tu \n nen can loai bo
                    dec_conv_sim = sim[i, j, kernel]
                    bin_conv_sim = dec2bin(dec_conv_sim)
                    # print('{0}\t{1}\t{2}'.format(i, hex_conv_py, hex_conv_sim))

                    py_error = abs(out_Gx[i, j, kernel] - dec_conv_sim)
                    if (py_error < 2.0):
                        error = 0.0

                        for k in range (1, 32, 1):
                            if bin_conv_py[k] > bin_conv_sim[k]:
                                error += 2**(8 - k)
                            elif bin_conv_py[k] < bin_conv_sim[k]:
                                error -= 2**(8 - k)
                        error = abs(error)
                    else:
                        fault.append((i, j))
                        # error = abs(out_Gx[i][j] - hex2dec(hex_conv_sim))
                        # continue


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
                        
                    if (bin_conv_py == bin_conv_sim):
                        correct += 1
            
            print('\nKernel ', kernel)
            print('So phep tinh chinh xac: ', correct)
            print('So phep tinh gan dung: ', h2 * w2 - correct - len(fault))
            print('So phep tinh sai: ', len(fault))
            print('Do sai lech phep tinh GAN DUNG modelsim vs python: max = {0}, min = {1}'.format(max_err, min_err))
            print('Do sai lech modelsim vs python: max = {0}, min = {1}'.format(py_max_err, py_min_err))

            # for i in range(len(fault)):
            #     print('{0}   \t{1}   \t{2}'.format(fault[i], dec2hex_fp(out_Gx[fault[i]]) , sim[fault[i]]))
    return


# Ham minh hoa ket qua tinh toan tren MODELSIM va PYTHON
def visualize(out_Gx, sim):
    # ############ Anh minh hoa conv MODELSIM ############
    sim_copy = sim.copy()
    sim_copy[np.where(sim_copy < 0)] = 0

    if (len(sim.shape) == 2):
        img_out = cv2.normalize(src=sim_copy, dst=None, alpha=0, beta=255, norm_type=cv2.NORM_MINMAX, dtype=cv2.CV_8U)
        cv2.imshow("SIM conv2d", img_out)    
        # cv2.imwrite("SIM_conv2d.jpg", img_out)

    else:
        for channel in range(sim.shape[2]):
            img_out = cv2.normalize(src=sim_copy[:, :, channel], dst=None, alpha=0, beta=255, norm_type=cv2.NORM_MINMAX, dtype=cv2.CV_8U)
            cv2.imshow("SIM_conv3d_channel_{0}".format(channel), img_out)    
            # cv2.imwrite("../Data/SIM_conv3d_channel_00{0}.jpg".format(channel), img_out)


    # ############ Anh minh hoa conv PYTHON ############
    out_Gx_copy = out_Gx.copy()
    out_Gx_copy[np.where(out_Gx_copy < 0)] = 0

    if (len(sim.shape) == 2):
        img_out = cv2.normalize(src=out_Gx_copy, dst=None, alpha=0, beta=255, norm_type=cv2.NORM_MINMAX, dtype=cv2.CV_8U)
        cv2.imshow("PYTHON conv2d", img_out)    
        # cv2.imwrite("PYTHON_conv2d.jpg", img_out)
    else:
        for channel in range(sim.shape[2]):
            img_out = cv2.normalize(src=out_Gx_copy[:, :, channel], dst=None, alpha=0, beta=255, norm_type=cv2.NORM_MINMAX, dtype=cv2.CV_8U)
            cv2.imshow("PYTHON_conv3d_channel_{0}".format(channel), img_out)    
            # cv2.imwrite("../Data/PYTHON_conv3d_channel_00{0}.jpg".format(channel), img_out)

    cv2.waitKey(0)
    cv2.destroyAllWindows()
    return


# ######################################################
#                         MAIN 
# ######################################################
if __name__ == "__main__":

    # # ############ Read data ############
    # # file_name = '../Data/3_data_in/data_fp_image_daisy_02_channel_00{0}.txt'     #?????????????
    # file_name = '../Data/3_data_in/data_fp_image_channel_00{0}.txt'     #?????????????
    
    
    # img_dim = (56, 56, 3)
    # # file_name = '../Data/data_fp_image_channel_002.txt'
    # # img_dim = (56, 56)
    # img = read_data_4conv_py(img_dim, file_name)
    start = time.time()

    MAX_FC = 0
    MIN_FC = 0

    pass_sun = 0
    pass_daisy = 0
    fault = []

    # image_name = "sun_{}.jpg"        #Edit here
    image_name = "daisy_{}.jpg"        #Edit here

    if 'daisy' in image_name:
        N = 124
        dir = '../Dataset/Flower/dir_daisy_image/'
    elif 'sun' in image_name:
        N = 101
        dir = '../Dataset/Flower/dir_sun_image/'
    
    for i in range(N):

            file_name = image_name.format(i)

            # img = cv2.imread('../Data/5_image/' + file_name)
            img = cv2.imread(dir + file_name)


            img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
            img = cv2.resize(img, (56, 56))
            
            # # ############ NORMALIZE ############
            img = img /255        # Edit here

            # ############ BUILD MODEL ############
            # ############ BLOCK 1 ############
            # # conv1
            weight_name = 'block1_conv1_filter_{1}_channel_{0}.txt'
            bias_name = 'block1_conv1_bias.txt'
            out_Gx = conv3d_multi(img, weight_name = weight_name, bias_name = bias_name)
            # print(out_Gx.shape)

            # # conv2
            weight_name = 'block1_conv2_filter_{1}_channel_{0}.txt'
            bias_name = 'block1_conv2_bias.txt'
            out_Gx = conv3d_multi(out_Gx, weight_name = weight_name, bias_name = bias_name)
            # print(out_Gx.shape)
            # # conv2_relu
            out_Gx = relu_activation(out_Gx)

            # # max_pooling_0
            out_Gx = max_pooling(out_Gx)
            # print(out_Gx.shape)
            # #################################


            # ############ BLOCK 2 ############
            # # conv1
            weight_name = 'block2_conv1_filter_{1}_channel_{0}.txt'
            bias_name = 'block2_conv1_bias.txt'
            out_Gx = conv3d_multi(out_Gx, weight_name = weight_name, bias_name = bias_name)
            # print(out_Gx.shape)

            # # conv2
            weight_name = 'block2_conv2_filter_{1}_channel_{0}.txt'
            bias_name = 'block2_conv2_bias.txt'
            out_Gx = conv3d_multi(out_Gx, weight_name = weight_name, bias_name = bias_name)
            # print(out_Gx.shape)
            # # conv2_relu
            out_Gx = relu_activation(out_Gx)

            # # max_pooling_0
            out_Gx = max_pooling(out_Gx)
            # print(out_Gx.shape)
            # #################################


            # ############ BLOCK 3 ############
            # # conv1
            weight_name = 'block3_conv1_filter_{1}_channel_{0}.txt'
            bias_name = 'block3_conv1_bias.txt'
            out_Gx = conv3d_multi(out_Gx, weight_name = weight_name, bias_name = bias_name)
            # print(out_Gx.shape)

            # # conv2
            weight_name = 'block3_conv2_filter_{1}_channel_{0}.txt'
            bias_name = 'block3_conv2_bias.txt'
            out_Gx = conv3d_multi(out_Gx, weight_name = weight_name, bias_name = bias_name)
            # print(out_Gx.shape)

            # # conv3
            weight_name = 'block3_conv3_filter_{1}_channel_{0}.txt'
            bias_name = 'block3_conv3_bias.txt'
            out_Gx = conv3d_multi(out_Gx, weight_name = weight_name, bias_name = bias_name)
            # print(out_Gx.shape)
            # # conv3_relu
            out_Gx = relu_activation(out_Gx)

            # # max_pooling_0
            out_Gx = max_pooling(out_Gx)
            # print(out_Gx.shape)
            # #################################


            # ############ BLOCK 4 ############
            # # conv1
            weight_name = 'block4_conv1_filter_{1}_channel_{0}.txt'
            bias_name = 'block4_conv1_bias.txt'
            out_Gx = conv3d_multi(out_Gx, num_channel_out = 16, weight_name = weight_name, bias_name = bias_name)
            # print(out_Gx.shape)

            # # conv2
            weight_name = 'block4_conv2_filter_{1}_channel_{0}.txt'
            bias_name = 'block4_conv2_bias.txt'
            out_Gx = conv3d_multi(out_Gx, num_channel_out = 16, weight_name = weight_name, bias_name = bias_name)
            # print(out_Gx.shape)

            # # conv3
            weight_name = 'block4_conv3_filter_{1}_channel_{0}.txt'
            bias_name = 'block4_conv3_bias.txt'
            out_Gx = conv3d_multi(out_Gx, num_channel_out = 16, weight_name = weight_name, bias_name = bias_name)
            # print(out_Gx.shape)
            # # conv3_relu
            out_Gx = relu_activation(out_Gx)

            # # max_pooling_0
            out_Gx = max_pooling(out_Gx)
            # print(out_Gx.shape)
            # #################################


            # ############ BLOCK 5 ############
            # # conv1
            weight_name = 'block5_conv1_filter_{1}_channel_{0}.txt'
            bias_name = 'block5_conv1_bias.txt'
            out_Gx = conv3d_multi(out_Gx, num_channel_out = 16, weight_name = weight_name, bias_name = bias_name)
            # print(out_Gx.shape)
            # # conv1_relu
            out_Gx = relu_activation(out_Gx)

            # # conv2
            weight_name = 'block5_conv2_filter_{1}_channel_{0}.txt'
            bias_name = 'block5_conv2_bias.txt'
            out_Gx = conv3d_multi(out_Gx, num_channel_out = 16, weight_name = weight_name, bias_name = bias_name)
            # print(out_Gx.shape)
            # # conv2_relu
            out_Gx = relu_activation(out_Gx)

            # # conv3
            weight_name = 'block5_conv3_filter_{1}_channel_{0}.txt'
            bias_name = 'block5_conv3_bias.txt'
            out_Gx = conv3d_multi(out_Gx, num_channel_out = 16, weight_name = weight_name, bias_name = bias_name)
            # print(out_Gx.shape)
            # # conv3_relu
            out_Gx = relu_activation(out_Gx)

            # # max_pooling_0
            out_Gx = max_pooling(out_Gx)
            # print(out_Gx.shape)
            # #################################


            # ############ FLATTEN ############
            out_Gx = flatten(out_Gx)
            # print(out_Gx.shape)


            # ############  DENSE  ############
            weight_name = 'sigmoid_filter.txt'
            bias_name = 'sigmoid_bias.txt'
            out, out_fc = sigmoid_activation(out_Gx, weight_name = weight_name, bias_name = bias_name)

            if i == 0:
                MAX_FC = out_fc
                MIN_FC = out_fc
            else:
                if out_fc > MAX_FC:
                    MAX_FC = out_fc
                if out_fc < MIN_FC:
                    MIN_FC = out_fc

            # ############ PREDICT ############
            # print()
            y_pred = predict(out)
            # if y_pred == 0:
            #     print(y_pred, 'This is Daisy flower')
            # else:
            #     print(y_pred, 'This is Sun flower')

            if ('sun' in file_name):
                if (y_pred == 1):
                    pass_sun += 1
                else:
                    fault.append(i)
            elif ('daisy' in file_name):
                if (y_pred == 0):
                    pass_daisy += 1
                else:
                    fault.append(i)


    if 'daisy' in image_name:
        print('\n\nSo lan du doan dung dasisy flower: {0}/{1} = {2}'.format(pass_daisy, i+1, float(pass_daisy)/(i+1)))
    elif 'sun' in image_name:
        print('\n\nSo lan du doan dung sun flower: {0}/{1} = {2}'.format(pass_sun, i+1, float(pass_sun)/(i+1)))

    print('\nCac vi tri du doan sai:', fault)


    print('\nMAX FC = {0}, MIN FC = {1}'.format(MAX_FC, MIN_FC))

    finish = time.time()

    print('\nElapsed time = ', finish - start)




