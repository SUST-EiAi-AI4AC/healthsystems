package com.nwpu.healthsystem.backend.utils;

import lombok.Data;


@Data
public class PageInfo {
    // 总条数
    private int totalNumber;
    // 当前页
    private int currentPage;
    // 下面进行计算
    private int totalPage;
    // 页面大小
    private int pageSize;

    private int startIndex;

    private int totalSelect;


    public PageInfo() {

    }

    public PageInfo(int currentPage, int pageSize) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
    }

    // 简单计算，总页数和 设置不规范的当前页
    public void count() {
        int totalPageTemp = this.totalNumber/this.pageSize;
        int plus = (this.totalNumber % this.pageSize) == 0? 0 : 1;
        totalPageTemp += plus;
        if(totalPageTemp <= 0) {
            totalPageTemp = 1;
        }
        this.totalPage = totalPageTemp;

        if(this.totalPage < this.currentPage) {
            this.currentPage = this.totalPage;
        }

        if(this.currentPage < 1) {
            this.currentPage = 1;
        }

        this.startIndex = (this.currentPage - 1) * this.pageSize;
        this.totalSelect = this.pageSize;
    }
}
