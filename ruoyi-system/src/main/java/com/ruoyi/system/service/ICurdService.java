package com.ruoyi.system.service;

import com.ruoyi.common.core.domain.BaseEntity;
import java.util.List;


public interface ICurdService<T extends BaseEntity> {
    T get(String id);
    List<T> list();
    void add(T t);
    void update(T t);
    void delete(String id);
}
