
import request from '@/utils/request'

// 查询生产采样列表
export function listProductionSampling(query) {
  return request({
    url: '/mes/productionSampling/list',
    method: 'get',
    params: query
  })
}

// 查询生产采样详细
export function getProductionSampling(samplingId) {
  return request({
    url: '/mes/productionSampling/' + samplingId,
    method: 'get'
  })
}

// 新增生产采样
export function addProductionSampling(data) {
  return request({
    url: '/mes/productionSampling',
    method: 'post',
    data: data
  })
}

// 修改生产采样
export function updateProductionSampling(data) {
  return request({
    url: '/mes/productionSampling',
    method: 'put',
    data: data
  })
}

// 删除生产采样
export function delProductionSampling(samplingId) {
  return request({
    url: '/mes/productionSampling/' + samplingId,
    method: 'delete'
  })
}

// 导出生产采样
export function exportProductionSampling(query) {
  return request({
    url: '/mes/productionSampling/export',
    method: 'post',
    params: query
  })
}
