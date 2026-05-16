# 🧥 Clothes App Prototype

A professional Flutter application prototype showcasing advanced UI techniques, including sophisticated **Sliver** usage, MVC architecture, and custom widget extensions.

---

## ✨ Features

- **MVC Architecture**: Clean separation of concerns for better maintainability.
- **Advanced Slivers**: Seamless scroll experiences in both Home and Product Details.
- **Isolates**: High-performance JSON data loading to keep the UI thread buttery smooth.
- **Custom Theme System**: Centralized styling without ad-hoc widget decoration.
- **Widget Extensions**: Clean and readable UI code using custom syntax.

---

## 🏗️ The Power of Slivers

In this project, we've moved beyond simple lists to embrace **Slivers**. If you're new to Flutter, think of a Sliver as a portion of a scrollable area that knows how to behave when it's scrolled.

### Why Slivers?
- **Performance**: Slivers only render what's visible on the screen, making them extremely efficient for long lists or grids.
- **Flexibility**: They allow us to mix grids, lists, and special headers (like sticky or shrinking headers) within a single scrollable view.
- **Smooth Animations**: Slivers are the secret ingredient behind those "premium" scroll effects you see in top-tier apps.

---

## 🏠 Home Page Implementation

The Home Page uses a `CustomScrollView` to orchestrate various UI elements into a single cohesive scroll experience:

1.  **SliverSafeArea**: Ensures our content respects the system status bars and notches.
2.  **SliverToBoxAdapter**: Used for the **Promotional Banner** and the **Horizontal Category List**. It allows standard widgets to live happily inside a Sliver world.
3.  **SliverGrid.builder**: Powers the **Product Grid**. This is highly optimized, rendering products on-demand as you scroll, which is much faster than a standard GridView.

---

## 🛍️ Product Details Header

The Product Details page takes Slivers a step further with a **Flexible Header**:

-   **SliverPersistentHeader**: We use this to create the stunning product image header.
-   **ProductImageHeaderDelegate**: A custom delegate that controls how the image behaves.
    -   **Max Extent**: The image starts large (60% of the screen).
    -   **Min Extent**: As you scroll up, it gracefully shrinks down to the size of a standard toolbar.
-   **Hero Animation**: Combined with Slivers, the product image "flies" from the Home Grid to the Details header, creating a high-end feel.

---

## 🚀 Getting Started

1.  **Clone the repo**:
    ```bash
    git clone https://github.com/your-repo/clothes.git
    ```
2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Run the app**:
    ```bash
    flutter run
    ```

---

## 📂 Project Structure

-   `lib/core/`: Theme, constants, and widget extensions.
-   `lib/models/`: Data structures.
-   `lib/controllers/`: Business logic and data fetching (Isolates).
-   `lib/views/`: UI implementation divided by features.
-   `assets/lookup/`: JSON data source.