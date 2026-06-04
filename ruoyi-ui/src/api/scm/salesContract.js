
import request from '@/utils/request'

// 查询销售合同列表
export function listSalesContract(query) {
  return request({
    url: '/scm/salesContract/list',
    method: 'get',
    params: query
  })
}

// 查询销售合同详细
export function getSalesContract(contractId) {
  return request({
    url: '/scm/salesContract/' + contractId,
    method: 'get'
  })
}

// 新增销售合同
export function addSalesContract(data) {
  return request({
    url: '/scm/salesContract',
    method: 'post',
    data: data
  })
}

// 修改销售合同
export function updateSalesContract(data) {
  return request({
    url: '/scm/salesContract',
    method: 'put',
    data: data
  })
}

// 删除销售合同
export function delSalesContract(contractIds) {
  return request({
    url: '/scm/salesContract/' + contractIds,
    method: 'delete'
  })
}
