<<-Doc
Given an m x n binary matrix mat, return the distance of the nearest 0 for each cell.

The distance between two adjacent cells is 1.

Input: mat = [[0,0,0],[0,1,0],[1,1,1]]
Output: [[0,0,0],[0,1,0],[1,2,1]]

DYNAMIC PROGRAMMING
Doc

# @param {Integer[][]} mat
# @return {Integer[][]}
def update_matrix(mat)
  m = mat.size
  n = mat[0].size
  max_distance = m + n

  result = Array.new(m, [])
  0.upto(m - 1).each do |i|
    result[i] = Array.new(n, false)
  end

  # Up Down interation
  0.upto(m - 1).each do |row|
    0.upto(n - 1).each do |col|
      if mat[row][col] == 0
        result[row][col] = 0
      else
        up_val = row > 0 ?  result[row - 1][col] : max_distance
        left_val = col > 0 ?  result[row][col - 1] : max_distance
        # Lock temp min_distance based on up and left
        result[row][col] = [up_val, left_val].min + 1
      end
    end
  end

  # Bottom Up interation
  (m - 1).downto(0).each do |row|
    (n - 1).downto(0).each do |col|
      if mat[row][col] == 0
        result[row][col] = 0
      else
        down_val = row < (m - 1) ?  result[row + 1][col] : max_distance
        right_val = col < (n - 1) ?  result[row][col + 1] : max_distance
        # Lock temp min_distance based on up and left
        result[row][col] = [[down_val, right_val].min + 1, result[row][col]].min
      end
    end
  end

  result
end

<<-Doc
Do đi lần lượt từ trái qua phải từ trên xuống dưới, nên khi duyện đến 1 node, up và left của n đã xác định đc giá trị
Cần xác định thêm down và right sau đó lấy min
Nhưng down và right lại phụ thuộc vào chính node đấy, sẽ tạo thành loop vô hạn, vậy cần đảo ngược quá trình,
đi từ phải qua trái từ dưới lên trên, đến khi đến 1 node, down và right của n đã xác định đc giá trị. 
lấy min của down và right sau đó so sánh với min của up và left, sẽ có đươc giá trị đúng nhất.

Best case sẽ giống như việc 0...........1...........................0
Đi 2 chiều từ số 0 bên trái và số 0 bên phải, xem cái nào nhỏ hơn thì n là giá trị nhỏ nhất để đến được số 0 tính từ số 1

Sẽ thế nào nếu up hay left đều = 1, như vậy ko thể xác định đc giá trị của up hay left, chỉ có thể đi chiều ngược lại để tính toán.
Lúc này chỉ có thể giả định up hay left có giá trị quãng đướng lớn nhất có thể trong matrix, sau đó đi hướng ngược lại để tính lại. 
Quãng lớn nhất lầ đi từ góc này sang góc đối diện. Như vậy quãng đường sẽ ko thể vượt quá m + n
Doc

p update_matrix [[0,0,0],[0,1,0],[1,1,1]]
