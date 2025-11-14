# NazerkeTableView – My Favorites App

## Overview
This iOS app displays my favorite items across four categories using **UITableView** with **custom cells**, fully implemented via **UIKit + Storyboard**.

The app demonstrates:
- Custom `UITableViewCell`
- Multiple table sections
- Proper use of `UITableViewDelegate` and `UITableViewDataSource`
- Clean UI design and responsive layout on all iPhone devices

## Features

### ✔ 4 Sections:
1. Favorite Movies  
2. Favorite Music  
3. Favorite Books  
4. Favorite University Courses  

Each section contains **5 items**, loaded from a structured model.

## Custom Cell Includes:
- **Image View** (fixed size)
- **Title Label** (bold)
- **Subtitle Label** (secondary style)
- **Review Label** (multi-line review with dynamic height)

## Auto Layout Highlights
- Dynamic cell height using `UITableView.automaticDimension`
- No fixed label heights → all labels expand based on text
- Content hugging & compression priorities applied:
  - Labels do not get squished
  - Image stays fixed in size
- Proper constraints:
  - Image: fixed width/height + leading/top
  - Labels: aligned to image + trailing to content view
  - Review label grows vertically

## Data Model
Each item is stored as:

```swift
struct FavoriteItem {
    let title: String
    let subtitle: String
    let review: String
    let imageName: String
}

<img width="1206" height="2622" alt="image" src="https://github.com/user-attachments/assets/ab32277e-78d0-41a2-b7f6-842ab3d9d33a" />
<img width="1206" height="2622" alt="image" src="https://github.com/user-attachments/assets/28807f32-83d0-4f6f-b51d-3fceaec1a748" />
<img width="1206" height="2622" alt="image" src="https://github.com/user-attachments/assets/c52f14ff-2681-4d14-b22f-c85a2f1dc0de" />
