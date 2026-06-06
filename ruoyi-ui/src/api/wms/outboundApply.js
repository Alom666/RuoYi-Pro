
import request from '@/utils/request'

// 查询出库申请列表
export function listOutboundApply(query) {
  return request({
    url: '/wms/outboundApply/list',
    method: 'get',
    params: query
  })
}

// 查询出库申请详细
export function getOutboundApply(applyId) {
  return request({
    url: '/wms/outboundApply/' + applyId,
    method: 'get'
  })
}

// 新增出库申请
export function addOutboundApply(data) {
  return request({
    url: '/wms/outboundApply',
    method: 'post',
    data: data
  })
}

// 修改出库申请
export function updateOutboundApply(data) {
  return request({
    url: '/wms/outboundApply',
    method: 'put',
    data: data
  })
}

// 提交出库申请
export function submitOutboundApply(applyId) {
  return request({
    url: '/wms/outboundApply/submit/' + applyId,
    method: 'put'
  })
}

// 删除出库申请
export function delOutboundApply(applyIds) {
  return request({
    url: '/wms/outboundApply/' + applyIds,
    method: 'delete'
  })
}
