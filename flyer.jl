using RandLayout
#
SetUp = setup(width = 1748,
              height = 2480,  
              ncol = 2,
              nrow = 6,
              grid_numbers = 1,
              grid_lines = 1,
              path_save_info =  "/Users/danielfitze/ristretti/GIT/motile/data/INFO",
              path_img = "/Users/danielfitze/ristretti/GIT/motile/data/img2",
              path_title = "/Users/danielfitze/ristretti/GIT/motile/data/title",
              path_text = "/Users/danielfitze/ristretti/GIT/motile/data/text",
              shape = "99")
#
Grid = round.(setup_grid(SetUp), digits = 2)
#
# randomly select element size 
while true
  global SIZE = reduce(vcat,rand([1,2,3,4],5));
  if sum(SIZE) <= 12
    break
  end
end
#
# initialize elements with respective sizes
Elements = elements(TITLE = title(size = SIZE[1]),
                    TEXT = text(size = SIZE[2]),
                    IMG = image(size = SIZE[3]),
                    IMG2 = image(size = SIZE[4]),
                    IMG3 = image(size = SIZE[5]),
                    DATE = date(size = 0),
                    LOCATION = location(size = 0));
# assign boxes
loop_elements(SetUp, elements = Elements)
#
write_info(SetUp, Elements, Grid)

set_nested_field(Elements,
                 element = :IMG2,
                 field = :box,
                 value = 13)




#
# plot result
#plot_grid(SetUp);
#plot_numbers(SetUp);
#plot_elements(SetUp, elements = Elements);
#plot_shape(SetUp, x = x, y = y, width = w, height = h);

