package com.project.board.vo;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.stereotype.Component;

@Component("boardVO")
public class BoardVO {
    private int boardNo;
    private String title;
    private String content;
    private String status;
    private int parentNo;
    private String name;
    private String imageFileName;
    private String tag;
    private LocalDateTime creDate;

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

    public String getFormattedCreDate() {
        if (creDate != null) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            return creDate.format(formatter);
        }
        return null;
    }

    public void setCreDate(LocalDateTime creDate) {
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