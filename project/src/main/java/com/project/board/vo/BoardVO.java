package com.project.board.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("boardVO")
public class BoardVO {
	 private int boardNo;
	 private String title;
	 private String content;
	 private Date creDate;
	 private String status;
	 private int parentNo;
	 private String name;
	 private String imageFileName;
	 private String tag;
	 
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getParentNo() {
		return parentNo;
	}
	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getTag() {
		return tag;
	}
	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", creDate=" + creDate
				+ ", status=" + status + ", parentNo=" + parentNo + ", name=" + name + ", imageFileName="
				+ imageFileName + ", tag=" + tag + "]";
	}

	 

}
