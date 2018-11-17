package codeshare.upload.service;

import java.util.List;

import codeshare.dto.Upload;

public class UploadListView {
	private int uploadTotalCount;
	private int currentPageNumber;
	private List<Upload> uploadList;
	private int pageTotalCount;
	private int uploadCountPerPage;
	private int firstRow;
	private int endRow;
	
	public UploadListView(List<Upload> uploadList, int uploadTotalCount, int currentPageNumber
			, int uploadCountPerPage, int startRow, int endRow) {
		this.uploadList = uploadList;
		this.uploadTotalCount = uploadTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.uploadCountPerPage = uploadCountPerPage;
		this.firstRow = startRow;
		this.endRow = endRow;
		
		calculatePageCount();
	}
	
	private void calculatePageCount() {
		if(uploadTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = uploadTotalCount / uploadCountPerPage;
			if(uploadTotalCount % uploadCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}
	
	public int getUploadTotalCount() {
		return uploadTotalCount;
	}
	
	public int getCurrentPageNumber() {
		return currentPageNumber;
	}
	
	public List<Upload> getUploadList() {
		return uploadList;
	}
	
	public int getPageTotalCount() {
		return pageTotalCount;
	}
	
	public int getUploadCountPerPage() {
		return uploadCountPerPage;
	}
	
	public int getFirstRow() {
		return firstRow;
	}
	
	public int getEndRow() {
		return endRow;
	}
	
	public boolean isEmpty() {
		return pageTotalCount == 0;
	}
}
