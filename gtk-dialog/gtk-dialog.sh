#!/bin/bash 
GTKDIALOG=gtkdialog 
export MAIN_DIALOG=' 
<window title="My Second Program" icon-name="gtk-about" resizable="true" width-request="250" height-request="150"> 
<notebook tab-label="First | Second|"> 
<vbox> 
<hbox space-fill="true"> 
<combobox>	 
<variable>myitem</variable> 
<item>First One</item> 
<item>Second One</item> 
<item>Third One</item> 
</combobox> 
</hbox> 
<hbox> 
<button> 
<label>Click Me</label> 
<action>echo "You choosed $myitem"</action> 
</button> 
</hbox> 
<hseparator width-request="240"></hseparator> 
<hbox> 
<button ok></button> 
</hbox> 
</vbox> 
<vbox> 
<hbox space-fill="true"> 
<text> 
<label>Spinbutton </label> 
</text> 
</hbox> 
<hbox space-fill="true" space-expand="true"> 
<spinbutton range-min="0" range-max="100" range-value="4"> 
<variable>myscale</variable> 
<action>echo $myscale</action> 
</spinbutton> 
</hbox> 
<hbox> 
<button ok></button> 
</hbox> 
</vbox> 
</notebook> 
</window> 
' 
case $1 in 
-d | --dump) echo "$MAIN_DIALOG" ;; 
*) $GTKDIALOG --program=MAIN_DIALOG --center ;; 
esac
