
import request from '@/utils/request'

// 查询领料申请列表
export function listMaterialApply(query) {
  return request({
    url: '/mes/materialApply/list',
    method: 'get',
    params: query
  })
}

// 查询领料申请详细
export function getMaterialApply(applyId) {
  return request({
    url: '/mes/materialApply/' + applyId,
    method: 'get'
  })
}

// 新增领料申请
export function addMaterialApply(data) {
  return request({
    url: '/mes/materialApply',
    method: 'post',
    data: data
  })
}

// 修改领料申请
export function updateMaterialApply(data) {
  return request({
    url: '/mes/materialApply',
    method: 'put',
    data: data
  })
}

// 删除领料申请
export function delMaterialApply(applyId) {
  return request({
    url: '/mes/materialApply/' + applyId,
    method: 'delete'
  })
}

// 导出领料申请
export function exportMaterialApply(query) {
  return request({
    url: '/mes/materialApply/export',
    method: 'post',
    params: query
  })
}

// 审核领料申请
export function auditMaterialApply(data) {
  return request({
    url: '/mes/materialApply/audit',
    method: 'put',
    data: data
  })
}
