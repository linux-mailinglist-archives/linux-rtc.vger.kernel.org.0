Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53F553DCC9C
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Aug 2021 18:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbhHAQJu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 1 Aug 2021 12:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbhHAQJt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 1 Aug 2021 12:09:49 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5673AC06175F;
        Sun,  1 Aug 2021 09:09:41 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id n28-20020a05600c3b9cb02902552e60df56so9504558wms.0;
        Sun, 01 Aug 2021 09:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bqypCuA/5g372Rx9Rz05biiSxWQ4PkE/P3VoSjAxRvc=;
        b=Gy9JQj0S8bg+qmfQ/z8v2Y5prbjs1vmzda6meVzzFdaNvzrvQkmkDsbqkiwDRKwHNB
         pddECND3rP0dqkJ+igNP7rBGG0VHV9oPOtNZ9j/12rj6yA0m4PHDZgFzCDZs/2gnk/fk
         D+uez6OKnZsQkS7dg1G/JRTbxvw4wfA8vb1p1iOuc9sEj48I1XvWa70qywJ2z0SGeTxn
         IItxq9Fyj53hizDmXNwsw1cyXcnsegTBs6lCb/vS+CfKfgdmnA3CfVv0/e2ADZoNUYy+
         iKXujZueB1SYADh7ww4vUGpY09BZRcpOHjkDfc7869GGf0Fj/CCANLiZyQO6ouJJVrAs
         20XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bqypCuA/5g372Rx9Rz05biiSxWQ4PkE/P3VoSjAxRvc=;
        b=AzDz5cr5VGj+Igem08H0PMx2CQ+GdjdIX5xXKv/0igGm7/qQjo4uo3h67+5ekNZUqT
         2lTWBSMDoKR5Iuygsdc7yTbVOWUtUhq5a64VsRvwIZNmyp2tzaTFHwSajZEUgjq+JoyV
         x8J/EqhUgN1innUOSWz7ta2+gUwjQMp6OPliIqlxZzj+7t6WON8ba5JyvxODhw9uPC/3
         rsvi7/g7W7my7nj1qKknZNN/2P+eHYpl9XnU9J5t8INitUoUnbnZUfJL7wcu+Sq5aIzn
         TK7bqqXWqRP+1MuKOdezgCX0ZatJDporzc0R0SmWHDjhr+XjKKPk8SbQAwaU+g2ybfUB
         sOtQ==
X-Gm-Message-State: AOAM533TE7bkM0lAEAh5lm07bJJlzAkZ66Yh68yjmti3wfQpsMmv2wHy
        419x4ZSLjJM6iVbu5L6tcxc=
X-Google-Smtp-Source: ABdhPJyoVBtIiHnph6y0UGHgQn6ZbHEJ/GKNqzttSyAUew+Fs0YjGm7Q0Nd6EbnGTB5SSQVUzgPo6Q==
X-Received: by 2002:a1c:1dcf:: with SMTP id d198mr12789173wmd.103.1627834179951;
        Sun, 01 Aug 2021 09:09:39 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id j1sm7466090wmo.4.2021.08.01.09.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 09:09:39 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: rtc: Add Mstar MSC313e RTC devicetree bindings documentation
Date:   Sun,  1 Aug 2021 18:09:19 +0200
Message-Id: <20210801160921.233081-2-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210801160921.233081-1-romain.perier@gmail.com>
References: <20210801160921.233081-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This adds the documentation for the devicetree bindings of the Mstar
MSC313e RTC driver, found from MSC313e SoCs and newer.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 .../bindings/rtc/mstar,msc313-rtc.yaml        | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml b/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
new file mode 100644
index 000000000000..62bc12b1feb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/mstar,msc313-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mstar MSC313e RTC Device Tree Bindings
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+maintainers:
+  - Daniel Palmer <daniel@0x0f.com>
+  - Romain Perier <romain.perier@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - mstar,msc313-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  start-year: true
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    rtc@2400 {
+        compatible = "mstar,msc313-rtc";
+        reg = <0x2400 0x40>;
+        clocks = <&xtal_div2>;
+        interrupts-extended = <&intc_irq GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
-- 
2.30.2

