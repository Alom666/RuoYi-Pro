
import request from '@/utils/request'

// 查询质检标准列表
export function listQualityStandard(query) {
  return request({
    url: '/mes/qualityStandard/list',
    method: 'get',
    params: query
  })
}

// 查询质检标准详细
export function getQualityStandard(standardId) {
  return request({
    url: '/mes/qualityStandard/' + standardId,
    method: 'get'
  })
}

// 新增质检标准
export function addQualityStandard(data) {
  return request({
    url: '/mes/qualityStandard',
    method: 'post',
    data: data
  })
}

// 修改质检标准
export function updateQualityStandard(data) {
  return request({
    url: '/mes/qualityStandard',
    method: 'put',
    data: data
  })
}

// 删除质检标准
export function delQualityStandard(standardId) {
  return request({
    url: '/mes/qualityStandard/' + standardId,
    method: 'delete'
  })
}

// 导出质检标准
export function exportQualityStandard(query) {
  return request({
    url: '/mes/qualityStandard/export',
    method: 'post',
    params: query
  })
}
