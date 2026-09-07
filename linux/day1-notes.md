***********************************************************************
DAY-1
***********************************************************************

Kernel - A kernel is the core software program at the absolute center of a computer's operating system

The Kernel acts as the crucial middleman (bridge) that translates software requests into physical hardware actions

Linux is a free, open-source operating system kernel that acts as the core bridge between a computer's hardware and its software applications


| Directory | Purpose                        |
| --------- | ------------------------------ |
| `/home`   | User home directories          |
| `/etc`    | Configuration files            |
| `/var`    | Logs, caches, application data |
| `/tmp`    | Temporary files                |
| `/opt`    | Optional/third-party software  |
| `/usr`    | User-space programs/libraries  |
| `/bin`    | Essential commands             |
| `/root`   | Root user's home               |



       ┌─────────────────────────┐
       │        1. USER          │
       └────────────┬────────────┘
                    │ Interaction (Clicks/Typing)
       ┌────────────▼────────────┐
       │     2. APPLICATION      │
       └────────────┬────────────┘
                    │ System Calls (API Requests)
 ░░░░░░░┌───────────▼───────────┐░░░░░░░
 ░░░░░░░│       3. KERNEL       │░░░░░░░  <-- Operating System Core
 ░░░░░░░└───────────┬───────────┘░░░░░░░
                    │ Drivers & CPU Instructions
       ┌────────────▼────────────┐
       │       4. HARDWARE       │
       └─────────────────────────┘


When a User clicks "Save" on a text document, the relationship works like a chain reaction:
[ User ] ➔ [ Operating System / App ] ➔ [ Linux Kernel ] ➔ [ Hardware ]

• when you execute a Linux command

→ if the command is a built-in function or a shortcut (alias). If not, it searches through the directories listed in your $PATH environment variable to find the physical file.

→ The shell uses a system call called fork() to clone itself and create a new child process. It then uses exec() to replace that clone with the actual command program.

→ The kernel executes the code, routes the output to your terminal screen, and terminates the process with an exit status code (where 0 means success)

