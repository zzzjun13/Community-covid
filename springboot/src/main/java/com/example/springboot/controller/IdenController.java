package com.example.springboot.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.Result;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import com.example.springboot.service.IdenService;
import com.example.springboot.entity.Iden;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zjx
 * @since 2023-04-11
 */
@RestController
@RequestMapping("/iden")
public class IdenController {

    @Resource
    private IdenService idenService;

    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody Iden iden) {
            return Result.success(idenService.saveOrUpdate(iden));
    }
// 查询所有数据
    @GetMapping
    public Result findAll() {
            return Result.success(idenService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
            return Result.success(idenService.getById(id));
    }

//删除接口
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
            return Result.success(idenService.removeById(id));
    }
//批量删除接口
    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
            return Result.success(idenService.removeByIds(ids));
    }

//分页查询-- Mybatis--plus 的方式
    @GetMapping("/page")
    public Result findPage(@RequestParam Integer pageNum,
                           @RequestParam Integer pageSize
                                                            ){
        QueryWrapper<Iden> queryWrapper = new QueryWrapper<>();

        queryWrapper.orderByDesc("id");
        return Result.success(idenService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

}

