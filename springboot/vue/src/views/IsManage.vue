<template>
  <div>
    <div style="padding: 10px 0">
      <el-input style="width: 200px" placeholder="请输入姓名" suffix-icon="el-icon-search" v-model="Idenname"></el-input>
      <el-input style="width: 200px" placeholder="请输入性别" suffix-icon="el-icon-message"class="ml-5" v-model="sex"></el-input>
      <el-input style="width: 200px" placeholder="请输入手机号码" suffix-icon="el-icon-position"class="ml-5" v-model="phone"></el-input>
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </div>

    <div style="padding-top: 10px ">
      <el-button type="primary" @click="handleAdd" class="el-icon-circle-plus-outline">新增</el-button>
      <el-popconfirm
          class="ml-5"
          confirm-button-text='确定'
          cancel-button-text='我再想想'
          icon="el-icon-info"
          icon-color="red"
          title="您确定批量删除吗？"
          @confirm="delBatch">
        <el-button type="danger" slot="reference">批量删除<i class="el-icon-remove-outline"></i></el-button>
      </el-popconfirm>
    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'" @selection-change="handleSelectionChange">
      <el-table-column
          type="selection"
          width="55">
      </el-table-column>
      <el-table-column prop="id" label="ID" ></el-table-column>
      <el-table-column prop="name" label="姓名"></el-table-column>
      <el-table-column prop="sex" label="性别"></el-table-column>
      <el-table-column prop="idcard" label="身份证" ></el-table-column>
      <el-table-column prop="phone" label="手机号码" ></el-table-column>
      <el-table-column prop="statas" label="是否确诊"  ></el-table-column>
      <el-table-column prop="idate" label="就诊日期" ></el-table-column>
      <el-table-column prop="place" label="就诊医院" ></el-table-column>
      <el-table-column label="操作" width="150" align="center">
        <template slot-scope="scope">
          <el-button type="success" @click="handleEdit(scope.row)" class="el-icon-edit">编辑</el-button>
          <el-popconfirm
              class="ml-5"
              confirm-button-text='确定'
              cancel-button-text='我再想想'
              icon="el-icon-info"
              icon-color="red"
              title="您确定删除吗？"
              @confirm="del(scope.row.id)"
          >

            <el-button type="danger" slot="reference" class="el-icon-remove-outline">删除</el-button>
          </el-popconfirm>
        </template>
      </el-table-column>

    </el-table>
    <div style="padding: 10px 0">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="pageNum"
          :page-sizes="[2, 5, 10, 20]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </div>

    <el-dialog title="疑似/确诊人员登记表" :visible.sync="dialogFormVisible" width="45%">
      <el-form label-width="100px" size="small">
        <el-form-item label="姓名">
          <el-input v-model="form.Idenname" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="性别">
          <el-radio v-model="form.sex" label="男" autocomplete="off">男</el-radio>
          <el-radio v-model="form.sex" label="女" autocomplete="off">女</el-radio>
        </el-form-item>

        <el-form-item label="身份证">
          <el-input v-model="form.idcard" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="手机号码">
          <el-input v-model="form.phone" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="是否确诊">
          <el-input v-model="form.statas" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="就诊日期" :label-width="formLabelWidth">
          <el-date-picker v-model="form.idate"
                          align="right"
                          type="date"
                          placeholder="选择日期"
                          :picker-options="pickerOptions">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="就诊医院">
          <el-input v-model="form.place" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "Is",
  data(){
    return {
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 5,
      Idenname: "",
      sex: "",
      idcard:"",
      phone: "",
      place: "",
      statas: "",
      idate:"",
      form:{},
      dialogFormVisible: false,
      multipleSelection: [],
      // headerBg: 'headerBg'
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      this.request.get("is/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          username: this.username,
          email: this.email,
          address: this.address,
        }
      }).then(res => {

        this.tableData = res.data.records
        this.total = res.data.total

      })
    },
    //重置
    save() {
      this.request.post("/is", this.form).then(res => {
        if (res.data) {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    //新增
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}
    },
    handleEdit(row) {
      // this.form = JSON.parse(JSON.stringify(row));
      this.form = Object.assign({},row)                   //两个方法都可以--深拷贝方式---解决在页面取消时数据还停留在页面中
      this.dialogFormVisible = true
    },
    //删除
    del(id) {
      this.request.delete("/is/" + id).then(res => {
        if (res.data) {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handleSelectionChange(val) {
      console.log(val)
      this.multipleSelection = val
    },
    delBatch() {
      let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
      this.request.post("/is/del/batch", ids).then(res => {
        if (res.data) {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    reset() {
      this.username = ""
      this.email = ""
      this.address = ""
      this.load()
    },
    handleSizeChange(pageSize) {
      console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    }

  }
}
</script>

<style>
.headerBg {
  background: #eee!important;
}
</style>