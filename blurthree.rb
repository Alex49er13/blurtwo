class Image

    

    def initialize(array)
      @image = array
    end
  
    

    def put_image
      @image.each do |row|
        puts row.join(',')
      end
    end
    
    def blur 
      puts "how many pixels should be blurred?"
      num = gets.chomp.to_i
      puts num.to_s
      num.times do |index|
        count = index + 1
          find_targets(count).each do |target|
            left(target,count)
            right(target, count)
            down(target, count)
            up(target, count)
          end
        end  
    end
    

    
    private
  
  

    def left(target, count)
      @image[target[0]][target[1] - 1] = count + 1 if target[1] - 1 >= 0 && @image[target[0]][target[1] - 1] == 0
    end

    def right(target, count)
      @image[target[0]][target[1] + 1] = count + 1 if target[1] + 1 <= @image[target[0]].length - 1 && @image[target[0]][target[1] + 1] == 0
    end

    def down(target, count)
      @image[target[0] + 1][target[1]] = count + 1 if target[0] + 1 <= @image.length - 1 && @image[target[0] + 1][target[1]] == 0
    end

    def up(target, count)
      @image[target[0] - 1][target[1]] = count + 1 if target[0] - 1 >= 0 && @image[target[0] - 1][target[1]] == 0
      end
  
      def find_targets(count)
        targets = [] 
        @image.each_with_index do |row, row_index| 
          row.each_with_index do |column, column_index| 
            targets << [row_index, column_index] if column == count
          end
        end
         #[2,3]
        return targets 
      end
       
      # def manhattan_distance
      #   @image[target[0]+ pixels][target[1]] =":)"  point1 [0-1][point1[0]]
      # end

       
       
  end
  
  image = Image.new([
 [0,0,0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,1,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0,0,0],
])
  image.blur 
  image.put_image 