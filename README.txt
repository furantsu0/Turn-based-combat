Hello, furantsu0 here, thanks for checking out this project.

I've played a little bit of turn based games in the past so I'm interested in this type of gameplay.
**This is my first attempt without watching any tutorials.**

Player states:
- Idle
- Deciding
- Cutscene

Match states:
- Idling
- Starting
- Actions
- Checks
- End

// Pre Match
- Idling
- Cutscene
- Choose rules
- Starting

// Match Loop Order \\
- Deciding
- Checks
- Actions
- Checks
- End (Checks for wins, if not then repeat everything above)
- Idle

Checks account for various conditions such as eliminations, status effects, etc.