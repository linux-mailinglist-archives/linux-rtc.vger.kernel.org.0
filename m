Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBEB44A6F2
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Nov 2021 07:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243305AbhKIGlX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 9 Nov 2021 01:41:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243274AbhKIGlR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 9 Nov 2021 01:41:17 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B692FC061766;
        Mon,  8 Nov 2021 22:38:29 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id y7so2086342plp.0;
        Mon, 08 Nov 2021 22:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UB4V8gB82S0vFVTGGphWdCiuV+cw0bIsRKVDST5Y/j4=;
        b=I61sUhehW07dKl/629xyognhfqsIZ8AJ7ImbiFGh10ojE0UL+Lbi5PkPMocu1J5fA1
         +jIfh257cPeWKfYgrUKDrC+B5uezhRglKrVhDpsQ9KXDr/3opERCzQJP/XoB/39trSoR
         kULfyWbqDRaxakqsOHdMxgYMfo05PkvQGHMNz+jv2qfNhWvP9dS64Utxxz2jM8LB5qPE
         QuHo3MxNMz4YnC+9zSO/G5sMWNqLiiv1s0PpsdH8B/xTq2x+RyWNTlQ4239GHHVXbBi0
         An7nNLv9hf0eRtw5whFBeqF8DrXUKqDSB43yCSSPVPBgSAmFUke1Bk1GrExPo8S5CooB
         smVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UB4V8gB82S0vFVTGGphWdCiuV+cw0bIsRKVDST5Y/j4=;
        b=DN0ALEiCX3e5zpmXUm8n+h9P+AbHVFIl0GmgfDR4K4nRTumC0CQLISjFqHGH+OrXRM
         kOkc/X2YFfgvTOagYwls8wv0w53wF1hfzQQRhIV5EadezXDvivaym0uMbkHsaKZdMVck
         3me1gWpSbb/HbJAp78+RvYKdGTW5JNoXO8twI6yOXU62om/FrPZQaj83CUdt0eR3Obaa
         UgsJ5QObbM++zORiiPay7evzm/Dz7O/6vGZygX9yO/RqTvp70gK6fsmz6HcT5OItoJHW
         fQ9pZgcJYA/z1rT2Oa7+LJjnnKqjA9dKBGNcvsp1EOvVy6ZmgcKWiHpI9MosOgRQViR9
         8d8g==
X-Gm-Message-State: AOAM532RDHRgWzqdJvEge0V9AgkWKa37NjFkCQfXNhxsKLLjNq9QKd5h
        4DnvGq5fkU/Xorb9w/J4osU=
X-Google-Smtp-Source: ABdhPJz8pmaMAtEVKJ1iHXzvMGmN/x7C3ggz2JLPP7EFwutqxSSJkr81J0DAUnKLjF3H2q72vsyaUw==
X-Received: by 2002:a17:90b:4ad1:: with SMTP id mh17mr4647948pjb.33.1636439909308;
        Mon, 08 Nov 2021 22:38:29 -0800 (PST)
Received: from scdiu3.sunplus.com ([113.196.136.192])
        by smtp.googlemail.com with ESMTPSA id k22sm17466833pfi.149.2021.11.08.22.38.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Nov 2021 22:38:28 -0800 (PST)
From:   Vincent Shih <vincent.sunplus@gmail.com>
X-Google-Original-From: Vincent Shih <vincent.shih@sunplus.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, wells.lu@sunplus.com,
        in-reply-to=1635834123-24668-1-git-send-email-vincent.shih@sunplus.com
Cc:     Vincent Shih <vincent.shih@sunplus.com>
Subject: [PATCH v2 2/2] dt-bindings: rtc: Convert Sunplus RTC to json-schema
Date:   Tue,  9 Nov 2021 14:38:18 +0800
Message-Id: <1636439898-7358-3-git-send-email-vincent.shih@sunplus.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636439898-7358-1-git-send-email-vincent.shih@sunplus.com>
References: <1636439898-7358-1-git-send-email-vincent.shih@sunplus.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Convert Sunplus RTC to json-schema

Signed-off-by: Vincent Shih <vincent.shih@sunplus.com>
---
Changes in v2:
 - Removed the header file of dt-bindings/clock/sp-sp7021.h
 - Removed the header file of dt-bindings/reset/sp-sp7021.h
 - Modified some statements after removing the header files

 .../bindings/rtc/sunplus,sp7021-rtc.yaml           | 56 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/sunplus,sp7021-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/sunplus,sp7021-rtc.yaml b/Documentation/devicetree/bindings/rtc/sunplus,sp7021-rtc.yaml
new file mode 100644
index 0000000..e74e015
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/sunplus,sp7021-rtc.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) Sunplus Co., Ltd. 2021
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/sunplus,sp7021-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sunplus SP7021 Real Time Clock controller
+
+maintainers:
+  - Vincent Shih <vincent.shih@sunplus.com>
+
+properties:
+  compatible:
+    const: sunplus,sp7021-rtc
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: rtc_reg
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - resets
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc: serial@9c003A00 {
+        compatible = "sunplus,sp7021-rtc";
+        reg = <0x9c003A00 0x80>;
+        reg-names = "rtc_reg";
+        clocks = <&clkc 0x12>;
+        resets = <&rstc 0x02>;
+        interrupt-parent = <&intc>;
+        interrupts = <163 IRQ_TYPE_EDGE_RISING>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 6c1a535..c6774d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17949,6 +17949,7 @@ SUNPLUS RTC DRIVER
 M:	Vincent Shih <vincent.shih@sunplus.com>
 L:	linux-rtc@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/sunplus,sp7021-rtc.yaml
 F:	drivers/rtc/rtc-sunplus.c
 
 SUPERH
-- 
2.7.4

