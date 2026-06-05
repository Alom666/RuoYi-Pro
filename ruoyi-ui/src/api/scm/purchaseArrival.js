
import request from '@/utils/request'

// 查询采购到货列表
export function listPurchaseArrival(query) {
  return request({
    url: '/scm/purchaseArrival/list',
    method: 'get',
    params: query
  })
}

// 查询采购到货详细
export function getPurchaseArrival(arrivalId) {
  return request({
    url: '/scm/purchaseArrival/' + arrivalId,
    method: 'get'
  })
}

// 新增采购到货
export function addPurchaseArrival(data) {
  return request({
    url: '/scm/purchaseArrival',
    method: 'post',
    data: data
  })
}

// 修改采购到货
export function updatePurchaseArrival(data) {
  return request({
    url: '/scm/purchaseArrival',
    method: 'put',
    data: data
  })
}

// 删除采购到货
export function delPurchaseArrival(arrivalIds) {
  return request({
    url: '/scm/purchaseArrival/' + arrivalIds,
    method: 'delete'
  })
}
