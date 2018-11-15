package codeshare.request.service;

import java.util.List;

import codeshare.dto.Request;

public class RequestListView {
	private int requestTotalCount;
	private int currentPageNumber;
	private List<Request> requestList;
	private int pageTotalCount;
	private int requestCountPerPage;
	private int firstRow;
	private int endRow;
	
	public RequestListView(List<Request> requestList, int requestTotalCount, int currentPageNumber
			, int requestCountPerPage, int startRow, int endRow) {
		this.requestList = requestList;
		this.requestTotalCount = requestTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.requestCountPerPage = requestCountPerPage;
		this.firstRow = startRow;
		this.endRow = endRow;
		
		calculatePageCount();
	}
	
	private void calculatePageCount() {
		if(requestTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = requestTotalCount / requestCountPerPage;
			if(requestTotalCount % requestCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}
	
	public int getRequestTotalCount() {
		return requestTotalCount;
	}
	
	public int getCurrentPageNumber() {
		return currentPageNumber;
	}
	
	public List<Request> getRequestList() {
		return requestList;
	}
	
	public int getPageTotalCount() {
		return pageTotalCount;
	}
	
	public int getRequestCountPerPage() {
		return requestCountPerPage;
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
