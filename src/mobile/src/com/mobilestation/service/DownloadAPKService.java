package com.mobilestation.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import android.os.Environment;

public class DownloadAPKService {

	private static DownloadAPKService instance;
	public static DownloadAPKService getInstance(){
		if(null == instance){
			instance = new DownloadAPKService();
		}
		return instance;
	}
	public File getFileAPK(String urlPath) throws Exception{
		URL url = new URL(urlPath);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		InputStream ins = conn.getInputStream();
		File file = null;
		//查询sdk是否可以读写
		if(Environment.MEDIA_MOUNTED.equals(Environment.getExternalStorageState())){
			file = new File(Environment.getExternalStorageDirectory(),"mobilesafe.apk");
			FileOutputStream fos = new FileOutputStream(file);
			byte [] buffer = new byte[1024];
			int len;
			while( (len = ins.read(buffer)) != -1){
				fos.write(buffer,0,len);
			}
			ins.close();
			fos.close();
			conn.disconnect();
	
		}else {
			throw new Exception("sdk卡不可读写");
		}
		return file;
	}

}
