package cn.pi.action;

import java.io.File;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

public class Office2Pdf {

	static final int wdDoNotSaveChanges = 0;// 不保存待定的更改。  
	static final int wdFormatPDF = 17;// word转PDF 格式  
	static final int ppSaveAsPDF = 32;// ppt 转PDF 格式
	
	
	public void word2pdf(String source,String target){  
		System.out.println("启动Word");  
		long start = System.currentTimeMillis();  
		ActiveXComponent app = null;  
		try {  
			app = new ActiveXComponent("Word.Application");  
			app.setProperty("Visible", false);  
		  
			Dispatch docs = app.getProperty("Documents").toDispatch();  
			System.out.println("打开文档" + source);  
			Dispatch doc = Dispatch.call(docs,//  
					"Open", //  
					source,// FileName  
					false,// ConfirmConversions  
					true // ReadOnly  
			).toDispatch();  
		  
			System.out.println("转换文档到PDF " + target);  
			File tofile = new File(target);  
			if (tofile.exists()) {  
				tofile.delete();  
			}  
			Dispatch.call(doc,//  
					"SaveAs", //  
					target, // FileName  
					wdFormatPDF);  
		  
			Dispatch.call(doc, "Close", false);  
			long end = System.currentTimeMillis();  
			System.out.println("转换完成..用时：" + (end - start) + "ms.");  
		} catch (Exception e) {  
			System.out.println("========Error:文档转换失败：" + e.getMessage());  
		} finally {  
			if (app != null)  
				app.invoke("Quit", wdDoNotSaveChanges);  
			//System.out.println("结束");
		}  
	}
	
	public void ppt2pdf(String source,String target){  
		System.out.println("启动PPT");  
		long start = System.currentTimeMillis();  
		ActiveXComponent app = null;  
		try {  
			app = new ActiveXComponent("Powerpoint.Application");  
			Dispatch presentations = app.getProperty("Presentations").toDispatch();  
			System.out.println("打开文档" + source);  
			Dispatch presentation = Dispatch.call(presentations,//  
					"Open",   
					source,// FileName  
					true,// ReadOnly  
					true,// Untitled 指定文件是否有标题。  
					false // WithWindow 指定文件是否可见。  
			).toDispatch();  
		  
			System.out.println("转换文档到PDF " + target);  
			File tofile = new File(target);  
			if (tofile.exists()) {  
				tofile.delete();  
			}  
			Dispatch.call(presentation,//  
					"SaveAs", //  
					target, // FileName  
					ppSaveAsPDF);  
		  
			Dispatch.call(presentation, "Close");  
			long end = System.currentTimeMillis();  
			System.out.println("转换完成..用时：" + (end - start) + "ms.");  
		} catch (Exception e) {  
			System.out.println("========Error:文档转换失败：" + e.getMessage());  
		} finally {  
			if (app != null) app.invoke("Quit");  
		}  
	}
	
	public void excel2pdf(String source, String target) {  
		System.out.println("启动Excel");  
		long start = System.currentTimeMillis();  
		ActiveXComponent app = new ActiveXComponent("Excel.Application"); // 启动excel(Excel.Application)  
		try {  
			app.setProperty("Visible", false);  
			Dispatch workbooks = app.getProperty("Workbooks").toDispatch();  
			System.out.println("打开文档" + source);  
			Dispatch workbook = Dispatch.invoke(workbooks, "Open", Dispatch.Method, new Object[]{source, new Variant(false),new Variant(false)}, new int[3]).toDispatch();  
			Dispatch.invoke(workbook, "SaveAs", Dispatch.Method, new Object[] {  
					target, new Variant(57), new Variant(false),  
					new Variant(57), new Variant(57), new Variant(false),  
					new Variant(true), new Variant(57), new Variant(true),  
					new Variant(true), new Variant(true) }, new int[1]);  
			Variant f = new Variant(false);  
			System.out.println("转换文档到PDF " + target);  
			Dispatch.call(workbook, "Close", f);  
			long end = System.currentTimeMillis();  
			System.out.println("转换完成..用时：" + (end - start) + "ms.");  
		} catch (Exception e) {  
			System.out.println("========Error:文档转换失败：" + e.getMessage());  
		}finally {  
			if (app != null){  
				app.invoke("Quit", new Variant[] {});  
			}  
		}  
	} 
	
}
