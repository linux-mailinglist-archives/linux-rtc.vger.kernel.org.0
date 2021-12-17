Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9547479253
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Dec 2021 18:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236825AbhLQRDS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Dec 2021 12:03:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232554AbhLQRDS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Dec 2021 12:03:18 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F707C061574;
        Fri, 17 Dec 2021 09:03:17 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id p36-20020a05600c1da400b003457428ec78so3340879wms.3;
        Fri, 17 Dec 2021 09:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z0GjRgvW1wU1h6FV94mfKp+4ybIHuMrg8iLF3d/o84I=;
        b=hcGmfs0IuMNnlJudxXKB0NxcaQm4DKTwAiNdAGiDj8cRxCYWlFot/EXAezTz37uOdf
         dhCOpmI22VJ5z2PgxkAiL3uozqWJD4axI8w/+ge4BazNb80IHWnNASzVjVxUphqDW/vB
         tQi2dNPAIXJuNsQs/04+pxKsP9PV1We02O9MzmStnVg9FXoSTY3Zc+zsUsHEIoU26px8
         hbtsbpb2KELUblbU7I6iWdF6AOWPqilSVyZDuME5H/YDELmOgHdK481DuNhvPOehnuvy
         F1+WFoz3Av8II1A4POQ1pmzwdhlhPKJCYTD7AHulyilVRCZh6Wf8wcZJTGDOFQWYIeh6
         LW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z0GjRgvW1wU1h6FV94mfKp+4ybIHuMrg8iLF3d/o84I=;
        b=RSnjRcUmC0KQd2r+kvg2k5bNbAoycSxv5xsiDoMqqTrBtImVDSwjpgTFaWFAOTW8sB
         9GjQzkUkDOIJQ0tsUKsz1ebSttGR14TaJglh2CpfJZE6kUtRLtu31n1j4JaQ3Mlu0xd2
         mBF66WcMvyZhmtX3Wl/fYal7nrRUvDjvxTyktjrYqdfXixG2J2UwMA3kJ1eKkfLqVwkK
         MMcwcPHgk4dImH1Cg5vLgZpvzCbpk5USFZMP3IAW4NAmefTm/P/5MrqrhWXDFKzSg72j
         rVDJ9RQmmDe0dSndbxfD6lYwGEzDAvHF/qyweJgZmDns7bIhey08FKcRMXt8Lu/k43Kc
         BnhQ==
X-Gm-Message-State: AOAM530qtapuZrDhKtl883JnGlI5+YvB8CLMpObV544J/huesCtDNXTM
        prXeh20XfSS+6rgp86C0g5mM67fZTkn01Q==
X-Google-Smtp-Source: ABdhPJyHbPZ4G59w2GJ3EEqty/UMwTpKItjFkYiMEe5z8Pp94T+zvKX/Wi7LkC38xmZV+WWtyQwONw==
X-Received: by 2002:a05:600c:4f0f:: with SMTP id l15mr10339932wmq.25.1639760596284;
        Fri, 17 Dec 2021 09:03:16 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id s22sm11007732wmc.1.2021.12.17.09.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 09:03:15 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: rtc: Add EM Microelectronic EM3027 bindings
Date:   Fri, 17 Dec 2021 18:03:11 +0100
Message-Id: <20211217170311.2796798-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211217170311.2796798-1-thierry.reding@gmail.com>
References: <20211217170311.2796798-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Document the bindings for the EM Microelectronic EM3027 RTC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/rtc/emmicro,em3027.yaml          | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/emmicro,em3027.yaml

diff --git a/Documentation/devicetree/bindings/rtc/emmicro,em3027.yaml b/Documentation/devicetree/bindings/rtc/emmicro,em3027.yaml
new file mode 100644
index 000000000000..abed14c4fcd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/emmicro,em3027.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/emmicro,em3027.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EM Microelectronic EM3027 RTC Device Tree Bindings
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+properties:
+  compatible:
+    const: emmicro,em3027
+
+  reg:
+    maxItems: 1
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      rtc@56 {
+        compatible = "emmicro,em3027";
+        reg = <0x56>;
+      };
+    };
-- 
2.34.1

