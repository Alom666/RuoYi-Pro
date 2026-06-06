
import request from '@/utils/request'

// 查询补货申请列表
export function listReplenishApply(query) {
  return request({
    url: '/wms/replenishApply/list',
    method: 'get',
    params: query
  })
}

// 查询补货申请详细
export function getReplenishApply(applyId) {
  return request({
    url: '/wms/replenishApply/' + applyId,
    method: 'get'
  })
}

// 新增补货申请
export function addReplenishApply(data) {
  return request({
    url: '/wms/replenishApply',
    method: 'post',
    data: data
  })
}

// 修改补货申请
export function updateReplenishApply(data) {
  return request({
    url: '/wms/replenishApply',
    method: 'put',
    data: data
  })
}

// 提交补货申请
export function submitReplenishApply(applyId) {
  return request({
    url: '/wms/replenishApply/submit/' + applyId,
    method: 'put'
  })
}

// 生成采购申请
export function generatePurchaseApply(applyId) {
  return request({
    url: '/wms/replenishApply/generatePurchase/' + applyId,
    method: 'put'
  })
}

// 删除补货申请
export function delReplenishApply(applyIds) {
  return request({
    url: '/wms/replenishApply/' + applyIds,
    method: 'delete'
  })
}
