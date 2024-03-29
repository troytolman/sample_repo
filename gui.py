import tkinter as tk

#initialize the window
window = tk.Tk()

#greeting at the top of the window
greeting = tk.Label(text="SMB Vulnerability Scanner")

#adds the widget to the window
greeting.pack()


# Called when the button to start the vulnerability scanner is clicked
def button_clicked():
    print("Button clicked")
    show_current_mode()

# Sets the currentMode variable to display the selected mode
def show_current_mode():
    currentMode.config(text = "Started scanner in " + clicked.get())

# Change the label text
def show_options():
    dropDown.config( text = clicked.get() )
# Dropdown options
options = [
    "Full Scan",
    "Quick Scan",
    "Scheduled Scan"
]
clicked = tk.StringVar()
clicked.set("Full Scan")
# Create Dropdown menu 
dropDown = tk.OptionMenu( window , clicked , *options ) 
dropDown.pack(side=tk.RIGHT)

# Button to start the vulnerability scanner
button = tk.Button(window, text="Click to start vulnerability scanner", command=button_clicked, width=30, height=4)
button.pack()

currentMode = tk.Label(window, text = "")
currentMode.pack()

#tkinter event loop. .listens for events and blocks code that comes after it from running until you close the window where you called the method
window.mainloop()