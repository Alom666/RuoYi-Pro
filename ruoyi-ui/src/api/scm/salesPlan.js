
import request from '@/utils/request'

// 查询销售计划列表
export function listSalesPlan(query) {
  return request({
    url: '/scm/salesPlan/list',
    method: 'get',
    params: query
  })
}

// 查询销售计划详细
export function getSalesPlan(planId) {
  return request({
    url: '/scm/salesPlan/' + planId,
    method: 'get'
  })
}

// 新增销售计划
export function addSalesPlan(data) {
  return request({
    url: '/scm/salesPlan',
    method: 'post',
    data: data
  })
}

// 修改销售计划
export function updateSalesPlan(data) {
  return request({
    url: '/scm/salesPlan',
    method: 'put',
    data: data
  })
}

// 删除销售计划
export function delSalesPlan(planIds) {
  return request({
    url: '/scm/salesPlan/' + planIds,
    method: 'delete'
  })
}

// 导出销售计划
export function exportSalesPlan(query) {
  return request({
    url: '/scm/salesPlan/export',
    method: 'post',
    params: query
  })
}
