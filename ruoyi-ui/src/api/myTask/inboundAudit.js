import request from '@/utils/request'

// 查询入库申请审核列表
export function listInboundAudit(query) {
  return request({
    url: '/myTask/inboundAudit/list',
    method: 'get',
    params: query
  })
}

// 查询入库申请审核详细
export function getInboundAudit(auditId) {
  return request({
    url: '/myTask/inboundAudit/' + auditId,
    method: 'get'
  })
}

// 新增入库申请审核
export function addInboundAudit(data) {
  return request({
    url: '/myTask/inboundAudit',
    method: 'post',
    data: data
  })
}

// 修改入库申请审核
export function updateInboundAudit(data) {
  return request({
    url: '/myTask/inboundAudit',
    method: 'put',
    data: data
  })
}

// 删除入库申请审核
export function delInboundAudit(auditId) {
  return request({
    url: '/myTask/inboundAudit/' + auditId,
    method: 'delete'
  })
}

// 导出入库申请审核
export function exportInboundAudit(query) {
  return request({
    url: '/myTask/inboundAudit/export',
    method: 'post',
    params: query
  })
}
