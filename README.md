# Assembly Language Casino Game

## Table of Contents
1. [Abstract](#abstract)
2. [Introduction](#introduction)
3. [Implementation Details](#implementation-details)
4. [Contributing](#contributing)

## Abstract
This project, conceptualized and developed greatly, presents a captivating casino game implemented in assembly language. It combines a mathematical challenge bonus round with a traditional number-guessing casino game, offering an engaging and multifaceted gaming experience. The project leverages the intricacies of assembly language to demonstrate the team's proficiency in creating interactive and entertaining software applications.

## Introduction
In the dynamic field of computer organization and assembly language, this project introduces an immersive casino gaming experience. Starting with an initial balance, players can engage in a bonus game that tests their mathematical skills, followed by a strategic number-guessing game governed by typical casino rules. This project not only serves as a form of entertainment but also aims to showcase the capabilities of assembly language in creating complex and interactive digital experiences.

## Implementation Details
- **Assembly Language Library**: Utilizes the Irvine32 library for foundational assembly language operations.
- **User Input and Output**: Employs Irvine32 procedures like `WriteString` for outputs, `ReadString` for string inputs, and `ReadInt` for integer inputs, with user interactions guided by clear messages and prompts.
- **Bonus Game**: Features a mathematical challenge where users follow a series of steps to reach a specific answer, enhancing engagement and cognitive skills.
- **Casino Game**: Incorporates a random number generation for the computer's choice, with rules and gameplay mechanics clearly explained through user prompts.
- **Control Flow**: Uses `WHILE` loops and conditional jumps (`je, jmp`) to manage game rounds and player decisions.
- **Data Management**: Manages gameplay data such as username, balance, bets, and game outcomes using well-defined variables.
- **Screen Handling**: Includes commands like `clrscr` for clearing the screen and `Crlf` for better visual formatting.
- **Exit Process**: Ensures a graceful game termination with `Invoke Exitprocess, 0`.

## Contributing
Contributions to enhance or expand the project are welcome. For major changes, please open an issue first to discuss what you would like to change. Please ensure to update tests as appropriate.

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
