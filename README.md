# 🖼️ Image Denoising Using Advanced Filtering Techniques

Welcome to the **Image Denoising** project! This repository explores various advanced filtering techniques designed to remove noise from images while preserving essential features like edges and textures. We investigate both time-domain and frequency-domain filters, evaluating their performance across different noise types and levels.

---

## 🛠️ Filters Implemented

Here’s a rundown of the advanced filters included in this project:

1. **🪄 Decision-Based Coupled Window Median Filter**  
   A dynamic time-domain filter that adjusts its window size based on the noise level, effectively removing impulse noise while preserving image details.

2. **🔄 Switching-Based Median Filter**  
   This filter alternates between two median filters with different window sizes, excelling at removing high-density salt and pepper noise.

3. **📏 Noise Density Range Sensitive Mean Median Filter**  
   By calculating mean and median values within a window, this filter uses noise density to set thresholds, effectively tackling impulse noise while maintaining image integrity.

4. **🔍 Adaptive Median Filter**  
   Adapting its window size based on pixel value ranges, this filter is effective against various noise types, including salt and pepper as well as Gaussian noise.

5. **🌐 Dual Domain Image Denoising Filter**  
   Operating in both spatial and frequency domains, this filter employs a Gaussian filter in the frequency domain and a bilateral filter in the spatial domain, making it effective for Gaussian noise removal.

---

## 📁 Project Structure

- **📜 Code:** MATLAB code implementations for each filter.
- **🖼️ Images:** Sample images used for testing and demonstration purposes.
- **📊 Results:** Detailed results showcasing the performance of the filters on various images with different noise types and levels, along with quality assessment metrics.

---

## 🚀 Getting Started

Follow these steps to get started with the project:

1. **Clone the repository.**
   ```bash
   https://github.com/dakshabrol/image-denoising-advanced-filters
   ```
2. **Install MATLAB.**
3. **Run the MATLAB scripts** to apply the filters to your images.
4. **Analyze the results** and compare the performance of different filters.

---

## 📈 Results and Discussion

The project report includes a comprehensive analysis of the results obtained by applying the filters to various images. Performance is evaluated using metrics such as:

- **Mean Squared Error (MSE)**
- **Root Mean Squared Error (RMSE)**
- **Peak Signal-to-Noise Ratio (PSNR)**
- **Structural Similarity Index (SSIM)**
- **Image Enhancement Factor (IEF)**

The findings reveal the effectiveness of the filters in removing noise while preserving image details. Notably, the **Decision-Based Coupled Window Median Filter** and **Adaptive Median Filter** excel at preserving edges and textures, while the **Switching-Based Median Filter** efficiently tackles high-density salt and pepper noise.

---

## 🏁 Conclusion

This project provides an in-depth study of advanced filtering techniques for image denoising. The implemented filters offer robust solutions for various noise types while maintaining critical image features. These techniques hold significant potential for applications in medical imaging, remote sensing, computer vision, and other image processing tasks.

---

## 🔮 Future Work

We aim to expand this project by:

- Exploring applications of these filters in other image processing tasks such as image enhancement and restoration.
- Investigating the combination of different filters for improved denoising performance.
- Implementing the filters in other programming languages or platforms for broader accessibility.

---

## 📚 References

The project report includes a curated list of references to research papers and articles that provide the theoretical background and implementation details for the filters used in this project.

---

Feel free to contribute, report issues, or suggest improvements! Happy coding! 🎉
