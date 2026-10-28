# Food Quality Detection — MATLAB Image Processing

Food Quality Detection is a MATLAB-based image processing project designed to analyze food images and classify them as fresh or stale/rotten based on visual characteristics.

The project uses color analysis, image segmentation, and texture feature extraction to identify potentially spoiled regions and display the classification results through a graphical user interface.

## Features

### 1. Image Acquisition

- Load food images for analysis.
- Support common image formats such as JPG, PNG, and BMP.

### 2. Image Preprocessing

- Resize images for consistent processing.
- Convert RGB images to HSV color space.
- Apply median filtering to reduce noise.

### 3. Image Segmentation

- Identify potential spoiled regions using color thresholds.
- Generate segmentation masks to highlight detected regions.
- Apply morphological operations to refine segmentation results.

### 4. Feature Extraction

- Analyze brightness and color characteristics.
- Extract texture features using Gray-Level Co-occurrence Matrix (GLCM).
- Calculate the percentage of detected regions.

### 5. Freshness Classification

- Apply predefined rules to classify food images as Fresh or Stale/Rotten.
- Display the predicted classification through the GUI.

### 6. Result Visualization

- Display the original food image.
- Visualize segmented regions.
- Present the final classification result.

## Technology Stack

- MATLAB
- Image Processing Toolbox
- HSV Color Space
- Gray-Level Co-occurrence Matrix (GLCM)
- Image Segmentation and Morphological Operations

## Application Workflow

Image Input → Preprocessing → Color Analysis → Image Segmentation → Feature Extraction → Rule-Based Classification → Result Visualization

## Getting Started

### Prerequisites

- MATLAB installed on your computer
- MATLAB Image Processing Toolbox

### Running the Project

1. Clone or download the repository.
2. Open the project folder in MATLAB.
3. Run the main MATLAB script.
4. Load a food image through the graphical interface.
5. View the segmentation results and predicted classification.

## Project Structure

The repository contains the MATLAB source code, sample food images, and screenshots demonstrating the application's interface and results.

## Purpose

This project demonstrates the application of digital image processing techniques for visual food quality assessment using color analysis, texture features, and rule-based classification.

## Author

**Gargi Ashish Surve**
