import i3ipc
import random

# Define border colors
COLORS = [
    "#FF5733",  # Red
    "#33FF57",  # Green
    "#3357FF",  # Blue
    "#FFFF33",  # Yellow
    "#FF33FF",  # Magenta
    "#33FFFF",  # Cyan
]

# Create an i3 connection
i3 = i3ipc.Connection()

# Dictionary to store window colors
window_colors = {}

def set_window_border(i3, event):
    # Get the window ID
    window_id = event.container.id
    
    # Check if the window already has a color
    if window_id not in window_colors:
        # Assign a random color
        window_colors[window_id] = random.choice(COLORS)
    
    # Apply the border color
    color = window_colors[window_id]
    i3.command(f'[con_id={window_id}] border pixel 2')
    i3.command(f'[con_id={window_id}] mark "__color_{color}"')
    print(f"Set border for window {window_id} to color {color}")

def remove_window_from_tracking(i3, event):
    # Remove window ID from tracking
    window_id = event.container.id
    if window_id in window_colors:
        del window_colors[window_id]
        print(f"Removed window {window_id} from tracking")

# Subscribe to window events
i3.on("window::new", set_window_border)
i3.on("window::close", remove_window_from_tracking)

# Start the i3 event loop
i3.main()

