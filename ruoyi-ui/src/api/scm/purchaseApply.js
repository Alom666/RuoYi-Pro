
import request from '@/utils/request'

// 查询采购申请列表
export function listPurchaseApply(query) {
  return request({
    url: '/scm/purchaseApply/list',
    method: 'get',
    params: query
  })
}

// 查询采购申请详细
export function getPurchaseApply(applyId) {
  return request({
    url: '/scm/purchaseApply/' + applyId,
    method: 'get'
  })
}

// 新增采购申请
export function addPurchaseApply(data) {
  return request({
    url: '/scm/purchaseApply',
    method: 'post',
    data: data
  })
}

// 修改采购申请
export function updatePurchaseApply(data) {
  return request({
    url: '/scm/purchaseApply',
    method: 'put',
    data: data
  })
}

// 删除采购申请
export function delPurchaseApply(applyIds) {
  return request({
    url: '/scm/purchaseApply/' + applyIds,
    method: 'delete'
  })
}
