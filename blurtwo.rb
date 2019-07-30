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
      find_targets.each do |target|
        left(target)
        right(target)
        down(target)
        up(target)
      end
    end
  
    private
  
      def left(target)
        @image[target[0]][target[1] - 1] = 2 if target[1] - 1 != 2
      end
  
      def right(target)
        @image[target[0]][target[1] + 1] = 2 if target[1] + 1 <= @image[target[0]].length - 1
      end
  
      def down(target)
        @image[target[0] + 1][target[1]] = 2 if target[0] + 1 <= @image.length - 1
      end
  
      def up(target)
        @image[target[0] - 1][target[1]] = 2 if target[0] - 1 != 2
      end
  
      def find_targets
        targets = [] 
        @image.each_with_index do |row, row_index| 
          row.each_with_index do |column, column_index| 
            targets << [row_index, column_index] if column == 2
          end
        end
  
        return targets 
      end
  
  end
  
  image = Image.new([
 [3,8,3,7,3],
 [3,2,1,2,3],
 [0,5,2,3,4],
 [1,9,3,4,5]
])
  image.blur 
  image.put_image 