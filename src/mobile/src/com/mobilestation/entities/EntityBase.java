package com.mobilestation.entities;

public abstract class EntityBase {
	//@Id // �������û��������Ϊid��_id��ʱ����ҪΪ������Ӵ�ע��  // int,long���͵�idĬ������������ʹ������ʱ��Ӵ�ע��
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
