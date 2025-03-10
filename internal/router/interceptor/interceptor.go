package interceptor

import (
	"github.com/vito-gee/repo_test/internal/pkg/core"
	"github.com/vito-gee/repo_test/internal/proposal"
	"github.com/vito-gee/repo_test/internal/repository/mysql"

	"go.uber.org/zap"
)

var _ Interceptor = (*interceptor)(nil)

type Interceptor interface {
	// Authenticate 示例验证用户身份
	Authenticate() core.HandlerFunc

	// JWTokenAuthVerify JWT token 授权验证
	JWTokenAuthVerify(ctx core.Context) (sessionUserInfo proposal.SessionUserInfo, err core.BusinessError)

	// i 为了避免被其他包实现
	i()
}

type interceptor struct {
	logger *zap.Logger
	db     mysql.Repo
}

func New(logger *zap.Logger, db mysql.Repo) Interceptor {
	return &interceptor{
		logger: logger,
		db:     db,
	}
}

func (i *interceptor) i() {}
