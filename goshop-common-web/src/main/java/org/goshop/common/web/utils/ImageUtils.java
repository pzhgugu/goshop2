package org.goshop.common.web.utils;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.goshop.common.utils.FileUtils;
import org.goshop.common.utils.IDUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.image.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * 创 建 人：gugu
 * 创建日期：2015-05-25
 * 修 改 人：
 * 修改日 期：
 * 描   述：图片操作工具类。  
 */
public class ImageUtils {
	


	/**
	 * @param inputStream
	 *            源图像地址
	 * @param x
	 *            目标切片起点x坐标
	 * @param y
	 *            目标切片起点y坐标
	 * @param destWidth
	 *            目标切片宽度
	 * @param destHeight
	 *            目标切片高度
	 */
	public static void abscut(InputStream inputStream, int x, int y, int destWidth,
			int destHeight,int size,String destImagePath) throws IOException {
			Image img;
			ImageFilter cropFilter;
			// 读取源图像
			BufferedImage bi = ImageIO.read(inputStream);
			int srcWidth = bi.getWidth(); // 源图宽度
			int srcHeight = bi.getHeight(); // 源图高度

			int scale=0;
			if(srcWidth>srcHeight){
				scale=srcWidth;
			}else{
				scale=srcHeight;
			}
			//if (srcWidth >= destWidth && srcHeight >= destHeight) {
				Image image = bi.getScaledInstance(srcWidth, srcHeight,
						Image.SCALE_DEFAULT);

				/* ****************************************
				 * 判断原图的宽高和DIV宽高的大小 根据图片外层DIV的宽度，选择的起始点则有相对变化
				 * **************************************
				 */
				int x1 = x*scale/size;
				int y1 = y*scale/size;
				int w = destWidth*scale/size;
				int h = destHeight*scale/size;

				// 四个参数分别为图像起点坐标和宽高
				// 即: CropImageFilter(int x,int y,int width,int height)
				cropFilter = new CropImageFilter(x1, y1, w, h);
				img = Toolkit.getDefaultToolkit().createImage(
						new FilteredImageSource(image.getSource(), cropFilter));
				BufferedImage tag = new BufferedImage(w, h,
						BufferedImage.TYPE_INT_RGB);
				Graphics g = tag.getGraphics();
				g.drawImage(img, 0, 0, null); // 绘制缩小后的图
				g.dispose();
				// 输出为文件
				File file = new File(destImagePath);  
			    // 判断目录或文件是否存在 ,不存在创建文件夹
				if(!file.getParentFile().exists()){
					file.getParentFile().mkdirs();
				}
				ImageIO.write(tag, "JPEG",file);
			//}
	}

	public static void abscut(InputStream inputStream, int x, int y,  int width, int height,String destImagePath) throws IOException {

			Image img;
			ImageFilter cropFilter;
			// 读取源图像
			BufferedImage bi = ImageIO.read(inputStream);
			int srcWidth = bi.getWidth(); // 源图宽度
			int srcHeight = bi.getHeight(); // 源图高度
			//if (srcWidth >= destWidth && srcHeight >= destHeight) {
			Image image = bi.getScaledInstance(srcWidth, srcHeight,
					Image.SCALE_DEFAULT);
			// 四个参数分别为图像起点坐标和宽高
			// 即: CropImageFilter(int x,int y,int width,int height)
			cropFilter = new CropImageFilter(x, y, width, height);
			img = Toolkit.getDefaultToolkit().createImage(
					new FilteredImageSource(image.getSource(), cropFilter));
			BufferedImage tag = new BufferedImage(width, height,
					BufferedImage.TYPE_INT_RGB);
			Graphics g = tag.getGraphics();
			g.drawImage(img, 0, 0, null); // 绘制缩小后的图
			g.dispose();
			// 输出为文件
			File file = new File(destImagePath);
			// 判断目录或文件是否存在 ,不存在创建文件夹
			if(!file.getParentFile().exists()){
				file.getParentFile().mkdirs();
			}
			ImageIO.write(tag, "JPEG",file);
			//}
	}

	/**
	 * 图片缩放
	 * @param originalFile
	 * @param resizedFile
	 * @param newWidth
	 * @param quality
	 * @throws IOException
	 */
	public static void resize(File originalFile, File resizedFile,
							  int newWidth, float quality) throws IOException {

		if (quality > 1) {
			throw new IllegalArgumentException(
					"Quality has to be between 0 and 1");
		}

		ImageIcon ii = new ImageIcon(originalFile.getCanonicalPath());
		resize(ii, resizedFile,newWidth,quality);
	} // Example usage

	public static void resize(Image image, File resizedFile,
							  int newWidth, float quality) throws IOException {

		if (quality > 1) {
			throw new IllegalArgumentException(
					"Quality has to be between 0 and 1");
		}

		ImageIcon ii = new ImageIcon(image);
		resize(ii, resizedFile,newWidth,quality);
	} // Example usage

	public static void resize(ImageIcon ii, File resizedFile,
							  int newWidth, float quality) throws IOException {

		if (quality > 1) {
			throw new IllegalArgumentException(
					"Quality has to be between 0 and 1");
		}
		Image i = ii.getImage();
		Image resizedImage = null;

		int iWidth = i.getWidth(null);
		int iHeight = i.getHeight(null);

		if (iWidth > iHeight) {
			resizedImage = i.getScaledInstance(newWidth, (newWidth * iHeight)
					/ iWidth, Image.SCALE_SMOOTH);
		} else {
			resizedImage = i.getScaledInstance((newWidth * iWidth) / iHeight,
					newWidth, Image.SCALE_SMOOTH);
		}

		// This code ensures that all the pixels in the image are loaded.
		Image temp = new ImageIcon(resizedImage).getImage();

		// Create the buffered image.
		BufferedImage bufferedImage = new BufferedImage(temp.getWidth(null),
				temp.getHeight(null), BufferedImage.TYPE_INT_RGB);

		// Copy image to buffered image.
		Graphics g = bufferedImage.createGraphics();

		// Clear background and paint the image.
		g.setColor(Color.white);
		g.fillRect(0, 0, temp.getWidth(null), temp.getHeight(null));
		g.drawImage(temp, 0, 0, null);
		g.dispose();

		// Soften.
		float softenFactor = 0.05f;
		float[] softenArray = { 0, softenFactor, 0, softenFactor,
				1 - (softenFactor * 4), softenFactor, 0, softenFactor, 0 };
		Kernel kernel = new Kernel(3, 3, softenArray);
		ConvolveOp cOp = new ConvolveOp(kernel, ConvolveOp.EDGE_NO_OP, null);
		bufferedImage = cOp.filter(bufferedImage, null);

		// Write the jpeg to a file.
		FileOutputStream out = new FileOutputStream(resizedFile);

		// Encodes image as a JPEG data stream
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);

		JPEGEncodeParam param = encoder
				.getDefaultJPEGEncodeParam(bufferedImage);

		param.setQuality(quality, true);

		encoder.setJPEGEncodeParam(param);
		encoder.encode(bufferedImage);
	} // Example usage

	public static String save(String rootPath,String catalogue,MultipartFile pic, int maxWidth) throws IOException {
		BufferedImage bi = null;
		InputStream is =null;

		is = pic.getInputStream();
			// 读取源图像
		bi = ImageIO.read(is);
		int srcWidth = bi.getWidth(); // 源图宽度
		int srcHeight = bi.getHeight(); // 源图高度
		Image image = bi.getScaledInstance(srcWidth, srcHeight,
				Image.SCALE_DEFAULT);
		String fileName = pic.getOriginalFilename();
		String type= FileUtils.getFileType(fileName).toLowerCase();

		StringBuffer pathSB = new StringBuffer();
		pathSB.append(catalogue);
		pathSB.append("/");
		String uuid = IDUtils.getUuid();
		pathSB.append(uuid+"."+type);

		if(srcWidth>maxWidth){
			srcHeight=maxWidth;
		}
		String filePath = pathSB.toString();

		File file= new File(rootPath+filePath);
		if(!file.getParentFile().exists()){
			file.getParentFile().mkdirs();
		}
		ImageUtils.resize(image, file, srcHeight, 1);
		return filePath;
	}

	public static File save(MultipartFile pic, int maxWidth) throws IOException {
		BufferedImage bi = null;
		InputStream is =null;

		is = pic.getInputStream();
		// 读取源图像
		bi = ImageIO.read(is);
		int srcWidth = bi.getWidth(); // 源图宽度
		int srcHeight = bi.getHeight(); // 源图高度
		Image image = bi.getScaledInstance(srcWidth, srcHeight,
				Image.SCALE_DEFAULT);
		if(srcWidth>maxWidth){
			srcHeight=maxWidth;
		}
		CommonsMultipartFile cf= (CommonsMultipartFile)pic;
		DiskFileItem fi = (DiskFileItem)cf.getFileItem();
		File file = fi.getStoreLocation();
		ImageUtils.resize(image, file, srcHeight, 1);
		return file;
	}

	public static void abscut(InputStream inputStream, int x, int y,  int width, int height,File file) throws IOException {

		Image img;
		ImageFilter cropFilter;
		// 读取源图像
		BufferedImage bi = ImageIO.read(inputStream);
		int srcWidth = bi.getWidth(); // 源图宽度
		int srcHeight = bi.getHeight(); // 源图高度
		//if (srcWidth >= destWidth && srcHeight >= destHeight) {
		Image image = bi.getScaledInstance(srcWidth, srcHeight,
				Image.SCALE_DEFAULT);
		// 四个参数分别为图像起点坐标和宽高
		// 即: CropImageFilter(int x,int y,int width,int height)
		cropFilter = new CropImageFilter(x, y, width, height);
		img = Toolkit.getDefaultToolkit().createImage(
				new FilteredImageSource(image.getSource(), cropFilter));
		BufferedImage tag = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		Graphics g = tag.getGraphics();
		g.drawImage(img, 0, 0, null); // 绘制缩小后的图
		g.dispose();
		ImageIO.write(tag, "JPEG", file);
		//}
	}
}
