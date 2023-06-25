# Click-to-brake-part
This script is a click to brake script useful for simulator games

To sumarise what it does (I got chat gpt to write an explaination because im to lazy):

This Lua script contains a step-by-step explanation of its functionality:

1. The script starts by defining some useful variables:
   - `plr` represents the local player.
   - `Clickdetector` refers to the ClickDetector object associated with the script's parent.
   - `DestroyablePart` is the parent of the ClickDetector.
   - `healthUi` is a reference to the HealthBarUi object within the DestroyablePart.
   - `clickedCounter` keeps track of the number of times the ClickDetector has been clicked.
   - `debounce` is a boolean variable used to prevent spam clicking.
   - `healthFrame` represents the Health frame within the HealthBarUi.
   - `x` is set to 200, representing the initial width of the health frame.
   - `RunS` refers to the RunService, which is used for timing purposes.

2. The script sets up a MouseClick event for the ClickDetector object using the `Clickdetector.MouseClick:Connect(function())` syntax. This event fires whenever the ClickDetector is clicked.

3. Inside the MouseClick event function, the script first checks if the `debounce` variable is `false`. This check ensures that the user cannot spam click and rapidly decrease the health.

4. If the debounce check passes, the script sets `debounce` to `true` to prevent further clicking until the process is complete.

5. The `clickedCounter` variable is incremented by 1, tracking the number of times the ClickDetector has been clicked.

6. If the `clickedCounter` is equal to 1, it means that the DestroyablePart has been clicked for the first time. In this case, the script makes the health bar visible by setting `healthUi.HealthBarUi.Enabled` and `healthUi.HealthBarUi.Background.Visible` to `true`.

7. If the `clickedCounter` reaches 4, it means that the DestroyablePart has been clicked four times. In this case, the script executes the following actions:
   - Sets the DestroyablePart's transparency to 1 (making it invisible).
   - Disables collision for the DestroyablePart.
   - Moves the ClickDetector to the game's ReplicatedStorage (essentially removing it from the DestroyablePart).
   - Disables the health bar UI.
   - Waits for 5 seconds using the `task.wait(5)` function.
   - Moves the DestroyablePart to a random position within a specified range.
   - Adjusts the position of the health bar UI to be above the DestroyablePart.
   - Sets the DestroyablePart's transparency to 0 (making it visible again).
   - Enables collision for the DestroyablePart.
   - Moves the ClickDetector back to the DestroyablePart.
   - Resets the `clickedCounter` to 0.

8. After the above checks and actions, the script decreases the value of `x` by 50, representing a decrease in the width of the health frame.

9. The size of the health frame is updated by setting `healthFrame.Size` to `UDim2.new(0, x, 0, 50)`.

10. The script waits for approximately 0.5 seconds using the `RunS.Heartbeat.wait(.5)` function. This ensures a delay between consecutive clicks.

11. Finally, the `debounce` variable is set back to `false`, allowing the ClickDetector to be clicked again.

Overall, this script implements a simple clicking mechanism where the DestroyablePart's health decreases with each click. After four clicks, the DestroyablePart disappears temporarily, repositions itself, and resets its health.
