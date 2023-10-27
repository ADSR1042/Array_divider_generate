def generate_addsub_code(num_bits):
    code = []

    for i in range(num_bits):
        temp = f'quotient[{num_bits:02}]' if i == 0 else f"c00{i:02}"
        code.append(f'addsub a0_{i:02}(y[{2*num_bits - i:02}], d[{num_bits-i:02}], c00{i+1:02}, 1\'b1, s00{i:02}, {temp});')

    code.append(f'addsub a0_{num_bits:02}(y[{num_bits:02}], d[{num_bits-num_bits:02}], 1\'b1, 1\'b1, s00{num_bits:02}, c00{num_bits:02});') 

    code.append(f"\n")

    for i in range(1, num_bits + 1):
        for j in range(0, num_bits+1):
            if j == 0:
                code.append(f"addsub a{i:02}_{j:02}(s{i-1:02}{j+1:02}, d[{num_bits-j:02}], c{i:02}{j+1:02}, quotient[{num_bits-i+1:02}], s{i:02}{j:02}, quotient[{num_bits-i:02}]);")
            elif j == num_bits:
                code.append(f"addsub a{i:02}_{j:02}(y[{num_bits-i:02}], d[00], quotient[{num_bits-i+1:02}], quotient[{num_bits-i+1:02}], s{i:02}{j:02}, c{i:02}{j:02});")
            else:
                code.append(f"addsub a{i:02}_{j:02}(s{i-1:02}{j+1:02}, d[{num_bits-j:02}], c{i:02}{j+1:02}, quotient[{num_bits-i+1:02}], s{i:02}{j:02}, c{i:02}{j:02});")

        code.append(f"\n")

    return '\n'.join(code)


def generate_divider_module(bit_width):
    # Define the module name and input/output signals
    module_name = f'divider_{bit_width}bit'
    module_code = f'module {module_name}(\n'
    module_code += '    input wire clk,\n'
    module_code += '    input wire rst,\n'
    module_code += f'    input wire [{bit_width - 1}:0] dividend,\n'
    module_code += f'    input wire [{bit_width - 1}:0] divisor,\n'
    module_code += f'    output wire [{bit_width}:0] quotient,\n'
    module_code += f'    output wire [{bit_width}:0] remainder\n'
    module_code += ');\n'

    # Define internal wires and registers
    for i in range(bit_width+1):
        module_code += f'wire '
        for j in range(1, bit_width + 1):
            module_code += f'c{i:02}{j:02},'
        module_code = module_code[:-1]
        module_code += ';\n'

    for i in range(bit_width+1):
        module_code += f'wire '
        for j in range(0, bit_width + 1):
            module_code += f's{i:02}{j:02},'
        module_code = module_code[:-1]
        module_code += ';\n'

    
    module_code += f'\n'
    module_code += f'reg [{2*bit_width}:0] y;\n'
    module_code += f'reg [{bit_width}:0] d;\n'
    module_code += f'\n'

    module_code += generate_addsub_code(bit_width)

    s_set = ','.join([f's{bit_width:02}{i:02}' for i in range(bit_width + 1)])

    remainder = f'assign remainder = s{bit_width:02}00 ? {{{s_set}}} + divisor : {{{s_set}}}'

    module_code += f'\n{remainder};\n'


    module_code += f'\n'
    # Define the always block to update registers
    module_code += 'always @(posedge clk) begin\n'
    module_code += '    if (rst) begin\n'
    module_code += f'        y <= {{ {bit_width}\'b0, dividend }};\n'
    module_code += f'        d <= {{ 1\'b0, divisor }};\n'
    module_code += '    end\n'
    module_code += 'end\n'

    # Close the module
    module_code += 'endmodule\n'

    return module_code

# Specify the bit width for the divider
#use termial to get the bit_width

bit_width =  int(input("Please input the bit_width:"))

# Generate the Verilog code for the divider module
verilog_code = generate_divider_module(bit_width)

# Print or save the Verilog code as needed
writer = open(f'divider_{bit_width}bit_auto.v', 'w')
writer.write(verilog_code)
writer.close()




print(verilog_code)
