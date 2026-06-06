
import request from '@/utils/request'

// 查询盘点信息列表
export function listInventoryCount(query) {
  return request({
    url: '/wms/inventoryCount/list',
    method: 'get',
    params: query
  })
}

// 查询盘点信息详细
export function getInventoryCount(countId) {
  return request({
    url: '/wms/inventoryCount/' + countId,
    method: 'get'
  })
}

// 新增盘点信息
export function addInventoryCount(data) {
  return request({
    url: '/wms/inventoryCount',
    method: 'post',
    data: data
  })
}

// 修改盘点信息
export function updateInventoryCount(data) {
  return request({
    url: '/wms/inventoryCount',
    method: 'put',
    data: data
  })
}

// 删除盘点信息
export function delInventoryCount(countIds) {
  return request({
    url: '/wms/inventoryCount/' + countIds,
    method: 'delete'
  })
}
