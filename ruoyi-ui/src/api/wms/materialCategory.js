
import request from '@/utils/request'

// 查询物料分类列表
export function listMaterialCategory(query) {
  return request({
    url: '/wms/materialCategory/list',
    method: 'get',
    params: query
  })
}

// 查询物料分类树结构
export function treeMaterialCategory(query) {
  return request({
    url: '/wms/materialCategory/tree',
    method: 'get',
    params: query
  })
}

// 查询物料分类下拉树结构
export function treeselect() {
  return request({
    url: '/wms/materialCategory/treeselect',
    method: 'get'
  })
}

// 查询物料分类详细
export function getMaterialCategory(categoryId) {
  return request({
    url: '/wms/materialCategory/' + categoryId,
    method: 'get'
  })
}

// 新增物料分类
export function addMaterialCategory(data) {
  return request({
    url: '/wms/materialCategory',
    method: 'post',
    data: data
  })
}

// 修改物料分类
export function updateMaterialCategory(data) {
  return request({
    url: '/wms/materialCategory',
    method: 'put',
    data: data
  })
}

// 删除物料分类
export function delMaterialCategory(categoryId) {
  return request({
    url: '/wms/materialCategory/' + categoryId,
    method: 'delete'
  })
}
