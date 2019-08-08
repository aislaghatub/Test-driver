pcl_file = "Driver_pilot_ver10.pcl";
default_path = "E://Aisling//Test driver//Videos//";

response_matching = simple_matching;
response_logging = log_active;
active_buttons = 3;
button_codes = 120, 125, 124;

write_codes = true; 
pulse_width = 10;

begin;

picture {} default;

trial {   
   picture {
	
      text { caption = " "; font_size = 20;} instruc_text;
      x = 0; y = 0;
   } instruc_pic;
} instruc_trl;


trial {
picture {
    default_code = "picr";
    text { caption=" "; font_size = 20;} response_text;
    x = 0; y = 0;
} pic1;
} trial1;


bitmap { filename = "box_unchecked.bmp"; } box_unchecked;
bitmap { filename = "box_checked.bmp"; } box_checked;
bitmap { filename = "cursor.bmp"; transparent_color = 112, 112, 112; } cursor;

# array of text for correct words
array{	
	text { caption = ""; font_size = 20; font_color = 64, 64, 64; }txt1; 
	text { caption = ""; font_size = 20; font_color = 64, 64, 64; }txt2; 
	text { caption = ""; font_size = 20; font_color = 64, 64, 64; }txt3; 
	text { caption = ""; font_size = 20; font_color = 64, 64, 64; }txt4; 
	text { caption = ""; font_size = 20; font_color = 64, 64, 64; }txt5; 
} words4pic;

picture {
	text { 
		caption = " "; 
		font_size = 36; 
		font_color = 64, 64, 64; 
	} intro_txt;
	x = 0; y = 0;
} intro_pic;

picture {
   bitmap { 
		filename = "crosshair.png"; 
	} default_start_pic;
   x = 0; y = 0;
} start_pic;

video { 
	filename = "s1_face_audio123.avi";
	x = -500; y = 0; # left position
	#x = 500; y = 0; # right position
   height = 896; width = 672; 
	#end_time = 3000;  #for debugging 
} vid;

picture {
   bitmap { 
		filename = "crosshair.png"; 
	} default_end_pic;
   x = 0; y = 0;
} end_pic;

picture {
	text { 
		caption = " "; 
		font_size = 36; 
		font_color = 64, 64, 64; 
	} finish_txt;
	x = 0; y = 0;
} finish_pic;

trial {
   trial_duration = forever;
   trial_type = specific_response;
	terminator_button = 2;
	picture intro_pic;
} intro_trial;

trial {
	picture start_pic;
	time = 0;
	nothing {};
	code = "126";
	port_code = 126;
	time = 1000;
} start_trial;

trial {
	stimulus_event {
		video vid;
		code = "0,0";
		port_code = 0;
		time = 1000;
	} stim_event;
	picture end_pic;
} stim_trial;

trial {
	nothing {};
	code = "127";
	port_code = 127;
	time = 2000;
} stop_trial;

	
trial {
   trial_duration = forever;
   trial_type = specific_response;
	terminator_button = 2;
	picture finish_pic;
} finish_trial;