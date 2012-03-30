/*
 * 	AppController.j
 * 	Font and Text Framework for Cappucino
 *
 * 	Created by Ibragimov Ruslan on March 30, 2012.
 * 	Copyright 2012 Lucid Dream Software, Inc.
 * 	 
 * 	
 * 	This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 * 	(at your option) any later version.
 * 	
 * 	This program is distributed in the hope that it will be useful,
 * 	but WITHOUT ANY WARRANTY; without even the implied warranty of
 * 	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * 	GNU General Public License for more details.
 
 *  You should have received a copy of the GNU General Public License
 * 	along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

@import <Foundation/CPObject.j>

var label = nil;
var input = nil;
var getButton = nil;
var sendButton = nil;
var textField = nil;
var ajax = nil;
var font = nil;
var fontSize = nil;
var color = nil;
var colorField = nil;
var style = nil;
var align = nil;
var slider = nil;
var label61 = nil;
var angle = nil;
var valign = nil;
var weight = nil;

@implementation AppController : CPObject
{
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{

	angle = 0;
	valign = @"top";
	weight = @"normal";

	ajax = [[Ajax alloc] init];

    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

	getButton = [[CPButton alloc] initWithFrame:CGRectMake(502,23, 100, 25)];

	[getButton setTitle: @"Myriad Pro"];
	[getButton setTarget:self];
	[getButton setAction:@selector(get:)];

	[contentView addSubview:getButton];

	textField = [CPTextField textFieldWithStringValue:@"Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.\n\nThe quick brown fox jumped over the long lazy dog as he was sleeping off a hard night of chasing other rabbits. This resulted in the fox startling to a sudden awake state." placeholder:@"Type here" width:180];
	
	[textField setLineBreakMode:CPLineBreakByWordWrapping];
	
	[textField setFrame:CGRectMake(0,0,500,400)];
	font = @"myriad-pro";
	style = @"normal";
	fontSize = 20;
	[textField setValue: style + @" " + fontSize + @"pt "+@" "+font forThemeAttribute:@"font"];
	[textField setEditable:NO];
	
	align = @"left";
	
	[contentView addSubview:textField];
	
	label61 = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
    
    [label61 setStringValue:@"Rotation: 0"];
    [label61 setFont:[CPFont boldSystemFontOfSize:20.0]];

    [label61 sizeToFit];

    [label61 setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [label61 setCenter:CGPointMake(552,290)];
    [contentView addSubview:label61];
	
	slider = [[CPSlider alloc] initWithFrame:CGRectMake(502, 300, 100, 50)];
	
	[slider setMinValue: 0];
	[slider setMaxValue: 360];
	[slider setValue: 0];
	
	[slider setTarget:self];
	[slider setAction:@selector(slide:)];
	
	[contentView addSubview:slider];
	
	sendButton = [[CPButton alloc] initWithFrame:CGRectMake(502,50, 100, 25)];

	[sendButton setTitle: @"Arno Pro"];
	[sendButton setTarget:self];
	[sendButton setAction:@selector(send:)];
	
	[contentView addSubview:sendButton];
	
	sendButton11 = [[CPButton alloc] initWithFrame:CGRectMake(502,77, 100, 25)];

	[sendButton11 setTitle: @"Chapparal Pro"];
	[sendButton11 setTarget:self];
	[sendButton11 setAction:@selector(chap:)];
	
	[contentView addSubview:sendButton11];
	
	sendButton2 = [[CPButton alloc] initWithFrame:CGRectMake(612,23, 100, 25)];

	[sendButton2 setTitle: @"10"];
	[sendButton2 setTag: 10];
	[sendButton2 setTarget:self];
	[sendButton2 setAction:@selector(setSize:)];
	
	[contentView addSubview:sendButton2];
	
	sendButton3 = [[CPButton alloc] initWithFrame:CGRectMake(612,50, 100, 25)];

	[sendButton3 setTitle: @"12"];
	[sendButton3 setTag: 12];
	[sendButton3 setTarget:self];
	[sendButton3 setAction:@selector(setSize:)];
	
	[contentView addSubview:sendButton3];
	
	sendButton4 = [[CPButton alloc] initWithFrame:CGRectMake(612,77, 100, 25)];

	[sendButton4 setTitle: @"14"];
	[sendButton4 setTag: 14];
	[sendButton4 setTarget:self];
	[sendButton4 setAction:@selector(setSize:)];
	
	[contentView addSubview:sendButton4];
	
	sendButton5 = [[CPButton alloc] initWithFrame:CGRectMake(612,104, 100, 25)];

	[sendButton5 setTitle: @"20"];
	[sendButton5 setTag: 20];
	[sendButton5 setTarget:self];
	[sendButton5 setAction:@selector(setSize:)];
	
	[contentView addSubview:sendButton5];
	
	sendButton6 = [[CPButton alloc] initWithFrame:CGRectMake(722,23, 100, 25)];

	[sendButton6 setTitle: @"Get JSON"];
	[sendButton6 setTag: 10];
	[sendButton6 setTarget:self];
	[sendButton6 setAction:@selector(getJSON:)];
	
	[contentView addSubview:sendButton6];

    label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];

    [label setStringValue:@"Fonts"];
    [label setFont:[CPFont boldSystemFontOfSize:20.0]];

    [label sizeToFit];

    [label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [label setCenter:CGPointMake(530,13)];

    [contentView addSubview:label];
    
    label2 = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];

    [label2 setStringValue:@"Size"];
    [label2 setFont:[CPFont boldSystemFontOfSize:20.0]];

    [label2 sizeToFit];

    [label2 setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [label2 setCenter:CGPointMake(640,13)];

	[contentView addSubview:label2];
	
	label3 = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];

    [label3 setStringValue:@"Color"];
    [label3 setFont:[CPFont boldSystemFontOfSize:20.0]];

    [label3 sizeToFit];

    [label3 setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [label3 setCenter:CGPointMake(890,13)];
    [contentView addSubview:label3];
	
	colorField = [CPTextField textFieldWithStringValue:@"000000" placeholder:@"000000" width:80];
	[colorField setCenter:CGPointMake(900, 33)];
	[contentView addSubview:colorField];
	
	color = @"000000";
	
	sendButton7 = [[CPButton alloc] initWithFrame:CGRectMake(860,48, 80, 25)];

	[sendButton7 setTitle: @"Set"];
	[sendButton7 setTag: 10];
	[sendButton7 setTarget:self];
	[sendButton7 setAction:@selector(setColor:)];
	[contentView addSubview:sendButton7];

	label4 = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];

    [label4 setStringValue:@"Style"];
    [label4 setFont:[CPFont boldSystemFontOfSize:20.0]];

    [label4 sizeToFit];

    [label4 setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [label4 setCenter:CGPointMake(990,13)];
    [contentView addSubview:label4];
	
	sendButton8 = [[CPButton alloc] initWithFrame:CGRectMake(990,48, 80, 25)];

	[sendButton8 setTitle: @"Regular"];
	[sendButton8 setTag: 10];
	[sendButton8 setTarget:self];
	[sendButton8 setAction:@selector(setStandart:)];
	[sendButton8 setCenter:CGPointMake(990, 40)];
	[contentView addSubview:sendButton8];
	
	sendButton9 = [[CPButton alloc] initWithFrame:CGRectMake(990,48, 80, 25)];
	
	[sendButton9 setTitle: @"Bold"];
	[sendButton9 setTag: 10];
	[sendButton9 setTarget:self];
	[sendButton9 setAction:@selector(setBold:)];
	[sendButton9 setCenter:CGPointMake(990, 70)];
	[contentView addSubview:sendButton9];
	
	sendButton10 = [[CPButton alloc] initWithFrame:CGRectMake(990,48, 80, 25)];
	
	[sendButton10 setTitle: @"Italic"];
	[sendButton10 setTag: 10];
	[sendButton10 setTarget:self];
	[sendButton10 setAction:@selector(setItalic:)];
	[sendButton10 setCenter:CGPointMake(990, 100)];
	[contentView addSubview:sendButton10];
	
	sendButton101 = [[CPButton alloc] initWithFrame:CGRectMake(990,48, 80, 25)];
	
	[sendButton101 setTitle: @"Italic Bold"];
	[sendButton101 setTag: 10];
	[sendButton101 setTarget:self];
	[sendButton101 setAction:@selector(setItalicBold:)];
	[sendButton101 setCenter:CGPointMake(990, 130)];
	[contentView addSubview:sendButton101];
	
	label5 = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];

    [label5 setStringValue:@"Align"];
    [label5 setFont:[CPFont boldSystemFontOfSize:20.0]];

    [label5 sizeToFit];

    [label5 setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [label5 setCenter:CGPointMake(1090,13)];
    [contentView addSubview:label5];
    
    label6 = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
    
    [label6 setStringValue:@"V. Align"];
    [label6 setFont:[CPFont boldSystemFontOfSize:20.0]];

    [label6 sizeToFit];

    [label6 setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [label6 setCenter:CGPointMake(1190,13)];
    [contentView addSubview:label6];
    
    sendButton11 = [[CPButton alloc] initWithFrame:CGRectMake(990,48, 80, 25)];
	
	[sendButton11 setTitle: @"Center"];
	[sendButton11 setTag: 10];
	[sendButton11 setTarget:self];
	[sendButton11 setAction:@selector(setCenter:)];
	[sendButton11 setCenter:CGPointMake(1090, 40)];
	[contentView addSubview:sendButton11];
	
	sendButton111 = [[CPButton alloc] initWithFrame:CGRectMake(990,48, 80, 25)];
	
	[sendButton111 setTitle: @"Top"];
	[sendButton111 setTag: 10];
	[sendButton111 setTarget:self];
	[sendButton111 setAction:@selector(setTop:)];
	[sendButton111 setCenter:CGPointMake(1190, 40)];
	[contentView addSubview:sendButton111];
	
	sendButton12 = [[CPButton alloc] initWithFrame:CGRectMake(990,48, 80, 25)];
	
	[sendButton12 setTitle: @"Left"];
	[sendButton12 setTag: 10];
	[sendButton12 setTarget:self];
	[sendButton12 setAction:@selector(setLeft:)];
	[sendButton12 setCenter:CGPointMake(1090, 70)];
	[contentView addSubview:sendButton12];
	
	sendButton121 = [[CPButton alloc] initWithFrame:CGRectMake(990,48, 80, 25)];
	
	[sendButton121 setTitle: @"Middle"];
	[sendButton121 setTag: 10];
	[sendButton121 setTarget:self];
	[sendButton121 setAction:@selector(setMiddle:)];
	[sendButton121 setCenter:CGPointMake(1190, 70)];
	[contentView addSubview:sendButton121];
	
	sendButton13 = [[CPButton alloc] initWithFrame:CGRectMake(990,48, 80, 25)];
	
	[sendButton13 setTitle: @"Right"];
	[sendButton13 setTag: 10];
	[sendButton13 setTarget:self];
	[sendButton13 setAction:@selector(setRight:)];
	[sendButton13 setCenter:CGPointMake(1090, 100)];
	[contentView addSubview:sendButton13];
	
	sendButton131 = [[CPButton alloc] initWithFrame:CGRectMake(990,48, 80, 25)];
	
	[sendButton131 setTitle: @"Bottom"];
	[sendButton131 setTag: 10];
	[sendButton131 setTarget:self];
	[sendButton131 setAction:@selector(setBottom:)];
	[sendButton131 setCenter:CGPointMake(1190, 100)];
	[contentView addSubview:sendButton131];
	
	sendButton14 = [[CPButton alloc] initWithFrame:CGRectMake(990,48, 80, 25)];
	
	[sendButton14 setTitle: @"Justified"];
	[sendButton14 setTag: 10];
	[sendButton14 setTarget:self];
	[sendButton14 setAction:@selector(setJustified:)];
	[sendButton14 setCenter:CGPointMake(1090, 130)];
	[contentView addSubview:sendButton14];
	
	console.log(textField);
	
    [theWindow orderFront:self];
    
    style = @"normal";
}

- (void)slide:(id)sender{
	angle = [sender integerValue];
	[label61 setStringValue:@"Rotation: "+[sender integerValue]];
	[label61 sizeToFit];
	textField._DOMElement.rotate([sender integerValue]);
}

- (void)setCenter:(id)sender{
	align = @"center";
	[textField setAlignment: CPCenterTextAlignment];
}

- (void)setLeft:(id)sender{
	align = @"left";
	[textField setAlignment: CPLeftTextAlignment];
}

- (void)setRight:(id)sender{
	align = @"right";
	[textField setAlignment: CPRightTextAlignment];
}

- (void)setTop:(id)sender{
	valign = @"top";
	[textField setVerticalAlignment: CPTopVerticalTextAlignment];
}

- (void)setMiddle:(id)sender{
	valign = @"middle";
	[textField setVerticalAlignment: CPCenterVerticalTextAlignment];
}

- (void)setBottom:(id)sender{
	valign = @"bottom";
	[textField setVerticalAlignment: CPBottomVerticalTextAlignment];
}

- (void)setJustified:(id)sender{
	align = @"justified";
	[textField setAlignment: CPJustifiedTextAlignment];
	console.log(textField);
}

- (void)setBold:(id)sender{
	weight = @"bold";
	[textField setValue: @"bold " + fontSize + @"pt "+@" "+font forThemeAttribute:@"font"];
}

- (void)setItalic:(id)sender{
	style = @"italic";
	weight = @"normal";
	[textField setValue: style + @" " + fontSize + @"pt "+@" "+font forThemeAttribute:@"font"];
}

- (void)setItalicBold:(id)sender{
	style = @"italic";
	weight = @"bold";
	[textField setValue: style + @" bold " + fontSize + @"pt "+@" "+font forThemeAttribute:@"font"];
}

- (void)setStandart:(id)sender{
	style = @"normal";
	weight = @"normal";
	[textField setValue: style + @" " + fontSize + @"pt "+@" "+font forThemeAttribute:@"font"];
}

- (void)setColor:(id)sender{
	color = [colorField stringValue];
	[textField setTextColor:[CPColor colorWithHexString:color]];
}

- (void)get:(id)sender{
	font = @"myriad-pro";
	[textField setValue: fontSize + @"pt "+font forThemeAttribute:@"font"];
}

- (void)send:(id)sender{
	//[textField setFont: [CPFont fontWithName: @"adobe-garamond-pro" size: fontSize]];
	font = @"arno-pro";
	[textField setValue: fontSize + @"pt "+font forThemeAttribute:@"font"];
}

- (void)chap:(id)sender{
	//[textField setFont: [CPFont fontWithName: @"adobe-garamond-pro" size: fontSize]];
	font = @"chaparral-pro";
	[textField setValue: fontSize + @"pt "+font forThemeAttribute:@"font"];
}

- (void)setSize:(id)sender{
	//[textField setFont: [CPFont fontWithName: font size: [sender tag] + "pt"]];
	[textField setValue: [sender tag] + @"pt "+font forThemeAttribute:@"font"];
	fontSize = [sender tag];
}

- (void)getJSON:(id)sender{
	var str = @"{\"string\":\""+[textField stringValue]+"\",\"offsetX\":0,\"offsetY\":0,\"fontName\":\""+font+"\",\"fontSize\":"+fontSize+",\"originalWidth\":400,\"originalHeight\":300,\"color\":\""+color+"\", \"style\":\""+style+"\", \"align\":\""+align+"\", \"weight\":\""+weight+"\", \"valign\":\""+valign+"\"}";
	console.log(str);
}

@end

@implementation Ajax : CPObject
{
	id		ajaxObject;
}

- (id)init
{
	ajaxObject = [self createXMLHttp];
    return self;
}

- (void)get:(JSON)parameters
{
	parameters.async = typeof(parameters.async) == 'undefined' ? true : parameters.async;
	parameters.type = typeof(parameters.type) == 'undefined' ? 'get' : parameters.type;
	parameters.url = typeof(parameters.url) == 'undefined' ? window.location : parameters.url;
	ajaxObject.open(parameters.type, parameters.url, parameters.async);

    if (parameters.async == true)
    {
        ajaxObject.onreadystatechange = function()
        {
            if (ajaxObject.status == 200 && ajaxObject.readyState == 4)
            {
                var sData = ajaxObject.responseText;
                if (typeof parameters.success == 'function')
                    parameters.success(sData);
            }
        };
    }

	ajaxObject.send(null);
	if (parameters.async == false)
	{
		if (ajaxObject.status == 200 && ajaxObject.readyState == 4)
		{
			var sData = ajaxObject.responseText;
			if (typeof parameters.success == 'function')
				parameters.success(sData);
		}
	}
}

- (id)createXMLHttp
{
	if (typeof XMLHttpRequest != "undefined")
	{ ///Normal Browsers
		return new XMLHttpRequest();
	}
	else if (window.ActiveXObject)
	{ ///Internet Explorer (all versions)
		var aVersions = ["MSXML2.XMLHttp.5.0", "MSXML2.XMLHttp.4.0",
						"MSXML2.XMLHttp.3.0", "MSXML2.XMLHttp",
						"Microsoft.XMLHttp"
						];
		for (var i = 0; i < aVersions.length; i++)
		{
			try
			{
				var oXmlHttp = new ActiveXObject(aVersions[i]);
				return oXmlHttp;
			}
			catch (oError)
			{
			}
		}
		throw new Error("Can't create XMLHttp object.");
	}
}

@end