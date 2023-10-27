module divider_8bit(
    input wire clk,
    input wire rst,
    input wire [7:0] dividend,
    input wire [7:0] divisor,
    output wire [8:0] quotient,
    output wire [8:0] remainder
);
wire c0001,c0002,c0003,c0004,c0005,c0006,c0007,c0008;
wire c0101,c0102,c0103,c0104,c0105,c0106,c0107,c0108;
wire c0201,c0202,c0203,c0204,c0205,c0206,c0207,c0208;
wire c0301,c0302,c0303,c0304,c0305,c0306,c0307,c0308;
wire c0401,c0402,c0403,c0404,c0405,c0406,c0407,c0408;
wire c0501,c0502,c0503,c0504,c0505,c0506,c0507,c0508;
wire c0601,c0602,c0603,c0604,c0605,c0606,c0607,c0608;
wire c0701,c0702,c0703,c0704,c0705,c0706,c0707,c0708;
wire c0801,c0802,c0803,c0804,c0805,c0806,c0807,c0808;
wire s0000,s0001,s0002,s0003,s0004,s0005,s0006,s0007,s0008;
wire s0100,s0101,s0102,s0103,s0104,s0105,s0106,s0107,s0108;
wire s0200,s0201,s0202,s0203,s0204,s0205,s0206,s0207,s0208;
wire s0300,s0301,s0302,s0303,s0304,s0305,s0306,s0307,s0308;
wire s0400,s0401,s0402,s0403,s0404,s0405,s0406,s0407,s0408;
wire s0500,s0501,s0502,s0503,s0504,s0505,s0506,s0507,s0508;
wire s0600,s0601,s0602,s0603,s0604,s0605,s0606,s0607,s0608;
wire s0700,s0701,s0702,s0703,s0704,s0705,s0706,s0707,s0708;
wire s0800,s0801,s0802,s0803,s0804,s0805,s0806,s0807,s0808;

reg [16:0] y;
reg [8:0] d;

addsub a0_00(y[16], d[08], c0001, 1'b1, s0000, quotient[08]);
addsub a0_01(y[15], d[07], c0002, 1'b1, s0001, c0001);
addsub a0_02(y[14], d[06], c0003, 1'b1, s0002, c0002);
addsub a0_03(y[13], d[05], c0004, 1'b1, s0003, c0003);
addsub a0_04(y[12], d[04], c0005, 1'b1, s0004, c0004);
addsub a0_05(y[11], d[03], c0006, 1'b1, s0005, c0005);
addsub a0_06(y[10], d[02], c0007, 1'b1, s0006, c0006);
addsub a0_07(y[09], d[01], c0008, 1'b1, s0007, c0007);
addsub a0_08(y[08], d[00], 1'b1, 1'b1, s0008, c0008);


addsub a01_00(s0001, d[08], c0101, quotient[08], s0100, quotient[07]);
addsub a01_01(s0002, d[07], c0102, quotient[08], s0101, c0101);
addsub a01_02(s0003, d[06], c0103, quotient[08], s0102, c0102);
addsub a01_03(s0004, d[05], c0104, quotient[08], s0103, c0103);
addsub a01_04(s0005, d[04], c0105, quotient[08], s0104, c0104);
addsub a01_05(s0006, d[03], c0106, quotient[08], s0105, c0105);
addsub a01_06(s0007, d[02], c0107, quotient[08], s0106, c0106);
addsub a01_07(s0008, d[01], c0108, quotient[08], s0107, c0107);
addsub a01_08(y[07], d[00], quotient[08], quotient[08], s0108, c0108);


addsub a02_00(s0101, d[08], c0201, quotient[07], s0200, quotient[06]);
addsub a02_01(s0102, d[07], c0202, quotient[07], s0201, c0201);
addsub a02_02(s0103, d[06], c0203, quotient[07], s0202, c0202);
addsub a02_03(s0104, d[05], c0204, quotient[07], s0203, c0203);
addsub a02_04(s0105, d[04], c0205, quotient[07], s0204, c0204);
addsub a02_05(s0106, d[03], c0206, quotient[07], s0205, c0205);
addsub a02_06(s0107, d[02], c0207, quotient[07], s0206, c0206);
addsub a02_07(s0108, d[01], c0208, quotient[07], s0207, c0207);
addsub a02_08(y[06], d[00], quotient[07], quotient[07], s0208, c0208);


addsub a03_00(s0201, d[08], c0301, quotient[06], s0300, quotient[05]);
addsub a03_01(s0202, d[07], c0302, quotient[06], s0301, c0301);
addsub a03_02(s0203, d[06], c0303, quotient[06], s0302, c0302);
addsub a03_03(s0204, d[05], c0304, quotient[06], s0303, c0303);
addsub a03_04(s0205, d[04], c0305, quotient[06], s0304, c0304);
addsub a03_05(s0206, d[03], c0306, quotient[06], s0305, c0305);
addsub a03_06(s0207, d[02], c0307, quotient[06], s0306, c0306);
addsub a03_07(s0208, d[01], c0308, quotient[06], s0307, c0307);
addsub a03_08(y[05], d[00], quotient[06], quotient[06], s0308, c0308);


addsub a04_00(s0301, d[08], c0401, quotient[05], s0400, quotient[04]);
addsub a04_01(s0302, d[07], c0402, quotient[05], s0401, c0401);
addsub a04_02(s0303, d[06], c0403, quotient[05], s0402, c0402);
addsub a04_03(s0304, d[05], c0404, quotient[05], s0403, c0403);
addsub a04_04(s0305, d[04], c0405, quotient[05], s0404, c0404);
addsub a04_05(s0306, d[03], c0406, quotient[05], s0405, c0405);
addsub a04_06(s0307, d[02], c0407, quotient[05], s0406, c0406);
addsub a04_07(s0308, d[01], c0408, quotient[05], s0407, c0407);
addsub a04_08(y[04], d[00], quotient[05], quotient[05], s0408, c0408);


addsub a05_00(s0401, d[08], c0501, quotient[04], s0500, quotient[03]);
addsub a05_01(s0402, d[07], c0502, quotient[04], s0501, c0501);
addsub a05_02(s0403, d[06], c0503, quotient[04], s0502, c0502);
addsub a05_03(s0404, d[05], c0504, quotient[04], s0503, c0503);
addsub a05_04(s0405, d[04], c0505, quotient[04], s0504, c0504);
addsub a05_05(s0406, d[03], c0506, quotient[04], s0505, c0505);
addsub a05_06(s0407, d[02], c0507, quotient[04], s0506, c0506);
addsub a05_07(s0408, d[01], c0508, quotient[04], s0507, c0507);
addsub a05_08(y[03], d[00], quotient[04], quotient[04], s0508, c0508);


addsub a06_00(s0501, d[08], c0601, quotient[03], s0600, quotient[02]);
addsub a06_01(s0502, d[07], c0602, quotient[03], s0601, c0601);
addsub a06_02(s0503, d[06], c0603, quotient[03], s0602, c0602);
addsub a06_03(s0504, d[05], c0604, quotient[03], s0603, c0603);
addsub a06_04(s0505, d[04], c0605, quotient[03], s0604, c0604);
addsub a06_05(s0506, d[03], c0606, quotient[03], s0605, c0605);
addsub a06_06(s0507, d[02], c0607, quotient[03], s0606, c0606);
addsub a06_07(s0508, d[01], c0608, quotient[03], s0607, c0607);
addsub a06_08(y[02], d[00], quotient[03], quotient[03], s0608, c0608);


addsub a07_00(s0601, d[08], c0701, quotient[02], s0700, quotient[01]);
addsub a07_01(s0602, d[07], c0702, quotient[02], s0701, c0701);
addsub a07_02(s0603, d[06], c0703, quotient[02], s0702, c0702);
addsub a07_03(s0604, d[05], c0704, quotient[02], s0703, c0703);
addsub a07_04(s0605, d[04], c0705, quotient[02], s0704, c0704);
addsub a07_05(s0606, d[03], c0706, quotient[02], s0705, c0705);
addsub a07_06(s0607, d[02], c0707, quotient[02], s0706, c0706);
addsub a07_07(s0608, d[01], c0708, quotient[02], s0707, c0707);
addsub a07_08(y[01], d[00], quotient[02], quotient[02], s0708, c0708);


addsub a08_00(s0701, d[08], c0801, quotient[01], s0800, quotient[00]);
addsub a08_01(s0702, d[07], c0802, quotient[01], s0801, c0801);
addsub a08_02(s0703, d[06], c0803, quotient[01], s0802, c0802);
addsub a08_03(s0704, d[05], c0804, quotient[01], s0803, c0803);
addsub a08_04(s0705, d[04], c0805, quotient[01], s0804, c0804);
addsub a08_05(s0706, d[03], c0806, quotient[01], s0805, c0805);
addsub a08_06(s0707, d[02], c0807, quotient[01], s0806, c0806);
addsub a08_07(s0708, d[01], c0808, quotient[01], s0807, c0807);
addsub a08_08(y[00], d[00], quotient[01], quotient[01], s0808, c0808);


assign remainder = s0800 ? {s0800,s0801,s0802,s0803,s0804,s0805,s0806,s0807,s0808} + divisor : {s0800,s0801,s0802,s0803,s0804,s0805,s0806,s0807,s0808};

always @(posedge clk) begin
    if (rst) begin
        y <= { 8'b0, dividend };
        d <= { 1'b0, divisor };
    end
end
endmodule
