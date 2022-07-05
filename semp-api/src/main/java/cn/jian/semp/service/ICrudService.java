package cn.jian.semp.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ICrudService<T,D> {
    D get(String id);
    Page<D> page(String ownerId, Pageable pageable);
    T create(D data);
    void update(D data);
    void delete(List<String> ids);
    D entityToModel(T entity);
    T modelToEntity(D data);
}
