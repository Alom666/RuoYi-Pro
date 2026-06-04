
import request from '@/utils/request'

// 查询生产完工单列表
export function listCompletionOrder(query) {
  return request({
    url: '/mes/completionOrder/list',
    method: 'get',
    params: query
  })
}

// 查询生产完工单详细
export function getCompletionOrder(completionId) {
  return request({
    url: '/mes/completionOrder/' + completionId,
    method: 'get'
  })
}

// 修改生产完工单
export function updateCompletionOrder(data) {
  return request({
    url: '/mes/completionOrder',
    method: 'put',
    data: data
  })
}

// 删除生产完工单
export function delCompletionOrder(completionId) {
  return request({
    url: '/mes/completionOrder/' + completionId,
    method: 'delete'
  })
}
