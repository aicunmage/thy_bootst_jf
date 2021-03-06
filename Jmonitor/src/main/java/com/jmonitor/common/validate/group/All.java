package com.jmonitor.common.validate.group;

import javax.validation.GroupSequence;
import javax.validation.groups.Default;

/**
 * 校验所有规则，验证顺序：先校验默认分组，再校验指定了GroupOne的分组
 */
@GroupSequence({Default.class, Edit.class, Insert.class, Query.class})
public interface All {
}
