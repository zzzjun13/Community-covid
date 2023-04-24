package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 
 * </p>
 *
 * @author zjx
 * @since 2023-04-11
 */
@Getter
@Setter
@TableName("sys_iden")
@ApiModel(value = "Iden对象", description = "")
public class Iden implements Serializable {

    private static final long serialVersionUID = 1L;

      @ApiModelProperty("ID")
        @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

      @ApiModelProperty("名字")
      private String name;

      @ApiModelProperty("性别")
      private Integer sex;

      @ApiModelProperty("身份证")
      private String idcard;

      @ApiModelProperty("手机号码")
      private String phone;

      @ApiModelProperty("是否确诊")
      private String statas;

      @ApiModelProperty("就诊日期")
      private LocalDate idate;

      @ApiModelProperty("就诊医院")
      private String place;

      @ApiModelProperty("登记日期")
      private LocalDateTime redate;


}
