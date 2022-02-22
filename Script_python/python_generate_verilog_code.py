from jinja2 import Template
import numpy as np

def get_template_sample(file_name):
    with open(file_name, 'r', encoding='UTF-8') as file:
        if file.mode == 'r':
            data = file.read()
        else:
            print("can't read file" + file_name )
            return -1       
    file.close()
    return data

def save_report(content, file_name):
    with open(file_name, 'w', encoding='UTF-8') as file:
        if file.mode == 'w':
            file.write(content)
        else:
            print("can't save file" + file_name )
            return -1        
    file.close()

def bin2hex(input):
    return hex(int(input, 2))[2:]


# ######################################################
#             HELP FUNCTION GENERATE BLOCK 
# ######################################################
def create_port_block(num_kernel = 8, num_channel = 3):
    accumulate_str = ''''''
    accumulate_str += '''input\tclk,'''
    accumulate_str += '''\n\tinput\tresetn,'''
    accumulate_str += '''\n\tinput\tvalid_in,'''

    for c in range(num_channel):
        accumulate_str += '''\n\tinput\t[DATA_WIDTH-1:0]\tdata_in_{0},'''.format(c)

    for k in range(num_kernel):
            accumulate_str += '''\n\toutput\t[DATA_WIDTH-1:0]\tdata_out_{0},'''.format(k)

    accumulate_str += '''\n\toutput\tvalid_out,'''
    accumulate_str += '''\n\toutput\tdone'''
    return accumulate_str


def create_inst_block(num_kernel = 8, num_channel = 3, bias_name = '', weight_name = '', ins_name = 'block1_conv1'):
    accumulate_str = ''''''
    for k in range(num_kernel):
        accumulate_str += '''\n\tassign data_out_{0} = conv_out[{0}];'''.format(k)
        

    accumulate_str += '''\n\n\tconv3d_{0}_kernel_{1}_channel_size_3 #('''.format(num_kernel, num_channel)
    accumulate_str += '''\n\t\t.DATA_WIDTH(32),.IMG_WIDTH(WIDTH),.IMG_HEIGHT(HEIGHT),'''


    with open('../Dataset/0_bias/' + bias_name) as f:
        if f.mode == 'r':
            data_bias = f.readlines()
        else:
            print("can't read file" + bias_name)
    f.close()

    for kernel in range(num_kernel):
        for channel in range(num_channel):
            w_name = weight_name.format(channel, kernel)            
            
            with open('../Dataset/1_weight/' + w_name) as f1:
                if f1.mode == 'r':
                    data_weight = f1.readlines()
                else:
                    print("can't read file" + w_name )
            f1.close()

            accumulate_str += '''\n\t\t'''
            for weight in range(9):
                accumulate_str += '''.K{0}_C{1}_W{2}(32'h{3}), '''.format(kernel, channel, weight, data_weight[weight][:-1])

        
        if (kernel == num_kernel-1) and (channel == num_channel-1):
            accumulate_str += '''\n\t\t.K{0}_BIAS (32'h{1})\n\t\t)'''.format(kernel,data_bias[kernel][:-1])
        else:
            accumulate_str += '''\n\t\t.K{0}_BIAS (32'h{1}),\n'''.format(kernel,data_bias[kernel][:-1])

    accumulate_str += '''\n\t\t{0}('''.format(ins_name)


    accumulate_str += '''\n\t\t.clk(clk),'''
    accumulate_str += '''\n\t\t.resetn(resetn),'''
    accumulate_str += '''\n\t\t.data_valid_in(valid_in),'''

    for c in range(num_channel):
        accumulate_str += '''\n\t\t.data_in_{0}(data_in_{0}),'''.format(c)

    for k in range(num_kernel):
        accumulate_str += '''\n\t\t.data_out_conv_{0}(conv_out[{0}]),'''.format(k)

    accumulate_str += '''\n\t\t.valid_out_pixel(conv_valid_out),'''
    accumulate_str += '''\n\t\t.done(done_conv)\n\t\t);'''

    return accumulate_str
# ######################################################



# ######################################################
#          HELP FUNCTION GENERATE CONVOLUTION 
# ######################################################
def calc_num_delay(operands):
    stages = int(np.log2(operands))
    if(2**stages < operands):
        stages = stages + 1
    if(operands % 2 == 0):
        temp = operands
        num_delay = 0
        for i in range(stages-1):
            temp = int(temp>>1)
            if(temp % 2 == 1):
                num_delay = num_delay + 1
                temp = temp + 1
            #print(num_delay)
    else:
        temp = operands + 1
        num_delay = 1
        for i in range(stages-1):
            temp = int(temp>>1)
            if(temp % 2 == 1):
                num_delay = num_delay + 1
                temp = temp + 1
            #print(num_delay)
    return num_delay, stages


def content_assign_adder(operands):
    num_delay, stages = calc_num_delay(operands)
    # print('num delay {} num stage {}'.format(num_delay, stages))
    temp = operands
    delay_index = 0
    output_index = 0
    op_index = 0
    pre_odd = 0
    content = ''
    for i in range (stages):
        if(i == 0): # tang 1
            if(temp%2 == 0):
                for j in range (operands):
                    if (j %2 == 0 ):
                        content += "\n\tassign op_1["+ str(op_index) +"] = data_out_conv_kernel["+ str(j) +"];"
                    else:
                        content += "\n\tassign op_2["+ str(op_index) +"] = data_out_conv_kernel["+ str(j) +"];"
                        content += "\n\tassign valid_in_add["+ str(op_index) +"] = valid_out_conv_kernel[" + str(operands-1) + "];"
                        op_index = op_index + 1
                pre_odd = 0
            else:
                for j in range (operands-1):
                    if (j %2 == 0):
                        content += "\n\tassign op_1["+ str(op_index) +"] = data_out_conv_kernel["+ str(j) +"];"
                    else:
                        content += "\n\tassign op_2["+ str(op_index) +"] = data_out_conv_kernel["+ str(j) +"];"
                        content += "\n\tassign valid_in_add["+ str(op_index) +"] = valid_out_conv_kernel[" + str(operands-1) + "];"
                        op_index = op_index + 1
                content += "\n\tassign in_delay[" + str(delay_index) + "] = data_out_conv_kernel[" + str(operands-1) + "];"
                delay_index= delay_index+1
                temp=temp+1
                pre_odd=1
        else: #tang 2 > 
            temp = int(temp>>1)
            if(temp%2 == 0): # so day chan
                if(pre_odd == 1): #truoc do le
                    #print('#so day chan #truoc do le')
                    for j in range (temp-1):
                        if (j %2 == 0 ):
                            content += "\n\tassign op_1["+ str(op_index) +"] = output_add[" + str(output_index) + "];"
                            output_index = output_index + 1
                        else:
                            content += "\n\tassign op_2["+ str(op_index) +"] = output_add[" + str(output_index) + "];"
                            content += "\n\tassign valid_in_add["+ str(op_index) +"] = valid_out_add[" + str(output_index) + "];"
                            output_index = output_index + 1
                            op_index = op_index+1
                            #print(op_index)
                    content += "\n\tassign op_2["+ str(op_index) +"] = out_delay[" + str(delay_index-1) + "];"
                    content += "\n\tassign valid_in_add["+ str(op_index) +"] = valid_out_add[" + str(output_index-(operands>>i)) + "];"
                    op_index = op_index+1
                else: # truoc do chan
                    #print('#so day chan #truoc do chan')
                    for j in range (temp):
                        if (j %2 == 0 ):
                            content += "\n\tassign op_1["+ str(op_index) +"] = output_add[" + str(output_index) + "];"
                            output_index = output_index + 1
                        else:
                            content += "\n\tassign op_2["+ str(op_index) +"] = output_add[" + str(output_index) + "];"
                            content += "\n\tassign valid_in_add["+ str(op_index) +"] = valid_out_add[" + str(output_index) + "];"
                            output_index = output_index + 1
                            op_index=op_index+1
                pre_odd=0
            else: #so day le
                if(pre_odd == 1): #truoc do le
                    #print('#so day le #truoc do le')
                    for j in range (temp-1):
                        if (j %2 == 0 ):
                            content += "\n\tassign op_1["+ str(op_index) +"] = output_add[" + str(output_index) + "];"
                            output_index = output_index + 1
                        else:
                            content += "\n\tassign op_2["+ str(op_index) +"] = output_add[" + str(output_index) + "];"
                            content += "\n\tassign valid_in_add["+ str(op_index) +"] = valid_out_add[" + str(output_index) + "];"
                            output_index = output_index + 1
                            op_index=op_index+1
                    content += "\n\tassign in_delay[" + str(delay_index) + "] = out_delay[" + str(delay_index-1) + "];"
                    delay_index= delay_index+1
                else: # truoc do chan
                    #print('#so day le # truoc do chan')
                    for j in range (temp-1):
                        if (j %2 == 0 ):
                            content += "\n\tassign op_1["+ str(op_index) +"] = output_add[" + str(output_index) + "];"
                            output_index = output_index + 1
                        else:
                            content += "\n\tassign op_2["+ str(op_index) +"] = output_add[" + str(output_index) + "];"
                            content += "\n\tassign valid_in_add["+ str(op_index) +"] = valid_out_add[" + str(output_index) + "];"
                            output_index = output_index + 1
                            op_index=op_index+1
                    content += "\n\tassign in_delay[" + str(delay_index) + "] = output_add[" + str(output_index) + "];"
                    output_index = output_index + 1
                    delay_index= delay_index+1
                temp=temp+1
                pre_odd=1

    return content


def create_param_conv(form = 'single', num_kernel = 8, num_channel = 3):
    accumulate_str = ''''''
    
    if form == 'single':
        num_kernel = 1
        for channel in range(num_channel):   
            accumulate_str += '''\n\tparameter'''        
            for weight in range(9):
                accumulate_str += ''' C{0}_W{1} = 32'h0,'''.format(channel, weight)
        # if (channel == num_channel-1):
        accumulate_str += '''\n\tparameter BIAS  = 32'h0'''
        # else:
        #     accumulate_str += '''\n\tparameter BIAS  = 32'h0,\n'''


    elif form == 'multi':

        for kernel in range(num_kernel):
            for channel in range(num_channel):   
                accumulate_str += '''\n\tparameter'''        
                for weight in range(9):
                    accumulate_str += ''' K{0}_C{1}_W{2} = 32'h0,'''.format(kernel, channel, weight)
            if (kernel == num_kernel-1) and (channel == num_channel-1):
                accumulate_str += '''\n\tparameter K{0}_BIAS  = 32'h0'''.format(kernel)
            else:
                accumulate_str += '''\n\tparameter K{0}_BIAS  = 32'h0,\n'''.format(kernel)


        
    return accumulate_str


def create_port_conv(form = 'single', num_kernel = 8, num_channel = 3):
    accumulate_str = ''''''
    accumulate_str += '''input\tclk,'''
    accumulate_str += '''\n\tinput\tresetn,'''
    accumulate_str += '''\n\tinput\tdata_valid_in,'''

    for c in range(num_channel):
        accumulate_str += '''\n\tinput\t[DATA_WIDTH-1:0]\tdata_in_{0},'''.format(c)

    if form == 'single':
        num_kernel = 1
        accumulate_str += '''\n\toutput\t[DATA_WIDTH-1:0]\tdata_out,'''
    else:
        for k in range(num_kernel):
            accumulate_str += '''\n\toutput\t[DATA_WIDTH-1:0]\tdata_out_conv_{0},'''.format(k)

    accumulate_str += '''\n\toutput\tvalid_out_pixel,'''
    accumulate_str += '''\n\toutput\tdone'''
    return accumulate_str


def create_inst_conv(form = 'single', num_kernel = 8, num_channel = 3):
    accumulate_str = ''''''
    if form == 'single':
        for channel in range(num_channel):
            accumulate_str += '''\n\tconv2d_kernel_size_3 #('''
            accumulate_str += '''\n\t\t.DATA_WIDTH(32),.IMG_WIDTH(IMG_WIDTH),.IMG_HEIGHT(IMG_HEIGHT),'''
            
            for weight in range(9):
                if weight == 8:
                    accumulate_str += '''\n\t\t.kernelR{1}(C{0}_W{1})\n\t\t)'''.format(channel, weight)
                else:
                    accumulate_str += '''\n\t\t.kernelR{1}(C{0}_W{1}),'''.format(channel, weight)
            
            accumulate_str += '''\n\t\tconv2d_{0}('''.format(channel)
            accumulate_str += '''\n\t\t.clk(clk),'''
            accumulate_str += '''\n\t\t.resetn(resetn),'''
            accumulate_str += '''\n\t\t.data_valid_in(data_valid_in),'''
            
            accumulate_str += '''\n\t\t.data_in(data_in_{0}),'''.format(channel)
            accumulate_str += '''\n\t\t.data_out(data_out_conv_kernel[{0}]),'''.format(channel)
            accumulate_str += '''\n\t\t.valid_out_pixel(valid_out_conv_kernel[{0}]),'''.format(channel)
            accumulate_str += '''\n\t\t.done(done_conv[{0}])\n\t\t);'''.format(channel)
    
    else:
        for kernel in range(num_kernel):
            accumulate_str += '''\n\tconv3d_kernel_{0}_channel_size_3 #('''.format(num_channel)
            accumulate_str += '''\n\t\t.DATA_WIDTH(32),.IMG_WIDTH(IMG_WIDTH),.IMG_HEIGHT(IMG_HEIGHT),'''
            # accumulate_str += '''\n\t.DATA_WIDTH(32),.IMG_WIDTH(IMG_WIDTH),.IMG_HEIGHT(IMG_HEIGHT),'''

            for channel in range(num_channel):   
                # accumulate_str += '''\n\tparameter'''        
                for weight in range(9):
                    accumulate_str += '''\n\t\t.C{1}_W{2}(K{0}_C{1}_W{2}),'''.format(kernel, channel, weight)

            accumulate_str += '''\n\t\t.BIAS(K{0}_BIAS)\n\t\t)'''.format(kernel)
            accumulate_str += '''\n\t\tconv_{0}('''.format(kernel)
            
            accumulate_str += '''\n\t\t.clk(clk),'''
            accumulate_str += '''\n\t\t.resetn(resetn),'''
            accumulate_str += '''\n\t\t.data_valid_in(data_valid_in),'''
            
            for k in range(num_channel):
                accumulate_str += '''\n\t\t.data_in_{0}(data_in_{0}),'''.format(k)

            accumulate_str += '''\n\t\t.data_out(data_out_conv_{0}),'''.format(kernel)
            accumulate_str += '''\n\t\t.valid_out_pixel(valid_out_conv[{0}]),'''.format(kernel)
            accumulate_str += '''\n\t\t.done(done_conv[{0}])\n\t\t);'''.format(kernel)
        
        accumulate_str += '''\n\n\tassign valid_out_pixel = valid_out_conv[{0}];'''.format(kernel)
        accumulate_str += '''\n\n\tassign done = done_conv[{0}];'''.format(kernel)
    
    return accumulate_str

# ######################################################


def build_report():
    num_kernel = 8      # Edit here
    num_channel = 8     # Edit here


    ################### CREATE CONV SINGLE KERNEL ####################
    file_name = 'template_conv3d_1_kernel_M_channel.v'
    file_template = get_template_sample('../Data/6_template/template/' + file_name)
    jinja2_template = Template(file_template)
    

    file_name = 'conv3d_kernel_{0}_channel_size_3.v'.format(num_channel)
    out_template = '../Data/6_template/results/' + file_name

    content = jinja2_template.render(n_channel = num_channel, param_weight_bias = create_param_conv('single', num_kernel, num_channel), 
                                    port = create_port_conv('single', num_kernel, num_channel), instances = create_inst_conv('single', num_kernel, num_channel),
                                    n_delay = calc_num_delay(num_channel)[0], content_assign_add = content_assign_adder(num_channel))
    ##################################################################
    save_report(content, out_template)
    print("{0} has created!".format(out_template))



    #################### CREATE CONV MULTI KERNEL ####################
    file_name = 'template_conv3d_N_kernel_M_channel.v'
    file_template = get_template_sample('../Data/6_template/template/' + file_name)
    jinja2_template = Template(file_template)
    

    file_name = 'conv3d_{0}_kernel_{1}_channel_size_3.v'.format(num_kernel, num_channel)
    out_template = '../Data/6_template/results/' + file_name

    content = jinja2_template.render(n_kernel = num_kernel, n_channel = num_channel, param_weight_bias = create_param_conv('multi', num_kernel, num_channel), 
                                    port = create_port_conv('multi', num_kernel, num_channel), instances = create_inst_conv('multi', num_kernel, num_channel))
    ##################################################################
    save_report(content, out_template)
    print("{0} has created!".format(out_template))




    #################### CREATE BLOCK ####################
    file_name = 'template_top_module.v'
    in_template = '../Data/6_template/template/' + file_name
    file_template = get_template_sample(in_template)
    jinja2_template = Template(file_template)
    

    file_name = 'block3_conv3.v'          # Edit here
    out_template = '../Data/6_template/results/' + file_name

    bias_name = file_name[:-2] + '_bias.txt'
    weight_name = file_name[:-2] + '_filter_{1}_channel_{0}.txt'          
    content = jinja2_template.render(module_name = file_name[:-2], n_kernel = num_kernel, port = create_port_block(num_kernel, num_channel),
                                     instances = create_inst_block(num_kernel, num_channel, bias_name, weight_name, file_name[:-2]))

    save_report(content, out_template)
    print("{0} has created!".format(out_template))


# ######################################################
#                         MAIN 
# ######################################################
if __name__ == "__main__":
    build_report();

