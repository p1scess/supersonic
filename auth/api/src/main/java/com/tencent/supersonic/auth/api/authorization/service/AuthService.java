package com.tencent.supersonic.auth.api.authorization.service;

import com.tencent.supersonic.auth.api.authorization.pojo.AuthGroup;
import com.tencent.supersonic.auth.api.authorization.request.QueryAuthResReq;
import com.tencent.supersonic.auth.api.authorization.response.AuthorizedResourceResp;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

public interface AuthService {

    List<AuthGroup> queryAuthGroups(String domainId, Integer groupId);

    void updateAuthGroup(AuthGroup group);

    void removeAuthGroup(AuthGroup group);

    AuthorizedResourceResp queryAuthorizedResources(QueryAuthResReq req, HttpServletRequest request);
}
