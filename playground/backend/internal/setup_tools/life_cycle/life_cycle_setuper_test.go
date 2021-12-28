// Licensed to the Apache Software Foundation (ASF) under one or more
// contributor license agreements.  See the NOTICE file distributed with
// this work for additional information regarding copyright ownership.
// The ASF licenses this file to You under the Apache License, Version 2.0
// (the "License"); you may not use this file except in compliance with
// the License.  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package life_cycle

import (
	playground "beam.apache.org/playground/backend/internal/api/v1"
	"beam.apache.org/playground/backend/internal/fs_tool"
	"github.com/google/uuid"
	"io/fs"
	"os"
	"path/filepath"
	"reflect"
	"testing"
)

const (
	workingDir              = "workingDir"
	sourceFolder            = "src"
	executableFolder        = "bin"
	javaSourceFileExtension = ".java"
)

func TestSetup(t *testing.T) {
	errorPipelineId := uuid.New()
	successPipelineId := uuid.New()

	err := os.MkdirAll(workingDir, fs.ModePerm)
	if err != nil {
		panic(err)
	}
	_, err = os.Create(filepath.Join(workingDir, javaLogConfigFileName))
	if err != nil {
		panic(err)
	}
	defer os.RemoveAll(workingDir)

	lc, err := fs_tool.NewLifeCycle(playground.Sdk_SDK_JAVA, successPipelineId, workingDir)
	if err != nil {
		panic(err)
	}
	type args struct {
		sdk            playground.Sdk
		code           string
		pipelineId     uuid.UUID
		workingDir     string
		preparedModDir string
	}
	tests := []struct {
		name    string
		args    args
		check   func() bool
		want    *fs_tool.LifeCycle
		wantErr bool
	}{
		{
			// Test case with calling Setup method with incorrect SDK.
			// As a result, want to receive an error.
			name: "incorrect sdk",
			args: args{
				sdk:        playground.Sdk_SDK_UNSPECIFIED,
				code:       "",
				pipelineId: errorPipelineId,
				workingDir: workingDir,
			},
			check: func() bool {
				if _, err := os.Stat(filepath.Join(baseFileFolder, errorPipelineId.String())); os.IsNotExist(err) {
					return true
				}
				return false
			},
			want:    nil,
			wantErr: true,
		},
		{
			// Test case with calling Setup method with correct SDK.
			// As a result, want to receive an expected life cycle.
			name: "correct sdk",
			args: args{
				sdk:            playground.Sdk_SDK_JAVA,
				code:           "",
				pipelineId:     successPipelineId,
				workingDir:     workingDir,
				preparedModDir: "",
			},
			check: func() bool {
				if _, err := os.Stat(filepath.Join(workingDir, baseFileFolder, successPipelineId.String())); os.IsNotExist(err) {
					return false
				}
				if _, err := os.Stat(filepath.Join(workingDir, baseFileFolder, successPipelineId.String(), sourceFolder)); os.IsNotExist(err) {
					return false
				}
				if _, err := os.Stat(filepath.Join(workingDir, baseFileFolder, successPipelineId.String(), executableFolder)); os.IsNotExist(err) {
					return false
				}
				if _, err := os.Stat(filepath.Join(workingDir, baseFileFolder, successPipelineId.String(), sourceFolder, successPipelineId.String()+javaSourceFileExtension)); os.IsNotExist(err) {
					return false
				}
				return true
			},
			want:    lc,
			wantErr: false,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := Setup(tt.args.sdk, tt.args.code, tt.args.pipelineId, tt.args.workingDir, tt.args.preparedModDir)
			if (err != nil) != tt.wantErr {
				t.Errorf("Setup() error = %v, wantErr %v", err, tt.wantErr)
				return
			}
			if got != nil {
				if !reflect.DeepEqual(got.Dto.Folder, tt.want.Dto.Folder) {
					t.Errorf("Setup() got.Folder = %v, want %v", got.Dto.Folder, tt.want.Dto.Folder)
				}
				if !reflect.DeepEqual(got.Dto.Extension, tt.want.Dto.Extension) {
					t.Errorf("Setup() got.Extension = %v, want %v", got.Dto.Extension, tt.want.Dto.Extension)
				}
				if !tt.check() {
					t.Errorf("Setup() doesn't prepare necessary files/folders")
				}
			}
			os.RemoveAll("executable_files")
		})
	}
}
