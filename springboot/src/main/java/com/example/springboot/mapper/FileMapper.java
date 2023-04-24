package com.example.springboot.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.springboot.entity.Files;
import org.apache.ibatis.annotations.Mapper;


/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zjx
 * @since 2023-04-11
 */

@Mapper
public interface FileMapper extends BaseMapper<Files> {

}
