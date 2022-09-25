Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 565005E95CE
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Sep 2022 22:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiIYUJg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 25 Sep 2022 16:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbiIYUJe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 25 Sep 2022 16:09:34 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9739BC29
        for <linux-rtc@vger.kernel.org>; Sun, 25 Sep 2022 13:09:32 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 30so6533796edw.5
        for <linux-rtc@vger.kernel.org>; Sun, 25 Sep 2022 13:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=GGiiGjs+sAf3xrM6yefl6ZABluwqJlZ+ONHGLi4OUnM=;
        b=MbvLnCihc9Iccs2Jwm3oSbN3oQQ5vGQldqzfCCkQ9JXES1B2JZqSiXQUFDPoM/ltnv
         6xOVLP3ibJzaVq8SqgNi+45jnewncB1yTUlHenFbR+6T6s+orrPLU7+YQJYdwD7qkz4E
         SyXAksSJFGysmk7kQiBZKm6EqdzZtv6ZO+Gw7zlKBKDMw5bEcN0Lb6YDO+Nr0lojZn8V
         SAoSUqW8/jS0ISGaE6nL1tZ6mdg41TAmfGDWI2aYcCi6py+dLGMTWepCcL4sXzLAccfe
         d9yqTs0qDdxR2ixEITfB+QjHWuOkRtzkFxUhPA7v9lOheoca4k4DzAHmoYciupAsTPLc
         mqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GGiiGjs+sAf3xrM6yefl6ZABluwqJlZ+ONHGLi4OUnM=;
        b=OGHexavgjl1lfgGGysxUBrw4hC+thfLxCHYB7iYxCwnhpDjMGFN4bSykhAtehMl+CN
         baRIUtijgTPo7ws8V8vBBoBUgPL98MawDd8+U3ea85ac0u8WCMaKuzdVg1vweH+J6YoB
         H/2ZzxU/CxT4/8Peq/wapMXHQVw1/B9YghgAEy6CW51pC0/n9ywGyagLVImBiju7cPwo
         np3QKJwZ/B15tL1N16h5lI0jSzHMoxLl/LG3KIirqaNXhprSixYNGeI573IzkXBeRCX2
         B9M7VYTQb8HZX5ZT+2yVbWfTpqVjgdWQPgLc94KPKRpkUljyCMML6bubXWchXOtN1dDd
         4liw==
X-Gm-Message-State: ACrzQf06uYkrjZZARpkuWpbtWI4ag6yCsrbABxOxPFWeXfiOno9R2Fsg
        HpBF0fGHz+nRDJ6Z3hp1BHSasw==
X-Google-Smtp-Source: AMsMyM67qHmg0ltm4I5hzxln3iEN2rG/cmgbigDcuWmnaD6/O2jys3esOZxw2w3CCsHWqOfrf92LWg==
X-Received: by 2002:a05:6402:1910:b0:450:fb10:fddf with SMTP id e16-20020a056402191000b00450fb10fddfmr19022826edz.321.1664136571148;
        Sun, 25 Sep 2022 13:09:31 -0700 (PDT)
Received: from localhost.localdomain (host-95-248-4-29.retail.telecomitalia.it. [95.248.4.29])
        by smtp.gmail.com with ESMTPSA id bh6-20020a170906a0c600b0077085fdd613sm7161192ejb.44.2022.09.25.13.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 13:09:30 -0700 (PDT)
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: [PATCH 2/2] dt-bindings: rtc: add pcf2131
Date:   Sun, 25 Sep 2022 22:08:03 +0200
Message-Id: <20220925200803.210480-2-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925200803.210480-1-angelo.dureghello@timesys.com>
References: <20220925200803.210480-1-angelo.dureghello@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add NXP pcf2131 fdt bindings..

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 .../devicetree/bindings/rtc/nxp,pcf2131.yaml  | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf2131.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2131.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2131.yaml
new file mode 100644
index 000000000000..5e0e040a2631
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2131.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,pcf2131.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PCF2131 Real Time Clock
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    const: nxp,pcf2131
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  start-year: true
+
+  reset-source: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@53 {
+            compatible = "nxp,pcf2131";
+            reg = <0x53>;
+            pinctrl-0 = <&rtc_nint_pins>;
+        };
+    };
+
+...
-- 
2.37.3

