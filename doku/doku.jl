PATH_CHAPTER = ARGS[1]
println("=========>",PATH_CHAPTER)
#println("=========>",path_chapter)
using RandLayout
#

SetUp = setup(width = 1748,
              height = 2480,  
              ncol = 2,
              nrow = 6,
              grid_numbers = 1,
              grid_lines = 1,
              path_save_info = "path/to/output",
              path_img = PATH_CHAPTER*"/Bild",
              path_title = PATH_CHAPTER*"/Titel",
              path_text = PATH_CHAPTER*"/Text",
              shape = "99")

Grid = round.(setup_grid(SetUp), digits = 2)

 
# randomly select element size 
while true
  global SIZES = check_sizes(size_title = random_size(min = 1, max = 3),
                             size_text = random_size(min = 1, max = 4),
                             size_text2 = random_size(min = 1, max = 4),
                             size_img = 4, #random_size(min = 1, max = 4),
                             size_img2 = random_size(min = 0, max = 4),
                             size_img3 = random_size(min = 0, max = 4),
                             size_date = 0,
                             size_location = 0)
  if any(SIZES .!= false)
    break
  end
end
#
size_title = SIZES[1] 
size_text = SIZES[2]
size_text2 = SIZES[3]
size_img = SIZES[4]
size_img2 = SIZES[5]
size_img3 = SIZES[6]
size_date = SIZES[7]
size_location = SIZES[8]
#
# initialize elements with respective sizes
Elements = elements(TITLE = title(size = size_title),
                    TEXT = text(size = size_text),
                    TEXT2 = text(size = size_text2),
                    IMG = image(size = size_img),
                    IMG2 = image(size = size_img2),
                    IMG3 = image(size = size_img3),
                    DATE = date(size = size_date),
                    LOCATION = location(size = size_location));
#
# assign boxes
loop_elements(SetUp, elements = Elements)
#
# wite info
write_info(SetUp, Elements, Grid)



#
# plot result
#plot_grid(SetUp);
#plot_numbers(SetUp);
#plot_elements(SetUp, elements = Elements);
#plot_shape(SetUp, x = x, y = y, width = w, height = h);

