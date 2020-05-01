%%
%% This is file `elementi.mp',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% elementi.dtx  (with options: `planimetry')
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from elementi.mp.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file elementi.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)
%% \DoNotIndex{\newcommand,\newenvironment}
if known elementi.geom.version: endinput; fi

string elementi.geom.version;
elementi.geom.version:="0.1";
def homothetic(expr center, scale)=
    shifted -center scaled scale shifted center
enddef;
def centrallysymmetric(expr center)=
    homothetic(center, -1)
enddef;
vardef arcpoint expr l of p=
    point (arctime l of p) of p
enddef;
vardef arcdirection expr l of p=
    direction (arctime l of p) of p
enddef;
vardef arcsubpath expr ll of p=
subpath (arctime (xpart ll) of p, arctime (ypart ll) of p) of p
enddef;
vardef fracarcpoint expr f of p=
    arcpoint f*(arclength p) of p
enddef;
vardef fracarcdirection expr f of p=
    arcdirection f*(arclength p) of p
enddef;
vardef fracarcsubpath expr ff of p=
    arcsubpath ff*(arclength p) of p
enddef;
vardef circle(expr c, r)=
    fullcircle scaled (2r) shifted c
enddef;
vardef arc.cw(expr c, r, phi, psi)=
reverse arc.ccw(c, r, psi, phi+360)
enddef;

vardef arc.ccw(expr c, r, phi, psi)=
    (fracarcsubpath (0, psi-phi)/360 of fullcircle)
        scaled (2r) rotated phi shifted c
enddef;
vardef polyline(text points)=
    save i;
    numeric i;
    i:=0;
    for p=points: if incr i<>1: -- fi p endfor
enddef;
vardef polygon(text points)=
    polyline(points)--cycle
enddef;
vardef triangle(expr a, b, c)=
    a--b--c--cycle
enddef;
vardef unitregpoly(expr n)=
    for i=0 upto (n-1): dir(i*360/n)-- endfor cycle
enddef;
vardef intersection(expr a, b, c, d)=
    save e;
    pair e;
    e=whatever[a, b]=whatever[c, d];
    e
enddef;
vardef altbase(expr a, b, c)=
    intersection(b, c, a, a+((c-b) zscaled up))
enddef;
vardef centroid(expr a, b, c)=
    2/3[a, .5[b, c]]
enddef;
vardef orthocenter(expr a, b, c)=
    intersection(a, altbase(a, b, c), b, altbase(b, c, a))
enddef;
vardef median(expr a, b, c)=
    a--.5[b, c]
enddef;
vardef bisectorbase(expr a, b, c)=
    (abs(b-a)/(abs(b-a)+abs(c-a)))[b, c]
enddef;
vardef bisector(expr a, b, c)=
    a--bisectorbase(a, b, c)
enddef;
vardef altitude(expr a, b, c)=
    a--altbase(a, b, c)
enddef;
vardef incenter(expr a, b, c)=
    intersection(a, bisectorbase(a, b, c), b, bisectorbase(b, c, a))
enddef;
vardef inradius(expr a, b, c)=
    save center;
    pair center;
    center=incenter(a, b, c);
    abs(center-altbase(center, b, c))
enddef;
vardef incircle(expr a, b, c)=
    save center;
    pair center;
    center=incenter(a, b, c);
    circle(center, abs(center-altbase(center, b, c)))
enddef;
vardef excenter(expr a, b, c)=
    intersection
    (
        a, bisectorbase(a, b, c) rotatedabout(a, 90),
        b, bisectorbase(b, c, a)
    )
enddef;
vardef exradius(expr a, b, c)=
    save center;
    pair center;
    center=excenter(a, b, c);
    abs(center-altbase(center, b, c))
enddef;
vardef excircle(expr a, b, c)=
    save center;
    pair center;
    center=excenter(a, b, c);
    circle(center, abs(center-altbase(center, b, c)))
enddef;
vardef circumcenter(expr a, b, c)=
    intersection
    (
        .5[b, c], .5[b, c]+((b-c) zscaled up),
        .5[a, c], .5[a, c]+((a-c) zscaled up)
    )
enddef;
vardef circumradius(expr a, b, c)=
    abs(circumcenter(a, b, c)-a)
enddef;
vardef circumcircle(expr a, b, c)=
    save center;
    pair center;
    center=circumcenter(a, b, c);
    circle(center, abs(center-a))
enddef;
vardef eulercenter(expr a, b, c)=
    circumcenter(.5[a, b], .5[b, c], .5[c, a])
enddef;
vardef eulercenter(expr a, b, c)=
    circumcircle(.5[a, b], .5[b, c], .5[c, a])
enddef;
numeric pi;
pi:=3.14159265358979;
numeric rad;
rad:=180/pi;
def option(suffix opt)=
    vardef opt => expr val=
        def opt=val enddef;
    enddef;
enddef;
def processoptions(text t)=
    for item=t: item; endfor
enddef;
newinternal markersize;
markersize:=dotlabeldiam;
pen markerpen;

markerpen=pencircle scaled .25bp;

path
    markerpath.circle,
    markerpath.square,
    markerpath.diamond,
    markerpath.triangle,
    markerpath.pentagon,
    markerpath.hexagon,
    markerpath.cross;
markerpath.circle=fullcircle;
markerpath.square=unitsquare shifted (-(.5, .5)) scaled (sqrt(pi)/2);
markerpath.diamond=markerpath.square rotated 45;
markerpath.triangle=unitregpoly(3) zscaled up
    scaled sqrt(pi/6/sind(120));
markerpath.pentagon=unitregpoly(5) zscaled up
    scaled sqrt(pi/10/sind(72));
markerpath.hexagon=unitregpoly(6) zscaled up
    scaled sqrt(pi/12/sind(60));
markerpath.cross=((1, 1)--(0, .25)--(-1, 1)--(-.25, 0)
        --(-1, -1)--(0, -.25)--(1, -1)--(.25, 0)--cycle);
color foreground;
foreground=black;

vardef markdot@#(expr a) text opts=
    save size, bg, fg;
    numeric size;
    size=markersize;
    color bg, fg;
    bg=background;
    fg=foreground;
    option(fg);
    option(bg);
    option(size);
    processoptions(opts);
    fill markerpath@# scaled size shifted a withcolor bg;
    draw markerpath@# scaled size shifted a withcolor fg withpen markerpen;
enddef;
vardef markangle.arc@#(expr a, b, c, n) text opts=
    save size, scale, bg, fg;
    numeric size, scale;
    size=markersize;
    scale=1;
    color bg, fg;
    bg=background;
    fg=foreground;
    option(fg);
    option(bg);
    option(size);
    option(scale);
    processoptions(opts);
    save phi, psi;
    numeric phi, psi;
    phi=angle(b-a);
    psi=angle(c-a);
if phi<0: phi:=phi+360; fi
if psi<0: psi:=psi+360; fi
save sweep;
sweep.ccw=(psi-phi) mod 360;
sweep.cw=(phi-psi) mod 360;
    for i=1 upto n:
draw arc@#(origin, 5bp*scale*sqrt(90/sweep@#)+i*.5markersize, 0, sweep.ccw)
                rotated phi shifted a
            withpen markerpen;
    endfor
enddef;
vardef markangle.arcarrow@#(expr a, b, c, n) text opts=
    save size, scale, bg, fg;
    numeric size, scale;
    size=markersize;
    scale=1;
    color bg, fg;
    bg=background;
    fg=foreground;
    option(fg);
    option(bg);
    option(size);
    option(scale);
    processoptions(opts);
    save phi, psi;
    numeric phi, psi;
    phi=angle(b-a);
    psi=angle(c-a);
if phi<0: phi:=phi+360; fi
if psi<0: psi:=psi+360; fi
save sweep;
sweep.ccw=(psi-phi) mod 360;
sweep.cw=(phi-psi) mod 360;
interim ahlength:=.75markersize;
    for i=1 upto n:
drawarrow arc@#(origin, 5bp*scale*sqrt(90/sweep@#)+i*.5markersize, 0, sweep.ccw)
                rotated phi shifted a
            withpen markerpen;
    endfor
enddef;
\endinput
%%
%% End of file `elementi.mp'.
