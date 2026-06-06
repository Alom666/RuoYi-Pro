
import request from '@/utils/request'

// 查询入库申请列表
export function listInboundApply(query) {
  return request({
    url: '/wms/inboundApply/list',
    method: 'get',
    params: query
  })
}

// 查询入库申请详细
export function getInboundApply(applyId) {
  return request({
    url: '/wms/inboundApply/' + applyId,
    method: 'get'
  })
}

// 新增入库申请
export function addInboundApply(data) {
  return request({
    url: '/wms/inboundApply',
    method: 'post',
    data: data
  })
}

// 修改入库申请
export function updateInboundApply(data) {
  return request({
    url: '/wms/inboundApply',
    method: 'put',
    data: data
  })
}

// 删除入库申请
export function delInboundApply(applyIds) {
  return request({
    url: '/wms/inboundApply/' + applyIds,
    method: 'delete'
  })
}
