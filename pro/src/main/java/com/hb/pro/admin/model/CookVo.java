package com.hb.pro.admin.model;

public class CookVo {
	private int cook_num;
	private String title;
	private String mat;
	private String text;
	private String path;
	
	public CookVo() {

	}

	public int getCook_num() {
		return cook_num;
	}

	public void setCook_num(int cook_num) {
		this.cook_num = cook_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMat() {
		return mat;
	}

	public void setMat(String mat) {
		this.mat = mat;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public String toString() {
		return "CookVo [cook_num=" + cook_num + ", title=" + title + ", mat="
				+ mat + ", text=" + text + ", path=" + path + "]";
	}

	public CookVo(int cook_num, String title, String mat, String text,
			String path) {
		super();
		this.cook_num = cook_num;
		this.title = title;
		this.mat = mat;
		this.text = text;
		this.path = path;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((mat == null) ? 0 : mat.hashCode());
		result = prime * result + ((path == null) ? 0 : path.hashCode());
		result = prime * result + ((text == null) ? 0 : text.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CookVo other = (CookVo) obj;
		if (mat == null) {
			if (other.mat != null)
				return false;
		} else if (!mat.equals(other.mat))
			return false;
		if (path == null) {
			if (other.path != null)
				return false;
		} else if (!path.equals(other.path))
			return false;
		if (text == null) {
			if (other.text != null)
				return false;
		} else if (!text.equals(other.text))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}
	
	
}
