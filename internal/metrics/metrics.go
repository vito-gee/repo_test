package metrics

import (
	"github.com/vito-gee/repo_test/internal/proposal"
)

// RecordHandler 指标处理
func RecordHandler() func(msg *proposal.MetricsMessage) {
	return func(msg *proposal.MetricsMessage) {
		RecordMetrics(
			msg.Method,
			msg.Path,
			msg.IsSuccess,
			msg.HTTPCode,
			msg.BusinessCode,
			msg.CostSeconds,
		)
	}
}
