package com.springapp2.others;

import com.springapp.domain.CommonVo;

/**
 * Created by jooyoung on 2015-11-25.
 */
public class ProductVo extends CommonVo {

    private String SLITM_CD;    //상품코드
    private String SLITM_NM;    //상품명
    private String ITEM_URL;    //상품주소

    public String getSLITM_CD() {
        return SLITM_CD;
    }

    public void setSLITM_CD(String SLITM_CD) {
        this.SLITM_CD = SLITM_CD;
    }

    public String getSLITM_NM() {
        return SLITM_NM;
    }

    public void setSLITM_NM(String SLITM_NM) {
        this.SLITM_NM = SLITM_NM;
    }

    public String getITEM_URL() {
        return ITEM_URL;
    }

    public void setITEM_URL(String ITEM_URL) {
        this.ITEM_URL = ITEM_URL;
    }
}
