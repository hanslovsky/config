--[[
Conky Widgets by londonali1010 (2009)

This script is meant to be a "shell" to hold a suite of widgets for use in Conky.

To configure:
+ Copy the widget's code block (will be framed by --(( WIDGET NAME )) and --(( END WIDGET NAME )), with "[" instead of "(") somewhere between "require 'cairo'" and "function conky_widgets()", ensuring not to paste into another widget's code block
+ To call the widget, add the following between "cr = cairo_create(cs)" and "cairo_destroy(cr)" at the end of the script:
	NAME_OF_FUNCTION(cr, OPTIONS)
+ Replace OPTIONS with the options for your widget (should be specified in the widget's code block) 

Call this script in Conky using the following before TEXT (assuming you save this script to ~/scripts/conky_widgets.lua):
	lua_load ~/scripts/conky_widgets.lua
	lua_draw_hook_pre widgets
	
Changelog:
+ v1.1 -- Simplified calls to widgets by implementing a global drawing surface, and included imlib2 by default (03.11.2009)
+ v1.0 -- Original release (17.10.2009)
]]

require 'cairo'
require 'imlib2'

--[[ AIR CLOCK WIDGET ]]
--[[ v1.1 by londonali1010 (2009) ]]
--[[ Options (xc, yc, size):
	"xc" and "yc" are the x and y coordinates of the centre of the clock, in pixels, relative to the top left of the Conky window
	"size" is the total size of the widget, in pixels ]]

function air_clock(xc, yc, size)
	local offset = 0
	
	shadow_width = size * 0.03
	shadow_xoffset = 0
	shadow_yoffset = size * 0.01
	
	if shadow_xoffset >= shadow_yoffset then
		offset = shadow_xoffset
	else offset = shadow_yoffset
	end
	
	local clock_r = (size - 2 * offset) / (2 * 1.25)
		
	show_seconds=true
	
	-- Grab time
	
	local hours=os.date("%I")
	local mins=os.date("%M")
	local secs=os.date("%S")
	
	secs_arc=(2*math.pi/60)*secs
	mins_arc=(2*math.pi/60)*mins
	hours_arc=(2*math.pi/12)*hours+mins_arc/12
	
	-- Drop shadow
	
	local ds_pat=cairo_pattern_create_radial(xc+shadow_xoffset,yc+shadow_yoffset,clock_r*1.25,xc+shadow_xoffset,yc+shadow_yoffset,clock_r*1.25+shadow_width)
	cairo_pattern_add_color_stop_rgba(ds_pat,0,0,0,0,0.2)
	cairo_pattern_add_color_stop_rgba(ds_pat,1,0,0,0,0)
	
	cairo_move_to(cr,0,0)
	cairo_line_to(cr,conky_window.width,0)
	cairo_line_to(cr,conky_window.width, conky_window.height)
	cairo_line_to(cr,0,conky_window.height)
	cairo_close_path(cr)
	cairo_new_sub_path(cr)
	cairo_arc(cr,xc,yc,clock_r*1.25,0,2*math.pi)
	cairo_set_source(cr,ds_pat)
	cairo_set_fill_rule(cr,CAIRO_FILL_RULE_EVEN_ODD)
	cairo_fill(cr)
	
	-- Glassy border
	
	cairo_arc(cr,xc,yc,clock_r*1.25,0,2*math.pi)
	cairo_set_source_rgba(cr,0.5,0.5,0.5,0.2)
	cairo_set_line_width(cr,1)
	cairo_stroke(cr)
	
	local border_pat=cairo_pattern_create_linear(xc,yc-clock_r*1.25,xc,yc+clock_r*1.25)
	
	cairo_pattern_add_color_stop_rgba(border_pat,0,1,1,1,0.7)
	cairo_pattern_add_color_stop_rgba(border_pat,0.3,1,1,1,0)
	cairo_pattern_add_color_stop_rgba(border_pat,0.5,1,1,1,0)
	cairo_pattern_add_color_stop_rgba(border_pat,0.7,1,1,1,0)
	cairo_pattern_add_color_stop_rgba(border_pat,1,1,1,1,0.7)
	cairo_set_source(cr,border_pat)
	cairo_arc(cr,xc,yc,clock_r*1.125,0,2*math.pi)
	cairo_close_path(cr)
	cairo_set_line_width(cr,clock_r*0.25)
	cairo_stroke(cr)
	
	-- Set clock face
	
	cairo_arc(cr,xc,yc,clock_r,0,2*math.pi)
	cairo_close_path(cr)
	
	local face_pat=cairo_pattern_create_radial(xc,yc-clock_r*0.75,0,xc,yc,clock_r)
	
	cairo_pattern_add_color_stop_rgba(face_pat,0,1,1,1,0.9)
	cairo_pattern_add_color_stop_rgba(face_pat,0.5,1,1,1,0.9)
	cairo_pattern_add_color_stop_rgba(face_pat,1,0.9,0.9,0.9,0.9)
	cairo_set_source(cr,face_pat)
	cairo_fill_preserve(cr)
	cairo_set_source_rgba(cr,0.5,0.5,0.5,0.2)
	cairo_set_line_width(cr, 1)
	cairo_stroke (cr)
	
	-- Draw hour hand
	
	xh=xc+0.7*clock_r*math.sin(hours_arc)
	yh=yc-0.7*clock_r*math.cos(hours_arc)
	cairo_move_to(cr,xc,yc)
	cairo_line_to(cr,xh,yh)
	
	cairo_set_line_cap(cr,CAIRO_LINE_CAP_ROUND)
	cairo_set_line_width(cr,5)
	cairo_set_source_rgba(cr,0,0,0,0.5)
	cairo_stroke(cr)
	
	-- Draw minute hand
	
	xm=xc+0.9*clock_r*math.sin(mins_arc)
	ym=yc-0.9*clock_r*math.cos(mins_arc)
	cairo_move_to(cr,xc,yc)
	cairo_line_to(cr,xm,ym)
	
	cairo_set_line_width(cr,3)
	cairo_stroke(cr)
	
	-- Draw seconds hand
	
	if show_seconds then
		xs=xc+0.9*clock_r*math.sin(secs_arc)
		ys=yc-0.9*clock_r*math.cos(secs_arc)
		cairo_move_to(cr,xc,yc)
		cairo_line_to(cr,xs,ys)
	
		cairo_set_line_width(cr,1)
		cairo_stroke(cr)
	end

	cairo_set_line_cap(cr, CAIRO_LINE_CAP_BUTT)
end

--[[ END AIR CLOCK WIDGET ]]

--[[ CLOCK HANDS WIDGET ]]
--[[ v1.1 by londonali1010 (2009) ]]
--[[ Options (xc, yc, colour, alpha, show_secs, size):
	"xc" and "yc" are the x and y coordinates of the centre of the clock hands, in pixels, relative to the top left corner of the Conky window
	"colour" is the colour of the clock hands, in Ox33312c formate
	"alpha" is the alpha of the hands, between 0 and 1
	"show_secs" is a boolean; set to TRUE to show the seconds hand, otherwise set to FALSE
	"size" is the total size of the widget (e.g. twice the length of the minutes hand), in pixels ]]

function clock_hands(xc, yc, colour, alpha, show_secs, size)
	local function rgb_to_r_g_b(colour,alpha)
		return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
	end
	
	local secs,mins,hours,secs_arc,mins_arc,hours_arc
	local xh,yh,xm,ym,xs,ys

	secs=os.date("%S")
	mins=os.date("%M")
	hours=os.date("%I")

	secs_arc=(2*math.pi/60)*secs
	mins_arc=(2*math.pi/60)*mins+secs_arc/60
	hours_arc=(2*math.pi/12)*hours+mins_arc/12

	xh=xc+0.4*size*math.sin(hours_arc)
	yh=yc-0.4*size*math.cos(hours_arc)
	cairo_move_to(cr,xc,yc)
	cairo_line_to(cr,xh,yh)

	cairo_set_line_cap(cr,CAIRO_LINE_CAP_ROUND)
	cairo_set_line_width(cr,5)
	cairo_set_source_rgba(cr,rgb_to_r_g_b(colour,alpha))
	cairo_stroke(cr)

	xm=xc+0.5*size*math.sin(mins_arc)
	ym=yc-0.5*size*math.cos(mins_arc)
	cairo_move_to(cr,xc,yc)
	cairo_line_to(cr,xm,ym)

	cairo_set_line_width(cr,3)
	cairo_stroke(cr)

	if show_secs then
		xs=xc+0.5*size*math.sin(secs_arc)
		ys=yc-0.5*size*math.cos(secs_arc)
		cairo_move_to(cr,xc,yc)
		cairo_line_to(cr,xs,ys)

		cairo_set_line_width(cr,1)
		cairo_stroke(cr)
	end

	cairo_set_line_cap(cr,CAIRO_LINE_CAP_BUTT)
end

--[[ END CLOCK HANDS WIDGET ]]

--[[ PHOTO ALBUM WIDGET ]]
--[[ v1.0 by londonali1010 (2009) ]]
--[[ Options (album_dir, xc, yc, w_max, h_max, t, update_interval)
    "album_dir" is the directory containing the images for your photo album; please note that the path must be absolute (e.g. no "~")
    "xc" and "yc" are the coordinates of the centre of the photo album, relative to the top left corner of the Conky window, in pixels
    "w_max" and "h_max" are the maximum dimensions, in pixels, that you want the widget to be.  The script will ensure that the photo album fits inside the box bounded by w_max and h_max
    "t" is the thickness of the frame, in pixels
    "update_interval" is the number of Conky updates between refreshes ]]

function photo_album(album_dir, xc, yc, w_max, h_max, t, update_interval)
    local function get_file_to_use()
        num_files = tonumber(conky_parse("${exec ls -A " .. album_dir .. " | wc -l}"))
        if num_files == nil then num_files = 0 end
        if num_files == 0 then return "none" end
    
        updates = tonumber(conky_parse("${updates}"))
        whole = math.ceil(updates/update_interval)
    
        if whole <= num_files
        then
            num_file_to_show = whole
        else
            whole = whole % num_files
            num_file_to_show = whole
        end
    
        return conky_parse("${exec ls " .. album_dir .. " | sed -n " .. num_file_to_show .. "p}")
    end

    function init_drawing_surface()
        imlib_set_cache_size(4096 * 1024)
        imlib_context_set_dither(1)
    end

    function draw_frame()
        cairo_rectangle(cr, xc - width/2 - t, yc - height/2 - t, width + 2*t, height + 2*t)
        cairo_set_source_rgba(cr, 1, 1, 1, 0.8)
        cairo_fill(cr)   
    end

    function draw_image()
        init_drawing_surface()
    
        image = imlib_load_image(album_dir .. filename)
        if image == nil then return end
        imlib_context_set_image(image)
	
    	w_img, h_img = imlib_image_get_width(), imlib_image_get_height()
    	if w_img >= h_img
    	then
    	    width = w_max - 2*t
    	    height = width * (h_img/w_img)
    	else
    	    height = h_max - 2*t
    	    width = height * (w_img/h_img)
    	end
    	
    	draw_frame()
    	
    	buffer = imlib_create_image(width, height)
    	imlib_context_set_image(buffer)
    	
    	imlib_blend_image_onto_image(image, 0, 0, 0, w_img, h_img, 0, 0, width, height)
    	imlib_context_set_image(image)
    	imlib_free_image()
    	
    	imlib_context_set_image(buffer)
    	imlib_render_image_on_drawable(xc - width/2, yc - height/2)
    	imlib_free_image()
    end

    if conky_window == nil then return end
    filename = get_file_to_use()
    if filename == "none"
    then
        print(album_dir .. ": No files found")
    else
        draw_image()
    end
end

--[[ END PHOTO ALBUM WIDGET ]]

--[[ RING WIDGET ]]
--[[ v1.1 by londonali1010 (2009) ]]
--[[ Options (name, arg, max, bg_colour, bg_alpha, xc, yc, radius, thickness, start_angle, end_angle):
	"name" is the type of stat to display; you can choose from 'cpu', 'memperc', 'fs_used_perc', 'battery_used_perc'.
	"arg" is the argument to the stat type, e.g. if in Conky you would write ${cpu cpu0}, 'cpu0' would be the argument. If you would not use an argument in the Conky variable, use ''.
	"max" is the maximum value of the ring. If the Conky variable outputs a percentage, use 100.
	"bg_colour" is the colour of the base ring.
	"bg_alpha" is the alpha value of the base ring.
	"fg_colour" is the colour of the indicator part of the ring.
	"fg_alpha" is the alpha value of the indicator part of the ring.
	"x" and "y" are the x and y coordinates of the centre of the ring, relative to the top left corner of the Conky window.
	"radius" is the radius of the ring.
	"thickness" is the thickness of the ring, centred around the radius.
	"start_angle" is the starting angle of the ring, in degrees, clockwise from top. Value can be either positive or negative.
	"end_angle" is the ending angle of the ring, in degrees, clockwise from top. Value can be either positive or negative, but must be larger (e.g. more clockwise) than start_angle. ]]

function ring(name, arg, max, bgc, bga, fgc, fga, xc, yc, r, t, sa, ea)
	local function rgb_to_r_g_b(colour, alpha)
		return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
	end
	
	local function draw_ring(pct)
		local angle_0 = sa * (2 * math.pi/360) - math.pi/2
		local angle_f = ea * (2 * math.pi/360) - math.pi/2
		local pct_arc = pct * (angle_f - angle_0)

		-- Draw background ring

		cairo_arc(cr, xc, yc, r, angle_0, angle_f)
		cairo_set_source_rgba(cr, rgb_to_r_g_b(bgc, bga))
		cairo_set_line_width(cr, t)
		cairo_stroke(cr)
	
		-- Draw indicator ring

		cairo_arc(cr, xc, yc, r, angle_0, angle_0 + pct_arc)
		cairo_set_source_rgba(cr, rgb_to_r_g_b(fgc, fga))
		cairo_stroke(cr)
	end
	
	local function setup_ring()
		local str = ''
		local value = 0
		
		str = string.format('${%s %s}', name, arg)
		str = conky_parse(str)
		
		value = tonumber(str)
		if value == nil then value = 0 end
		pct = value/max
		
		draw_ring(pct)
	end	
	
	local updates = conky_parse('${updates}')
	update_num = tonumber(updates)
	
	if update_num > 5 then setup_ring() end
end

--[[ END RING WIDGET ]]

--[[ RING (COUNTER-CLOCKWISE) WIDGET ]]
--[[ v1.1 by londonali1010 (2009) ]]
--[[ Options (name, arg, max, bg_colour, bg_alpha, xc, yc, radius, thickness, start_angle, end_angle):
	"name" is the type of stat to display; you can choose from 'cpu', 'memperc', 'fs_used_perc', 'battery_used_perc'.
	"arg" is the argument to the stat type, e.g. if in Conky you would write ${cpu cpu0}, 'cpu0' would be the argument. If you would not use an argument in the Conky variable, use ''.
	"max" is the maximum value of the ring. If the Conky variable outputs a percentage, use 100.
	"bg_colour" is the colour of the base ring.
	"bg_alpha" is the alpha value of the base ring.
	"fg_colour" is the colour of the indicator part of the ring.
	"fg_alpha" is the alpha value of the indicator part of the ring.
	"x" and "y" are the x and y coordinates of the centre of the ring, relative to the top left corner of the Conky window.
	"radius" is the radius of the ring.
	"thickness" is the thickness of the ring, centred around the radius.
	"start_angle" is the starting angle of the ring, in degrees, counter-clockwise from top. Value can be either positive or negative.
	"end_angle" is the ending angle of the ring, in degrees, counter-clockwise from top. Value can be either positive or negative, but must be larger (e.g. more counter-clockwise) than start_angle. ]]

function ring_ccw(name, arg, max, bgc, bga, fgc, fga, xc, yc, r, t, sa, ea)
	local function rgb_to_r_g_b(colour, alpha)
		return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
	end
	
	local function draw_ring(pct)
		local angle_0 = sa * (2 * math.pi/360) - math.pi/2
		local angle_f = ea * (2 * math.pi/360) - math.pi/2
		local pct_arc = pct * (angle_f - angle_0)

		-- Draw background ring

		cairo_arc_negative(cr, xc, yc, r, angle_0, angle_f)
		cairo_set_source_rgba(cr, rgb_to_r_g_b(bgc, bga))
		cairo_set_line_width(cr, t) 
		cairo_stroke(cr)
	
		-- Draw indicator ring

		cairo_arc_negative(cr, xc, yc, r, angle_0, angle_0 - pct_arc)
		cairo_set_source_rgba(cr, rgb_to_r_g_b(fgc, fga))
		cairo_stroke(cr)
	end
	
	local function setup_ring()
		local str = ''
		local value = 0
		
		str = string.format('${%s %s}', name, arg)
		str = conky_parse(str)
		
		value = tonumber(str)
		if value == nil then value = 0 end
		pct = value/max
		
		draw_ring(pct)
	end	
	
	local updates = conky_parse('${updates}')
	update_num = tonumber(updates)
	
	if update_num > 5 then setup_ring() end
end

--[[ END RING (COUNTER-CLOCKWISE) WIDGET ]]

--[[ ROUNDED RECTANGLE WIDGET ]]
--[[ v1.0 by londonali1010 (2009) ]]
--[[ Options (x0, y0, width, height, radius, colour, alpha):
	"x0" and "y0" are the coordinates (in pixels) of the top left of the rectangle, relative to the top left of the Conky window.
	"width" and "height" are the width and height of the rectangle, respectively.
	"radius" is the rounding radius of the corners, in pixels.
	"colour" is the colour of the rectangle, in format 0xRRGGBB.
	"alpha" is the transparency of the rectangle, from 0.0 (transparent) -> 1.0 (opaque) ]]

function round_rect(x0, y0, w, h, r, colour, alpha)
	local function rgb_to_r_g_b(colour, alpha)
		return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
	end
	
	cairo_move_to(cr, x0, y0)
	cairo_rel_move_to(cr, r, 0)
	cairo_rel_line_to(cr, w-2*r, 0)
	cairo_rel_curve_to(cr, r, 0, r, 0, r, r)
	cairo_rel_line_to(cr, 0, h-2*r)
	cairo_rel_curve_to(cr, 0, r, 0, r, -r, r)
	cairo_rel_line_to(cr, -(w-2*r), 0)
	cairo_rel_curve_to(cr, -r, 0, -r, 0, -r, -r)
	cairo_rel_line_to(cr, 0, -(h-2*r))
	cairo_rel_curve_to(cr, 0, -r, 0, -r, r, -r)
	cairo_close_path(cr)

	cairo_set_source_rgba(cr, rgb_to_r_g_b(colour, alpha))
	cairo_fill(cr)
end
	
--[[ END ROUNDED RECTANGLE WIDGET ]]

function conky_widgets()
	if conky_window == nil then return end
	local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
	cr = cairo_create(cs)

	ring('time', '%S', 60, 0x000000, 0.2, 0x000000, 0.8, 463, 55, 50, 5, 0, 360)
	clock_hands(463, 55, 0x000000, 0.8, false, 85)
	ring('battery_percent', 'BAT1', 100, 0x000000, 0.2, 0x000000, 0.8, 573, 55, 50, 5, 0, 360)
	ring('cpu', 'cpu0', 100, 0x000000, 0.2, 0x000000, 0.8, 683, 55, 50, 5, 0, 360)
	ring('memperc', '', 100, 0x000000, 0.2, 0x000000, 0.8, 793, 55, 50, 5, 0, 360)
	ring('fs_used_perc', '/', 100, 0x000000, 0.2, 0x000000, 0.8, 903, 55, 50, 5, 0, 360)
	
	
	cairo_destroy(cr)
end
