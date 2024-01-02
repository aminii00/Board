package com.project.board.vo;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.stereotype.Component;

@Component("boardVO")
public class BoardVO {
    private int boardNo;
    private String title;
    private String content;
    private String name;
    private String imageFileName;
    private LocalDateTime creDate;


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

    @Override
    public String toString() {
        return "BoardVO [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", creDate=" + creDate
                + ", name=" + name + ", imageFileName="
                + imageFileName + "]";
    }
}