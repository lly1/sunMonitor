package com.kaihuands.po;

import java.io.Serializable;
import java.util.List;

public class AjaxJson implements Serializable {
	    private boolean success = false;
	    private int totals;
	    private List<?> data;
		public boolean isSuccess() {
			return success;
		}
		public void setSuccess(boolean success) {
			this.success = success;
		}
		public int getTotal() {
			return totals;
		}
		public void setTotal(int totals) {
			this.totals = totals;
		}
		public List<?> getData() {
			return data;
		}
		public void setData(List<?> list) {
			this.data = list;
		}
	    
}
