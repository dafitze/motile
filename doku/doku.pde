import processing.pdf.*;
size(1748, 2480, PDF, "test.pdf");

// -------------------------- GET INFO & GRID ----
// {{{============================================
Table setup = loadTable("../data/INFO/setup.csv", "header");
TableRow value_row = setup.getRow(0);

Float left_border = value_row.getFloat("left_border");
Float border = value_row.getFloat("border");
int box_width = int(round(value_row.getFloat("box_width")));
int box_height = int(round(value_row.getFloat("box_height")));
int grid_numbers = value_row.getInt("grid_numbers");
int grid_lines = value_row.getInt("grid_lines");
String empty_boxes = value_row.getString("boxes");
int[] EMPTY_BOXES = int(empty_boxes.split("; "));
String path_img = value_row.getString("path_img");
String path_title = value_row.getString("path_title");
String path_text = value_row.getString("path_text");
String shape_string = value_row.getString("shape");
float[] shape_param = float(shape_string.split("; "));

Table grid = loadTable("../data/INFO/grid.csv", "header");
// }}}
// ------------------------------ GET CONTENT ----
// {{{===================== =======================
File PATH_IMG = new File(path_img); 
String[] images = PATH_IMG.list(); 
int rand = (int)random(images.length);
PImage img = loadImage(path_img+"/"+images[rand]);
rand = (int)random(images.length);
PImage img2 = loadImage(path_img+"/"+images[rand]);
rand = (int)random(images.length);
PImage img3 = loadImage(path_img+"/"+images[rand]);

File PATH_TITLE = new File(path_title);
String[] titles = PATH_TITLE.list();
rand = (int)random(titles.length);
String title = loadStrings(path_title+"/"+titles[rand])[0];

File PATH_TEXT = new File(path_text);
String[] texts = PATH_TEXT.list();
rand = (int)random(texts.length);
String[] text_lines = loadStrings(path_text+"/"+texts[rand]);
String text_joined = join(text_lines, "\n");

File PATH_TEXT2 = new File(path_text);
String[] texts2 = PATH_TEXT2.list();
rand = (int)random(texts2.length);
String[] text2_lines = loadStrings(path_text+"/"+texts2[rand]);
String text2_joined = join(text2_lines, "\n");


String badge_text = "Mehr Infos unter:\nmotile.ch";

String date = "Datum";
String DATE = "Do. 23. Juni 2022, 18:45 Uhr";
String location = "Ort";
String LOCATION = "Meret-Oppenheim-Brunnen, Waisenhausplatz, Bern";

// }}}
 

// ------------------------- FORMAT VARIABLES ----
// {{{============================================

// fonts
PFont font_mono = createFont("../data/font/SuisseIntlMono-Regular.ttf", 32);
PFont font_regular = createFont("../data/font/SuisseWorks-Regular.ttf", 32);

// title
int title_text_size = 178;
int title_color = 0;
int title_offset = 23;
Float title_line_height = 221.2;

// text
int text_text_size = 35;
int text_color = 0;
Float text_line_height = 41.6;

// chapter
int chapter_text_size = 35;
int chapter_color = 0;

 //

// }}}

// ------------------------------- BACKGROUND ----
// {{{============================================
background(255);
color[] colors = { #9bcd82, #fae682, #fa9650, #91c3eb, #fac37d, #eb96af, #50a07d, #fac314, #eb5a28, #3264af, #e19100, #e66478 };
rand = (int)random(colors.length);
color col = colors[rand];
fill(col);
rect(left_border, border, 2 * box_width, 6 * box_height);
// }}}

// ---------------------------------- LOCHUNG ----
// {{{============================================
fill(0);
ellipse(left_border/2, (height/2) + 472.5, 59, 59);
ellipse(left_border/2, (height/2) - 472.5, 59, 59);

// }}}

// ---------------------------- SIZES & BOXES ----
// {{{============================================
// 1 -> one box
// 2 -> two boxes vertical
// 3 -> two boxes horizontal
// 4 -> four boxes
// get julia Info
Table julia_info = loadTable("../data/INFO/julia_info.csv", "header");

TableRow title_row = julia_info.findRow("title", "element");
int size_title = title_row.getInt("size");
int box_title = title_row.getInt("box");
Float x_coord_title = title_row.getFloat("x_coord");
Float y_coord_title = title_row.getFloat("y_coord");
Float title_width = title_row.getFloat("width");
Float title_height = title_row.getFloat("height");
//println("TITLE:    box = ", box_title, " ", " size = ", size_title, " x = ", x_coord_title, " y = ", y_coord_title);


TableRow text_row = julia_info.findRow("text", "element");
int size_text = text_row.getInt("size");
int box_text = text_row.getInt("box");
Float x_coord_text = text_row.getFloat("x_coord");
Float y_coord_text = text_row.getFloat("y_coord");
Float text_width = text_row.getFloat("width");
Float text_height = text_row.getFloat("height");
//println("TEXT:     box = ", box_text, " ", " size = ", size_text, " x = ", x_coord_text, " y = ", y_coord_text);

TableRow text2_row = julia_info.findRow("text2", "element");
int size_text2 = text2_row.getInt("size");
int box_text2 = text2_row.getInt("box");
Float x_coord_text2 = text2_row.getFloat("x_coord");
Float y_coord_text2 = text2_row.getFloat("y_coord");
Float text2_width = text2_row.getFloat("width");
Float text2_height = text2_row.getFloat("height");
//println("TEXT:     box = ", box_text, " ", " size = ", size_text, " x = ", x_coord_text, " y = ", y_coord_text);


TableRow img_row = julia_info.findRow("image", "element");
int size_img = img_row.getInt("size");
int box_img = img_row.getInt("box");
Float x_coord_img = img_row.getFloat("x_coord");
Float y_coord_img = img_row.getFloat("y_coord");
Float img_width = img_row.getFloat("width");
Float img_height = img_row.getFloat("height");
//println("IMAGE:    box = ", box_img, " ", " size = ", size_img, " x = ", x_coord_img, " y = ", y_coord_img);

TableRow img2_row = julia_info.findRow("image2", "element");
int size_img2 = img2_row.getInt("size");
int box_img2 = img2_row.getInt("box");
Float x_coord_img2 = img2_row.getFloat("x_coord");
Float y_coord_img2 = img2_row.getFloat("y_coord");
Float img2_width = img2_row.getFloat("width");
Float img2_height = img2_row.getFloat("height");
//println("IMAGE:    box = ", box_img, " ", " size = ", size_img, " x = ", x_coord_img, " y = ", y_coord_img);

TableRow img3_row = julia_info.findRow("image3", "element");
int size_img3 = img3_row.getInt("size");
int box_img3 = img3_row.getInt("box");
Float x_coord_img3 = img3_row.getFloat("x_coord");
Float y_coord_img3 = img3_row.getFloat("y_coord");
Float img3_width = img3_row.getFloat("width");
Float img3_height = img3_row.getFloat("height");
//println("IMAGE:    box = ", box_img, " ", " size = ", size_img, " x = ", x_coord_img, " y = ", y_coord_img);

TableRow date_row = julia_info.findRow("date", "element");
int size_date = date_row.getInt("size");
int box_date = date_row.getInt("box");
Float x_coord_date = date_row.getFloat("x_coord");
Float y_coord_date = date_row.getFloat("y_coord");
Float date_width = date_row.getFloat("width");
Float date_height = date_row.getFloat("height");
//println("DATE:     box = ", box_date, " ", " size = ", size_date, " x = ", x_coord_date, " y = ", y_coord_date);

TableRow location_row = julia_info.findRow("location", "element");
int size_location = location_row.getInt("size");
int box_location = location_row.getInt("box");
Float x_coord_location = location_row.getFloat("x_coord");
Float y_coord_location = location_row.getFloat("y_coord");
Float location_width = location_row.getFloat("width");
Float location_height = location_row.getFloat("height");
//println("LOCATION: box = ", box_location, " ", " size = ", size_location, " x = ", x_coord_location, " y = ", y_coord_location);
// }}}

//// ----------------------------- DRAW CONTENT ----
//// {{{============================================
if (size_title != 0){
  // chapter title
  textFont(font_mono);
  textSize(chapter_text_size);
  textAlign(LEFT, TOP);
  fill(chapter_color);
  text("Präsentation",
      x_coord_title + title_offset,    // x text start
      y_coord_title + title_offset,    // y text start
      box_width - 2*title_offset,           // width text box
      box_height - 2*title_offset);         // height text box

  //
  // title
  textFont(font_regular);
  textSize(title_text_size);
  textLeading(title_line_height);
  textAlign(LEFT, TOP);
  fill(title_color);
  text(title,
      x_coord_title + title_offset,     // x text start
      y_coord_title + 5 * title_offset, // y text start
      title_width - 2*title_offset,     // width text box
      title_height - 2*title_offset);   // height text box
}
// Text
if (size_text != 0){
  fill(text_color);
  textFont(font_regular);
  textSize(text_text_size);
  textLeading(text_line_height);
  textAlign(LEFT, TOP);
  text(text_joined,
  //text("erste zeile \nzweite zeile \ndritte zeile ööö",
      x_coord_text + title_offset,
      y_coord_text + title_offset,
      text_width - 2 * title_offset,
      text_height - 2 * title_offset);
}
// Text2
if (size_text2 != 0){
  fill(text_color);
  textFont(font_regular);
  textSize(text_text_size);
  textLeading(text_line_height);
  textAlign(LEFT, TOP);
  text(text2_joined,
  //text("erste zeile \nzweite zeile \ndritte zeile ööö",
      x_coord_text2 + title_offset,
      y_coord_text2 + title_offset,
      text2_width - 2 * title_offset,
      text2_height - 2 * title_offset);
}

// img
if (size_img != 0){
  if (img.width < img.height){
    img.resize(round(img_width), 0);
    if (img.height < img_height){
      img.resize(0, round(img_height));
    }
  } else if (img.width > img.height){
    img.resize(0, round(img_height));
    if (img.width < img_width){
      img.resize(round(img_width), 0);
    }
  }

  PImage IMG = img.get(
      0,   // x coord
      0,   // y coord
      round(img_width),
      round(img_height));


  image(IMG,
      x_coord_img,
      y_coord_img);
}


//println("BOX DIMENSIONS: ");
//println("  width:  ", box_width);
//println("  height: ", box_height);
//println("IMG3 DIMENSIONS: ");
//println("  width:  ", img3_width);
//println("  height: ", img3_height);
// -----------
// img2
if (size_img2 != 0){
  if (img2.width < img2.height){
    //println("WIDTH < HEIGHT");
    //println("  BEFORE");
    //println("  width:  ", img3.width);
    //println("  height: ", img3.height);
    img2.resize(round(img2_width), 0);
    if (img2.height < img2_height){
      img2.resize(0, round(img2_height));
    }
    //println("  AFTER");
    //println("  width:  ", img3.width);
    //println("  height: ", img3.height);
  } else if (img2.width > img2.height){
    //println("WIDTH > HEIGHT");
    //println("  BEFORE");
    //println("  width:  ", img3.width);
    //println("  height: ", img3.height);
    img2.resize(0, round(img2_height));
    //println("  AFTER I");
    //println("  width:  ", img3.width);
    //println("  height: ", img3.height);
    if (img2.width < img2_width){
      img2.resize(round(img2_width), 0);
    }
    //println("  AFTER II");
    //println("  width:  ", img3.width);
    //println("  height: ", img3.height);
  }

  PImage IMG2 = img2.get(
      0,   // x coord
      0,   // y coord
      round(img2_width),
      round(img2_height));


  image(IMG2,
      x_coord_img2,
      y_coord_img2);
}

// img3
if (size_img3 != 0){
  if (img3.width < img3.height){
    img3.resize(round(img3_width), 0);
    if (img3.height < img3_height){
      img3.resize(0, round(img3_height));
    }
  } else if (img3.width > img3.height){
    img3.resize(0, round(img3_height));
    if (img3.width < img3_width){
      img3.resize(round(img3_width), 0);
    }
  }

  PImage IMG3 = img3.get(
      0,   // x coord
      0,   // y coord
      round(img3_width),
      round(img3_height));


  image(IMG3,
      x_coord_img3,
      y_coord_img3);
}


if (size_date != 0){
  // chapter date
  textFont(font_mono);
  textSize(chapter_text_size);
  textAlign(LEFT, BOTTOM);
  fill(chapter_color);
  text(date,
      x_coord_date + title_offset,  // x text start
      y_coord_date + title_offset,  // y text start
      box_width - 2*title_offset,       // width text box
      box_height - 4*title_offset);     // height text box
  // DATE
  textFont(font_regular);
  textSize(chapter_text_size);
  textLeading(text_line_height);
  text(DATE,
      x_coord_date + title_offset,  // x text start
      y_coord_date + title_offset,  // y text start
      date_width - 2 * title_offset,       // width text box
      date_height - 2 * title_offset);     // height text box
}
if (size_location != 0){
  // chapter location
  textFont(font_mono);
  textSize(chapter_text_size);
  textAlign(LEFT, BOTTOM);
  fill(chapter_color);
  text(location,
      x_coord_location + title_offset,  // x text start
      y_coord_location - 0.7* title_offset,  // y text start
      box_width - 2*title_offset,       // width text box
      box_height - 4*title_offset);     // height text box
  // LOCATION
  textFont(font_regular);
  textSize(chapter_text_size);
  textLeading(text_line_height);
  text(LOCATION,
      x_coord_location + title_offset,  // x text start
      y_coord_location + title_offset,  // y text start
      location_width - 2*title_offset,       // width text box
      location_height - 2*title_offset);     // height text box
}
// }}}  

// -------------------------------- DRAW GRID ----
// {{{============================================
// outer grid
stroke(0);
strokeWeight(2);

// outer box
line(left_border, border,
    left_border, height - border);
line(width - border, border,
    width - border, height - border);
line(left_border, border,
    width - border, border);
line(left_border, height - border,
    width - border, height - border);

int horizontal_length = 99;
int vertical_height = 99;
int vertical_length = 99;
int vertical_pos = 99;
if (size_title != 0){
  // title border
  if (size_title == 4) {
    horizontal_length = 2; // width of border
    vertical_length = 2;   // height of border
    vertical_pos = 0;      // is line in center required
  } else if (size_title == 3){
    horizontal_length = 2; // width of border
    vertical_length = 1;   // height of border
    vertical_pos = 0;      // is line in center required
  } else if ((size_title == 2) && (box_title % 2 != 0)){
    horizontal_length = 1; // width of border
    vertical_length = 2;   // height of border
    vertical_pos = 1;      // is line in center required
  } else if ((size_title == 2) && (box_title % 2 == 0)){
    horizontal_length = 1;
    vertical_length = 2;
    vertical_pos = 0;
  } else if ((size_title == 1) && (box_title % 2 != 0)) {
    horizontal_length = 1;
    vertical_length = 1;
    vertical_pos = 1;
  } else if ((size_title == 1) && (box_title % 2 == 0)) {
    horizontal_length = 1;
    vertical_length = 1;
    vertical_pos = 0;
  };

  // horizontal upper line
  line(x_coord_title,                                // x1 
      y_coord_title,                                 // y1
      x_coord_title + horizontal_length * box_width, // x2
      y_coord_title);                                // y2
  // hotizontal lower line
  line(x_coord_title,                                // x1
      y_coord_title + vertical_length * box_height,  // y1
      x_coord_title + horizontal_length * box_width, // x2
      y_coord_title + vertical_length * box_height); // y2
  // vertical line
  line(x_coord_title + vertical_pos * box_width,     // x1 
      y_coord_title,                                 // y1
      x_coord_title + vertical_pos * box_width,      // x2
      y_coord_title + vertical_length * box_height); // y2
}

if (size_text !=0){
  // text border
  if (size_text == 4) {
    horizontal_length = 2; // width of border
    vertical_length = 2;   // height of border
    vertical_pos = 0;      // is line in center required
  } else if (size_text == 3){
    horizontal_length = 2; // width of border
    vertical_length = 1;   // height of border
    vertical_pos = 0;      // is line in center required
  } else if ((size_text == 2) && (box_text % 2 == 0)){
    horizontal_length = 1; // width of border
    vertical_length = 2;   // height of border
    vertical_pos = 0;      // is line in center required
  } else if ((size_text == 2) && (box_text % 2 != 0)){
    horizontal_length = 1;
    vertical_length = 2;
    vertical_pos = 1;
  } else if ((size_text == 1) && (box_text % 2 == 0)) {
    horizontal_length = 1;
    vertical_length = 1;
    vertical_pos = 0;
  } else if ((size_text == 1) && (box_text % 2 != 0)) {
    horizontal_length = 1;
    vertical_length = 1;
    vertical_pos = 1;
  };

  // horizontal upper line
  line(x_coord_text,                                // x1 
      y_coord_text,                                 // y1
      x_coord_text + horizontal_length * box_width, // x2
      y_coord_text);                                // y2
  // hotizontal lower line
  line(x_coord_text,
      y_coord_text + vertical_length * box_height,  // y1
      x_coord_text + horizontal_length * box_width, // x2
      y_coord_text + vertical_length * box_height); // y2

  // vertical line
  line(x_coord_text + vertical_pos * box_width,     // x1 
      y_coord_text,                                 // y1
      x_coord_text + vertical_pos * box_width,      // x2
      y_coord_text + vertical_length * box_height); // y2
}

if (size_text2 !=0){
  // text border
  if (size_text2 == 4) {
    horizontal_length = 2; // width of border
    vertical_length = 2;   // height of border
    vertical_pos = 0;      // is line in center required
  } else if (size_text2 == 3){
    horizontal_length = 2; // width of border
    vertical_length = 1;   // height of border
    vertical_pos = 0;      // is line in center required
  } else if ((size_text2 == 2) && (box_text2 % 2 == 0)){
    horizontal_length = 1; // width of border
    vertical_length = 2;   // height of border
    vertical_pos = 0;      // is line in center required
  } else if ((size_text2 == 2) && (box_text2 % 2 != 0)){
    horizontal_length = 1;
    vertical_length = 2;
    vertical_pos = 1;
  } else if ((size_text2 == 1) && (box_text2 % 2 == 0)) {
    horizontal_length = 1;
    vertical_length = 1;
    vertical_pos = 0;
  } else if ((size_text2 == 1) && (box_text2 % 2 != 0)) {
    horizontal_length = 1;
    vertical_length = 1;
    vertical_pos = 1;
  };

  // horizontal upper line
  line(x_coord_text2,                                // x1 
      y_coord_text2,                                 // y1
      x_coord_text2 + horizontal_length * box_width, // x2
      y_coord_text2);                                // y2
  // hotizontal lower line
  line(x_coord_text2,
      y_coord_text2 + vertical_length * box_height,  // y1
      x_coord_text2 + horizontal_length * box_width, // x2
      y_coord_text2 + vertical_length * box_height); // y2

  // vertical line
  line(x_coord_text2 + vertical_pos * box_width,     // x1 
      y_coord_text2,                                 // y1
      x_coord_text2 + vertical_pos * box_width,      // x2
      y_coord_text2 + vertical_length * box_height); // y2
}



if (size_img != 0){
  // img border
  if (size_img == 4) {
    horizontal_length = 2; // width of border
    vertical_length = 2;   // height of border
    vertical_pos = 0;      // is line in center required
  } else if (size_img == 3){
    horizontal_length = 2; // width of border
    vertical_length = 1;   // height of border
    vertical_pos = 0;      // is line in center required
  } else if ((size_img == 2) && (box_img % 2 == 0)){
    horizontal_length = 1; // width of border
    vertical_length = 2;   // height of border
    vertical_pos = 0;      // is line in center required
  } else if ((size_img == 2) && (box_img % 2 != 0)){
    horizontal_length = 1;
    vertical_length = 2;
    vertical_pos = 1;
  } else if ((size_img == 1) && (box_img % 2 == 0)) {
    horizontal_length = 1;
    vertical_length = 1;
    vertical_pos = 0;
  } else if ((size_img == 1) && (box_img % 2 != 0)) {
    horizontal_length = 1;
    vertical_length = 1;
    vertical_pos = 1;
  };

  // horizontal upper line
  line(x_coord_img,                                // x1 
      y_coord_img,                                 // y1
      x_coord_img + horizontal_length * box_width, // x2
      y_coord_img);                                // y2
  // hotizontal lower line
  line(x_coord_img,
      y_coord_img + vertical_length * box_height,  // y1
      x_coord_img + horizontal_length * box_width, // x2
      y_coord_img + vertical_length * box_height); // y2

  // vertical line
  line(x_coord_img + vertical_pos * box_width,     // x1 
      y_coord_img,                                 // y1
      x_coord_img + vertical_pos * box_width,      // x2
      y_coord_img + vertical_length * box_height); // y2
}

if (size_img2 != 0){
  // img border
  if (size_img2 == 4) {
    horizontal_length = 2; // width of border
    vertical_length = 2;   // height of border
    vertical_pos = 0;      // is line in center required
  } else if (size_img2 == 3){
    horizontal_length = 2; // width of border
    vertical_length = 1;   // height of border
    vertical_pos = 0;      // is line in center required
  } else if ((size_img2 == 2) && (box_img2 % 2 == 0)){
    horizontal_length = 1; // width of border
    vertical_length = 2;   // height of border
    vertical_pos = 0;      // is line in center required
  } else if ((size_img2 == 2) && (box_img2 % 2 != 0)){
    horizontal_length = 1;
    vertical_length = 2;
    vertical_pos = 1;
  } else if ((size_img2 == 1) && (box_img2 % 2 == 0)) {
    horizontal_length = 1;
    vertical_length = 1;
    vertical_pos = 0;
  } else if ((size_img2 == 1) && (box_img2 % 2 != 0)) {
    horizontal_length = 1;
    vertical_length = 1;
    vertical_pos = 1;
  };

  // horizontal upper line
  line(x_coord_img2,                                // x1 
      y_coord_img2,                                 // y1
      x_coord_img2 + horizontal_length * box_width, // x2
      y_coord_img2);                                // y2
  // hotizontal lower line
  line(x_coord_img2,
      y_coord_img2 + vertical_length * box_height,  // y1
      x_coord_img2 + horizontal_length * box_width, // x2
      y_coord_img2 + vertical_length * box_height); // y2

  // vertical line
  line(x_coord_img2 + vertical_pos * box_width,     // x1 
      y_coord_img2,                                 // y1
      x_coord_img2 + vertical_pos * box_width,      // x2
      y_coord_img2 + vertical_length * box_height); // y2
}


if (size_img3 != 0){
  // img border
  if (size_img3 == 4) {
    horizontal_length = 2; // width of border
    vertical_length = 2;   // height of border
    vertical_pos = 0;      // is line in center required
  } else if (size_img3 == 3){
    horizontal_length = 2; // width of border
    vertical_length = 1;   // height of border
    vertical_pos = 0;      // is line in center required
  } else if ((size_img3 == 2) && (box_img3 % 2 == 0)){
    horizontal_length = 1; // width of border
    vertical_length = 2;   // height of border
    vertical_pos = 0;      // is line in center required
  } else if ((size_img3 == 2) && (box_img3 % 2 != 0)){
    horizontal_length = 1;
    vertical_length = 2;
    vertical_pos = 1;
  } else if ((size_img3 == 1) && (box_img3 % 2 == 0)) {
    horizontal_length = 1;
    vertical_length = 1;
    vertical_pos = 0;
  } else if ((size_img3 == 1) && (box_img3 % 2 != 0)) {
    horizontal_length = 1;
    vertical_length = 1;
    vertical_pos = 1;
  };

  // horizontal upper line
  line(x_coord_img3,                                // x1 
      y_coord_img3,                                 // y1
      x_coord_img3 + horizontal_length * box_width, // x2
      y_coord_img3);                                // y2
  // hotizontal lower line
  line(x_coord_img3,
      y_coord_img3 + vertical_length * box_height,  // y1
      x_coord_img3 + horizontal_length * box_width, // x2
      y_coord_img3 + vertical_length * box_height); // y2

  // vertical line
  line(x_coord_img3 + vertical_pos * box_width,     // x1 
      y_coord_img3,                                 // y1
      x_coord_img3 + vertical_pos * box_width,      // x2
      y_coord_img3 + vertical_length * box_height); // y2
}


if (size_date != 0){
  // border date
  // horizontal upper line
  line(x_coord_date,                                // x1 
      y_coord_date,                                 // y1
      x_coord_date + box_width, // x2
      y_coord_date);                                // y2
  // hotizontal lower line
  line(x_coord_date,
      y_coord_date + box_height,  // y1
      x_coord_date + box_width, // x2
      y_coord_date + box_height); // y2

  // vertical line
  line(x_coord_date + box_width,     // x1 
      y_coord_date,                                 // y1
      x_coord_date + box_width,      // x2
      y_coord_date + box_height); // y2
}

if (size_location != 0){
  // border location
  // horizontal upper line
  line(x_coord_location,                                // x1 
      y_coord_location,                                 // y1
      x_coord_location + box_width, // x2
      y_coord_location);                                // y2
  // hotizontal lower line
  line(x_coord_location,
      y_coord_location + box_height,  // y1
      x_coord_location + box_width, // x2
      y_coord_location + box_height); // y2

  // vertical line
  line(x_coord_location + box_width,     // x1 
      y_coord_location,                                 // y1
      x_coord_location + box_width,      // x2
      y_coord_location + box_height); // y2
}

// border empty boxes
if (EMPTY_BOXES[0] != 0){
  for (int i : EMPTY_BOXES) {
    TableRow grid_row = grid.getRow(i-1);
    Float x_coord = grid_row.getFloat("x_coord");
    Float y_coord = grid_row.getFloat("y_coord");
    // horizontal upper line
    line(x_coord,
        y_coord,
        x_coord + box_width,
        y_coord);

    // horizontal lower line
    line(x_coord,
        y_coord + box_height,
        x_coord + box_width,
        y_coord + box_height);

    // vertical left line
    line(x_coord,
        y_coord,
        x_coord,
        y_coord + box_height);

    // vertical right line
    line(x_coord + box_width,
        y_coord,
        x_coord + box_width,
        y_coord + box_height);
  }
}
// }}}
// ------------------------------- DRAW SHAPE ----
// {{{============================================
//rand = (int)random(6);
//----------------------------------------
rand = 5;
fill(col);
stroke(0);
strokeWeight(2);
ellipse(
    left_border + shape_param[0],
    border + shape_param[1],
    shape_param[2] * 2 * box_width - 60,
    shape_param[3] * 2 * box_height - 60);

//----------------------------------------
//// shape same size as img
//if (rand == 1){
//  ellipse(
//      x_coord_img + 0.5 * img_width,
//      y_coord_img + 0.5 * img_height,
//      img_width - 40,
//      img_height- 40);
//  //shape half size as img
//} else if (rand == 2){
//  ellipse(
//      x_coord_img + 0.25 * img_width,
//      y_coord_img + 0.25 * img_height,
//      img_width - 40,
//      img_height- 40);
//} else if (rand == 3){
//  ellipse(
//      x_coord_img + 0.75 * img_width,
//      y_coord_img + 0.75 * img_height,
//      img_width - 40,
//      img_height- 40);
//} else if (rand == 4){
//  ellipse(
//      left_border + box_width,
//      border + 1.5 * box_height,
//      box_width * 2 - 40,
//      box_height * 3 - 40);
//} else if (rand == 5){
//  ellipse(
//      left_border + box_width,
//      height - border - 1.5 * box_height,
//      box_width * 2 - 40,
//      box_height * 3 - 40);
//}


// }}}

// ------------------------------- DRAW BADGE ----
// {{{============================================
int badge_color = 0;
int badge_text_color = 255;
float badge_radius = box_height * 1.3;
float x_coord_badge = random(left_border + badge_radius, width - (border + badge_radius));
float y_coord_badge = random(border + badge_radius, height - (border + badge_radius));

rand = (int)random(2);
//if (rand == 1){
fill(badge_color);
ellipse(
    x_coord_badge,
    y_coord_badge,
    badge_radius,
    badge_radius);
fill(badge_text_color);
textAlign(CENTER, CENTER);
textFont(font_mono);  
textSize(chapter_text_size);
textLeading(text_line_height);
text(badge_text,
    x_coord_badge,
    y_coord_badge);
//}
// }}}

//// -------------------------------- DRAW LOGO ----
//// {{{============================================
//fill(0);
//textFont(font_mono);
//textAlign(LEFT, TOP);
//text("script::script",
//    grid[10][1],
//    grid[10][2] + box_height);
////2 * box_width - 2 * title_offset,
////2 * box_height - 2 * title_offset);
//
// }}}


//// -------------------------------- SIGNATURE ----
//// {{{============================================
textFont(font_regular);
fill(0);
textAlign(LEFT, TOP);
textSize(chapter_text_size/1.5);
textLeading(text_line_height);
text("Erstellt mit dem Layabout-Script",
    left_border - 2,  // x text start
    height - border + 2);  // y text start

textAlign(RIGHT, TOP);
text("7er Studio × Ristretti",
    width - border - 2,  // x text start
    height - border + 2);  // y text start



// }}}
