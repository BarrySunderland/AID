// Copyright 2019 The CVPM Authors. All rights reserved.
// Use of this source code is governed by a MIT
// license that can be found in the LICENSE file.

/*  This file handles third party contributions and libraries.*/
package main

import (
	"net/http"

	dataset "github.com/cvpm-contrib/dataset"
	"github.com/gin-gonic/gin"
)

// GET /datasets
func GetAllDatasets(c *gin.Context) {
	c.JSON(http.StatusOK, dataset.FetchAllDatasets())
}

type AddRegistryRequest struct {
	URL string `json:"url"`
}

// POST /datasets/registry
func AddNewRegistry(c *gin.Context) {
	var addRegistryRequest AddRegistryRequest
	c.BindJSON(&addRegistryRequest)
	dataset.AddNewRegistry(addRegistryRequest.URL)
	c.JSON(http.StatusOK, gin.H{
		"code":   "200",
		"status": "Finished",
	})
}
