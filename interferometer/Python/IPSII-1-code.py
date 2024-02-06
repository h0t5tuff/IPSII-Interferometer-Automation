# -*- coding: utf-8 -*-
"""
Created on Mon Oct 25 18:24:33 2021

@author: 10912180
"""

import tkinter as tk
from tkinter import ttk

root = tk.Tk()
root.title("IPSII Control")
#root.state('zoomed')
root.attributes('-fullscreen', True)
W = 1920#root.winfo_screenwidth()
H = 1080#root.winfo_screenheight()

#W = 1920//2
#H = 1080//2

rows = 8
cols = 7

Hrow = H//rows
Wcol = W//cols

marg = Wcol//12

thefont = ('URW Gothic L', '%d' % int(-Hrow*0.75), 'bold')
smallfont = ('URW Gothic L', '%d' % int(-Hrow*0.4), 'bold')


s = ttk.Style()
s.theme_create( "MyStyle", parent="alt", settings={
        "TNotebook": {"configure": {"tabmargins": [0, 0, 0, 0] } },
        "TNotebook.Tab": {"configure": {"padding": [W//20, 0],
                                        "font" : thefont},}})
s.theme_use("MyStyle")


notebook = ttk.Notebook(root)
notebook.pack(expand=True)
frameAlign = tk.Frame(notebook,width=W,height=H)
frameAlign.pack()
notebook.add(frameAlign,text="Align")
frameSettings = tk.Frame(notebook,width=W,height=H)
frameSettings.pack()
notebook.add(frameSettings,text="Setup")

buttoncolor = '#AAAAAA'
buttonselcolor = '#00FF00'

themirror = -1

def objbuttonpress(whichmirror):
    global bMirrorText, bMirrors, themirror, buttoncolor, buttonselcolor
    if(whichmirror in bMirrorText):
        i = bMirrorText.index(whichmirror)
        for button in bMirrors:
            button.configure(bg=buttoncolor)
            button.configure(activebackground=buttoncolor)
        if(i == themirror):
            themirror = -1
        else:
            themirror = i
            bMirrors[i].configure(bg=buttonselcolor)
            bMirrors[i].configure(activebackground=buttonselcolor)
    else:
        print("doink")
        

def objbutton(thecanvas,thetext,x,y,small=False):
    tfont = thefont
    if(small):
        tfont = smallfont
    obj = tk.Button(thecanvas,text=thetext,font=tfont,relief=tk.RAISED,bd=marg,command=lambda m=thetext: objbuttonpress(m),bg=buttoncolor,activebackground=buttoncolor)
    obj.place(x=x*Wcol,y=y*Hrow,width=Wcol*0.95,height=Hrow*0.95,anchor=tk.CENTER)
    return(obj)

def doline(thecanvas,xa,ya,xb,yb):
    thecanvas.create_line(xa*Wcol,ya*Hrow,xb*Wcol,yb*Hrow,width=Hrow//10)
    


##### align page
alignCanvas = tk.Canvas(frameAlign,height=H*(rows-1)/rows,width=W,bg='grey')
alignCanvas.pack()
root.update()
Hframe = alignCanvas.winfo_reqheight()
Wframe = frameAlign.winfo_reqwidth()
lbl = []

def drawgrid(thecanvas):
    for i in range(0,rows-1):
        for j in range(cols):
            theCanvas.create_rectangle(j*Wcol,i*Hrow,(j+1)*Wcol,(i+1)*Hrow)
            lbl.append(tk.Label(theCanvas,text="%d,%d" % (j,i)))
            print("i=%d,j=%d" % (i,j))
            lbl[j+i*(cols)].place( x=(j+0.5)*Wcol, y=(i+0.5)*Hrow )
        
bMirrors = []
bMirrorText = ["A","B","C","D"]
bMirrorPos = [(2,1),(2,3),(4,1),(4,3)]
for i in range(len(bMirrorText)):
    bMirrors.append(objbutton(alignCanvas,bMirrorText[i],*bMirrorPos[i]))

#alignCanvas.create_line(0,Hrow,*bMirrorPos[1],width=4)
#alignCanvas.create_line(Wcol,2*Hrow,*bMirrorPos[0],width=4)
doline(alignCanvas,0,1,*bMirrorPos[1])
doline(alignCanvas,1,2,*bMirrorPos[0])
doline(alignCanvas,*bMirrorPos[0],*bMirrorPos[3])
doline(alignCanvas,*bMirrorPos[1],*bMirrorPos[2])
doline(alignCanvas,*bMirrorPos[2],6,3)
doline(alignCanvas,*bMirrorPos[3],6,1)


stepdown = objbutton(alignCanvas,"<<",0.5,4.5)
stepup = objbutton(alignCanvas,">>",2.5,4.5)
stepsize = 1
lblStepSizeL = tk.Label(alignCanvas,text="step size",font=smallfont,bg="grey")
lblStepSizeL.place(x=Wcol,y=3.5*Hrow,width=Wcol)
lblStepSize = tk.Label(alignCanvas,text=str(stepsize),font=thefont)
lblStepSize.place(x=Wcol,y=4*Hrow,width=Wcol)

lblX = tk.Label(alignCanvas,text="H",font=smallfont,bg="grey")
lblX.place(x=0.25*Wcol,y=5*Hrow)
lblXminL = tk.Label(alignCanvas,text="min",font=smallfont,bg="grey")
lblXminL.place(x=0.5*Wcol,y=5*Hrow)
lblXmin = tk.Label(alignCanvas,text="-1000000",font=smallfont,bg="grey")
lblXmin.place(x=Wcol,y=5*Hrow)
lblXsetL = tk.Label(alignCanvas,text="set",font=smallfont,bg="grey")
lblXsetL.place(x=0.5*Wcol,y=5.5*Hrow)
lblXset = tk.Label(alignCanvas,text="-1000000",font=smallfont,bg="grey")
lblXset.place(x=Wcol,y=5.5*Hrow)
lblXnowL = tk.Label(alignCanvas,text="now",font=smallfont,bg="grey")
lblXnowL.place(x=0.5*Wcol,y=6*Hrow)
lblXnow = tk.Label(alignCanvas,text="-1000000",font=smallfont,bg="grey")
lblXnow.place(x=Wcol,y=6*Hrow)
lblXmaxL = tk.Label(alignCanvas,text="max",font=smallfont,bg="grey")
lblXmaxL.place(x=0.5*Wcol,y=6.5*Hrow)
lblXmax = tk.Label(alignCanvas,text="1000000",font=smallfont,bg="grey")
lblXmax.place(x=Wcol,y=6.5*Hrow)

lblY = tk.Label(alignCanvas,text="V",font=smallfont,bg="grey")
lblY.place(x=2.25*Wcol,y=5*Hrow)
lblYminL = tk.Label(alignCanvas,text="min",font=smallfont,bg="grey")
lblYminL.place(x=2.5*Wcol,y=5*Hrow)
lblYmin = tk.Label(alignCanvas,text="-1000000",font=smallfont,bg="grey")
lblYmin.place(x=3*Wcol,y=5*Hrow)
lblYsetL = tk.Label(alignCanvas,text="set",font=smallfont,bg="grey")
lblYsetL.place(x=2.5*Wcol,y=5.5*Hrow)
lblYset = tk.Label(alignCanvas,text="-1000000",font=smallfont,bg="grey")
lblYset.place(x=3*Wcol,y=5.5*Hrow)
lblYnowL = tk.Label(alignCanvas,text="now",font=smallfont,bg="grey")
lblYnowL.place(x=2.5*Wcol,y=6*Hrow)
lblYnow = tk.Label(alignCanvas,text="-1000000",font=smallfont,bg="grey")
lblYnow.place(x=3*Wcol,y=6*Hrow)
lblYmaxL = tk.Label(alignCanvas,text="max",font=smallfont,bg="grey")
lblYmaxL.place(x=2.5*Wcol,y=6.5*Hrow)
lblYmax = tk.Label(alignCanvas,text="1000000",font=smallfont,bg="grey")
lblYmax.place(x=3*Wcol,y=6.5*Hrow)

stepxmin = objbutton(alignCanvas,"Hmin",4.5,5.5,small=True)
stepxzero = objbutton(alignCanvas,"Hzero",5.5,5.5,small=True)
stepxmax = objbutton(alignCanvas,"Hmax",6.5,5.5,small=True)
stepymin = objbutton(alignCanvas,"Vmin",4.5,6.5,small=True)
stepyzero = objbutton(alignCanvas,"Vzero",5.5,6.5,small=True)
stepymax = objbutton(alignCanvas,"Vmax",6.5,6.5,small=True)
stepsetlabel = tk.Label(alignCanvas,text="set",font=smallfont,bg="grey")
stepsetlabel.place(x=4.25*Wcol,y=4.4*Hrow)


steprelease = tk.Button(alignCanvas,text="release limits",font=smallfont,bd=marg,bg=buttoncolor)
steprelease.place(x=6*Wcol,y=4.5*Hrow,width=Wcol*2,height=Hrow,anchor=tk.CENTER)


stepstop = tk.Button(alignCanvas,text="STOP!",font=thefont,bd=marg,bg="red")
stepstop.place(x=6*Wcol,y=0.5*Hrow,width=Wcol*2,height=Hrow,anchor=tk.CENTER)

stepzeroall = tk.Button(alignCanvas,text="All to zero",font=smallfont,bd=marg,bg=buttoncolor)
stepzeroall.place(x=6*Wcol,y=1.5*Hrow,width=Wcol*2,height=Hrow*0.9,anchor=tk.CENTER)



"""
bMirrorA = tk.Button(alignCanvas,text="A",font=smallfont)
bMirrorA.place(x=Wcol*0.5,y=Hrow*0.25,width=Wcol*1.5,height=Hrow)
bMirrorB = tk.Button(alignCanvas,text="B",font=smallfont)
bMirrorB.place(x=Wcol*0.5,y=Hrow*2,width=Wcol*1.5,height=Hrow)
bMirrorC = tk.Button(alignCanvas,text="C",font=smallfont)
bMirrorC.place(x=Wcol*2.5,y=Hrow*0.25,width=Wcol*1.5,height=Hrow)
bMirrorD = tk.Button(alignCanvas,text="D",font=smallfont)
bMirrorD.place(x=Wcol*2.5,y=Hrow*2,width=Wcol*1.5,height=Hrow,anchor=tk.CENTER)
"""


print("W=%d, H=%d" % (W,H))
print("Wframe = %d, Hframe = %d" % (Wframe,Hframe))

#alignMirrorA = tk.Button(alignCanvas,text="Mirror A", font = thefont)
#alignMirrorA.place(x=W/5,y=H/7)

##### Alignment page
alignCanvas = tk.Canvas(frameAlign,height=H,width=W)
alignCanvas.pack()

    
"""
mainframe = tk.Canvas(root,height = H, width = W)
txt = tk.Label(mainframe,text="Manual Mirror Alignment and Calibration")
txt.place(x=20,y=20)
mirrorbuttons = []
for i in range(4):
    mirrorbuttons.append(tk.Button(mainframe,text="Mirror %d" % i))
    mirrorbuttons[i].place(x=50*(i+1),y=50)
mainframe.pack()
"""
root.mainloop()
