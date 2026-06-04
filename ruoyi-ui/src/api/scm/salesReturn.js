
import request from '@/utils/request'

// 查询销售退货列表
export function listSalesReturn(query) {
  return request({
    url: '/scm/salesReturn/list',
    method: 'get',
    params: query
  })
}

// 查询销售退货详细
export function getSalesReturn(returnId) {
  return request({
    url: '/scm/salesReturn/' + returnId,
    method: 'get'
  })
}

// 新增销售退货
export function addSalesReturn(data) {
  return request({
    url: '/scm/salesReturn',
    method: 'post',
    data: data
  })
}

// 修改销售退货
export function updateSalesReturn(data) {
  return request({
    url: '/scm/salesReturn',
    method: 'put',
    data: data
  })
}

// 删除销售退货
export function delSalesReturn(returnIds) {
  return request({
    url: '/scm/salesReturn/' + returnIds,
    method: 'delete'
  })
}
