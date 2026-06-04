
import request from '@/utils/request'

// 查询来料检验列表
export function listIncomingInspection(query) {
  return request({
    url: '/mes/incomingInspection/list',
    method: 'get',
    params: query
  })
}

// 查询来料检验详细
export function getIncomingInspection(inspectionId) {
  return request({
    url: '/mes/incomingInspection/' + inspectionId,
    method: 'get'
  })
}

// 新增来料检验
export function addIncomingInspection(data) {
  return request({
    url: '/mes/incomingInspection',
    method: 'post',
    data: data
  })
}

// 修改来料检验
export function updateIncomingInspection(data) {
  return request({
    url: '/mes/incomingInspection',
    method: 'put',
    data: data
  })
}

// 删除来料检验
export function delIncomingInspection(inspectionId) {
  return request({
    url: '/mes/incomingInspection/' + inspectionId,
    method: 'delete'
  })
}
