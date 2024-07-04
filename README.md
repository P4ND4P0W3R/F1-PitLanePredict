# F1 Pit Lane Predict

## *S5M - Advanced Web Programming - Project*

The topic of this project is a website that allows users to keep track of results during the 2023 F1 Championship. It isn't a complete website, but it is a good start for a project that could be continued in the future.

## 📃 Table of Contents

- [F1 Pit Lane Predict](#f1-pit-lane-predict)
  - [*S5M - Advanced Web Programming - Project*](#s5m---advanced-web-programming---project)
  - [📃 Table of Contents](#-table-of-contents)
  - [About the project](#about-the-project)
    - [ℹ️ Project Description](#ℹ️-project-description)
    - [👥 Team Members](#-team-members)
  - [Getting Started](#getting-started)
    - [⚙️ Prerequisites](#️-prerequisites)
    - [🚦 Run the Project](#-run-the-project)
  - [🗂️ File Structure](#️-file-structure)
  - [📝 Additional Notes](#-additional-notes)

## About the project

We (Paul and Antoine) have been fans of Formula 1 for years and we just started to introduce Alexandre to this wonderful sport and universe. As big fans of Formula 1 since multiple years, we decided to create a project dedicated to this sport.

### ℹ️ Project Description

The focus of our project is to develop a dedicated online platform for Formula 1 fans, providing them with an opportunity to engage with the sport through an informational website. This platform aims to cater to the interests of Formula 1 fans by creating a space where they can explore the sport in a unique manner.

> [!NOTE]
>
> - This project falls into the scope of the **Advanced Web Programming Course** during our fifth semester, the study abroad semester while at ESSCA in Budapest, Hungary. More precisely during our third year curriculum at [EFREI](https://www.efrei.fr/), which is a French CS engineering school.
> - This project has been realized in parallel with the UML Project. To access this project, please see the directory [UML](docs/UML/) and read the [README.md](docs/UML/README.md) file for more information..

### 👥 Team Members

- [P4ND4P0W3R](https://github.com/P4ND4P0W3R) - Paul HU
- [AntoineD01](https://github.com/AntoineD01) - Antoine DUPONT
- [AlexForex](https://github.com/AlexForex) - Alexandre GUILLOIS

## Getting Started

### ⚙️ Prerequisites

- [Node.js 20 (LTS) or higher](https://nodejs.org/en)
- [npm](https://www.npmjs.com/)
- [Prisma](https://www.prisma.io/)

### 🚦 Run the Project

1. **Clone the repository:**

    ```bash
    git clone https://github.com/P4ND4P0W3R/f1-pit-lane-predict.git
    ```

2. **Navigate to the project directory:**

    ```bash
    cd f1-pit-lane-predict
    ```

3. **Install dependencies:**

    ```bash
    npm install
    ```

4. **Start Client-side:**

    ```sh
    npm run dev
    ```

5. **Start Server-side (in a new terminal):**

    ```sh
    cd server
    npm run dev
    ```

Now you should be able to access the frontend application in your browser at `http://localhost:5173`.

## 🗂️ File Structure

- **server:** Contains the backend code.
  - **api:** Contains the API logic.
  - **drivers:** Contains the logic for drivers.
  - **races:** Contains the logic for races.
  - **results:** Contains the logic for results.
  - **teams:** Contains the logic for teams.
  - **user:** Contains the logic for users.
- **src:** The main source code for the Vue frontend application.
  - **assets:** Contains the assets of the application (images, fonts, etc.).
  - **components:** Contains the components of the application.
  - **router:** Contains the router logic.
  - **views:** Contains the views of the application.
- **public:** Holds static files.
- **package.json:** Defines frontend and backend dependencies and scripts.

## 📝 Additional Notes

- **IDE Setup:** [VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur) + [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin).

- **Type Support:** TypeScript cannot handle type information for `.vue` imports by default, so we replace the `tsc` CLI with `vue-tsc` for type checking. In editors, we need [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin) to make the TypeScript language service aware of `.vue` types.

- **Future Enhancements:**
  - **Robust Betting System:** Implement a secure and engaging betting system, allowing users to place bets on race outcomes, driver performance, and other events. This could involve virtual currency, leaderboards, and reward systems.
  - **Live Race Tracking:** Integrate live race data to provide real-time updates on driver positions, lap times, and race incidents. Visualizations like live maps and timing charts would enhance the user experience.
  - **Personalized Predictions:** Develop a machine learning model to offer personalized race predictions based on historical data, driver performance, and user preferences.
  - **Social Features:** Enhance user engagement by integrating social features like chat rooms, forums, and the ability to share predictions and results with friends.
  - **Expanded Content:** Provide more in-depth content beyond race results, such as driver profiles, team histories, technical analysis, and news articles.
