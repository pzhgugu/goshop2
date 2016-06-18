package org.goshop.common.pojo;

/**
 * Created by Administrator on 2016/3/20.
 */
public enum  ResponseStatus {
    SUCCESS("true",true),
    FAILED("false",false);
    // 成员变量
    private String name;
    private boolean status;
    // 构造方法
    private ResponseStatus(String name, boolean status) {
        this.name = name;
        this.status = status;
    }
    // 普通方法
    public static String get(boolean status) {
        /*for (ResponseStatus c : ResponseStatus.values()) {
            if (c.getStatus() == status) {
                return c.name;
            }
        }
        return null;*/
        return status?SUCCESS.getName():FAILED.getName();
    }
    // get set 方法
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public boolean getStatus() {
        return status;
    }
    public void setStatus(boolean status) {
        this.status = status;
    }
}
