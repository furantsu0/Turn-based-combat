Hello, furantsu0 here, thanks for checking out this project.

I've played a little bit of turn based games in the past so I'm interested in this type of gameplay.
**This is my first attempt without watching any tutorials.**

Player states:
- Idle
- Deciding
- Cutscene

Match states:
- Starting
- Actions
- Checks
- End

// Pre Match
- Cutscene
- Choose rules

// Match Loop Order \\
- Starting
- Deciding
- Checks
- Actions
- Checks
- End (If end condition)
- Idle

Checks account for various end conditions such as eliminations, status effects, etc.