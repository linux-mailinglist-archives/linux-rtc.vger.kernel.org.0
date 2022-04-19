Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B221A5061CD
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Apr 2022 03:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343885AbiDSBrr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Apr 2022 21:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343920AbiDSBrp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Apr 2022 21:47:45 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B269C25EBF;
        Mon, 18 Apr 2022 18:45:04 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id bj24so11197859oib.11;
        Mon, 18 Apr 2022 18:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aVfbsDHne7UFw/nRsbDYc8gWIryl7Fw3CuyGuISh8ks=;
        b=Hr6lKTxgM9pLnZ/7lKyu0p68nuSxZfZ6F2a+s/BQqIlwvcdw/wfJzEFhg53c9zkWOW
         wz4ns6YUPMW4e1cRO0rslzDemoO/+sBiA+CHRsb5jK+Q4l+Eg6e/4dUMd5A7MnnzWolg
         B5XfBF0RiIiS5vytihpS9t9ED/1fYrwyC9ieQsGY7VLPbjxmyh2WOEy7ZfJG4hHwwGij
         qDSja60eyZ1SbRv3H6isSva6YyFdygryvCJAaEgUPPl7BALFX8BTU9MgUm736rH/369o
         D0aGA6WoAOtAlTVl6NN/0G0mGRWL38Z8rloo1rPo1cO8eRMkQu7RD3kwt5CA4Uth2acB
         nl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aVfbsDHne7UFw/nRsbDYc8gWIryl7Fw3CuyGuISh8ks=;
        b=AOR/z+nsj9yPwjI9vCvCzdJ+yTOf5f18404lalxs8UfWUvrZ/zFBqOBWgwKMekToX8
         PjQ8Jifk/hz4QMydKLLfs5DCGjLkYVqcDdZL3myM6FQxm36eDN+oRftcxDAvxk+huyzo
         M2XYgoZz6alzSStUNm33mcrmA37GM6ph2dx62oQkD+QyIERnsNvim9MZELcjy5gYavKw
         6vJ7RIHlgP6MRDUUOoLJ6MWT+rk6oYW26yvzY4Ah7JsNxQmbKwePFEgL7qpHRjg1CKPg
         uVYaR8AHZ4U40KcgFK3D++K7eEphe2K+4dDdy7JRtqHbMM3bp6h74wyngaf5gz2SSGHw
         ZQcw==
X-Gm-Message-State: AOAM533ULSz6iUiEmeuCXxTQ6+1miG6SfnTfgcp2fO3I3nin9ZqK09IQ
        r16wbYBNZyPvoPOfqlztV7g+UjeBoeE=
X-Google-Smtp-Source: ABdhPJyZ7KGrJMe/f3XsRio+1629DoZb5G/xYMr+KmYIkEPpB4RoRbIWdrfbgdRoxSsZ22wkP9ov3A==
X-Received: by 2002:a05:6808:16a9:b0:2f7:1eae:a75f with SMTP id bb41-20020a05680816a900b002f71eaea75fmr6288305oib.181.1650332703954;
        Mon, 18 Apr 2022 18:45:03 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:5307:398a:5694:27c])
        by smtp.gmail.com with ESMTPSA id os2-20020a0568707d0200b000e42ef7cff2sm4556083oab.43.2022.04.18.18.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 18:45:03 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     robh+dt@kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] dt-binding: pcf85063: Add an entry for pca85073a
Date:   Mon, 18 Apr 2022 22:44:44 -0300
Message-Id: <20220419014445.341444-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

The PCA85073A RTC has the same programming model as the PCF85063A.

Add a compatible entry for it.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt
index 6439682c9319..217b7cd06c11 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt
@@ -2,6 +2,7 @@
 
 Required properties:
 - compatible: Should one of contain:
+	"nxp,pca85073a",
 	"nxp,pcf85063",
 	"nxp,pcf85063a",
 	"nxp,pcf85063tp",
-- 
2.25.1

