
import request from '@/utils/request'

// 查询采购合同列表
export function listPurchaseContract(query) {
  return request({
    url: '/scm/purchaseContract/list',
    method: 'get',
    params: query
  })
}

// 查询采购合同详细
export function getPurchaseContract(contractId) {
  return request({
    url: '/scm/purchaseContract/' + contractId,
    method: 'get'
  })
}

// 新增采购合同
export function addPurchaseContract(data) {
  return request({
    url: '/scm/purchaseContract',
    method: 'post',
    data: data
  })
}

// 修改采购合同
export function updatePurchaseContract(data) {
  return request({
    url: '/scm/purchaseContract',
    method: 'put',
    data: data
  })
}

// 删除采购合同
export function delPurchaseContract(contractIds) {
  return request({
    url: '/scm/purchaseContract/' + contractIds,
    method: 'delete'
  })
}
