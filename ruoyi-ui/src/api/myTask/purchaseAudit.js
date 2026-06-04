import request from '@/utils/request'

// 查询采购申请审核列表
export function listPurchaseAudit(query) {
  return request({
    url: '/myTask/purchaseAudit/list',
    method: 'get',
    params: query
  })
}

// 查询采购申请审核详细
export function getPurchaseAudit(auditId) {
  return request({
    url: '/myTask/purchaseAudit/' + auditId,
    method: 'get'
  })
}

// 新增采购申请审核
export function addPurchaseAudit(data) {
  return request({
    url: '/myTask/purchaseAudit',
    method: 'post',
    data: data
  })
}

// 修改采购申请审核
export function updatePurchaseAudit(data) {
  return request({
    url: '/myTask/purchaseAudit',
    method: 'put',
    data: data
  })
}

// 删除采购申请审核
export function delPurchaseAudit(auditId) {
  return request({
    url: '/myTask/purchaseAudit/' + auditId,
    method: 'delete'
  })
}

// 导出采购申请审核
export function exportPurchaseAudit(query) {
  return request({
    url: '/myTask/purchaseAudit/export',
    method: 'post',
    params: query
  })
}
