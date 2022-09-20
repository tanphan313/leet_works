<<-Doc
Reverse bits of a given 32 bits unsigned integer.

Input: n = 00000010100101000001111010011100
Output:    964176192 (00111001011110000010100101000000)
Explanation: The input binary string 00000010100101000001111010011100 represents the unsigned integer 43261596, 
so return 964176192 which its binary representation is 00111001011110000010100101000000.

1: 0001 
2: 0010 
3: 0011 
4: 0100 
5: 0101
6: 0110
7: 0111

reverse 7: 0111 -> 1110 => 14
recerse 6: 0110 -> 0110 => 6
recerse 5: 0101 -> 1010 => 10

0 | 0 -> 0 
1 | 0 -> 1 
OR với 0 ra chính nó

chiến lược: dịch 1 nửa trái về bên phải, sau đó dịch nửa phải về bên trái.
1101_0010
dịch nửa trái: 0000_1101 
dịch nửa phải: 0010_0000 
2 kết quả này OR với nhau ra: 0010_1101 chính là nghịch đảo 2 nửa

tiếp tục làm các bước trên với từng nửa một cho đến khi chỉ đảo 2 bit. Nhưng cách này khó hiểu vì phải lấy 1 nửa liên tục

-------- Solution -----------

1 & 0 -> 0 
1 & 1 -> 1

& chỉ ra 1 khi 1 & 1

result = 0000_0000_0000_0000_0000_0000_0000_0000
input =  0000_0010_1001_0100_0001_1110_1001_1100

gắn từng bit cuối của input vào bit cuối của result, sau đó shift left result 1 step 
sau khi gắn thì drop bit cuối của input đi bằng cách shift right input 1 step.

nếu bit cuối của input = 1 thì result += 1 
nếu input & 1 == 1 thì bit cuối của input chính bằng 1: 1001 & 0001 -> 0001 =  1

Dù bit cuối là gì thì cũng shift left result và shift right input
Doc

# @param {Integer} n, a positive integer
# @return {Integer}
def reverse_bits(n)
  rs = 0

  32.times do |_i|
    # Luôn shift left trước để có chỗ trống cho bit tiếp theo nếu cần insert 1
    rs = rs << 1
    rs += 1 if (n & 1 == 1)
    n = n >> 1
  end

  rs
end
