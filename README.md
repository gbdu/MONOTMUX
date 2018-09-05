
# Table of Contents

1.  [Screenshots](#orgfa3b455)
2.  [What is this?](#org1c7889d)
    1.  [tmux\_term\_or\_pane.sh](#org82be541)
    2.  [tmux\_update\_focus.sh](#org9031f6a)
3.  [Why do things this way?](#org5c524d7)
4.  [Installation](#orgb018ca8)
5.  [Dependencies](#orgcb20811)



<a id="orgfa3b455"></a>

# Screenshots

![img](/tmux.png)


<a id="org1c7889d"></a>

# What is this?

This is not your typical tmux configuration, it contains two simple
scripts which will make your life a lot easier if you like to keep one
term with tmux open. If you have a problem with starting too many
terms, this is for you.

Here's what the scripts do: 


<a id="org82be541"></a>

## tmux\_term\_or\_pane.sh

Basically, this script will give you a term. You want to bind it to
Super-Return or however you usually launch your terminal. 

Does a terminal window exist in the current X session? If so, give
focus to it and split a new pane (unless we're at MAXNUM panes). This
limits you to a single term window which you can minimize or close and
always get back with your Super-Return keybind. 

If a term does not exist, then ****start a new session called "manage"
and create tmux windows corresponding to our virtual desktops****. This
is the important thing.

For example, in my screenshots, I have 4 Openbox desktops called zsh,
web1, web2, and code. The script will get those names using wmctrl -l
and create tmux windows with the corresponding names. 

If a tmux session exists but a term does not, just create a term and
attach it to the 'manage' session.

The default term client is xfce4-terminal, but you can change it by
changing the TERM\_CLIENT variable 


<a id="org9031f6a"></a>

## tmux\_update\_focus.sh

Get the virtual desktop names from the window manager then update our
tmux session to select the corresponding tmux window with the same
name.

You want to call this script every time you change virtual desktops,
so tmux will update its focussed window. For example, in my
openbox rc.xml, I have the following: 

    <keybind key="C-W-Left">
      <action name="DesktopLeft"/>
      <action name="Execute">
        <command>tmux_update_focus.sh</command>
      </action>
    </keybind>


<a id="org5c524d7"></a>

# Why do things this way?

Organization and minimalism. In the past, I used to simply bind
Super-Return to xfce4-terminal or urxvt, over time, I realized having
10 terms on each desktop is the wrong strategy.

This way, you can have tmux windows corresponding to the same things
you're doing on your window manager. For example, in my "web1"
desktop, I can have Firefox and a chat client, and weechat running in
my "manage:web1" tmux window. I then set the terminal window to "show
on all desktops", when I switch desktops, tmux will automatically go
to the web1 window and show me weechat with one keystroke, without me
having to inform tmux of the change. When I switch back to "code",
it will switch back to the compilation results or whatever I'm doing
on the code tab.

You can close the terminal and get back to exactly what you were doing
on the corresponding desktop with Super-Return.

If your term window is on another desktop or hidden behind a bunch of
other windows, Super-Return will give it focus. 


<a id="orgb018ca8"></a>

# Installation

1.  Put tmux\_term\_or\_pane.sh and tmux\_update\_focus.sh somewhere in your
    $PATH, chmod +x them.
2.  Edit tmux\_term\_or\_pane.sh to match your prefered terminal client,
    the default is xfce4-terminal.
3.  Bind tmux\_term\_or\_pane.sh to your prefered "launch terminal"
    keybind in your window manager.
4.  Put tmux\_update\_focus.sh in your window manager's  "change desktop"
    hook, or bind it to the same keys you use to switch virtual
    desktops, ie. ALT-CTRL-Left or ALT-CTRL-Right.


<a id="orgcb20811"></a>

# Dependencies

-   wmctrl
-   xdotool

