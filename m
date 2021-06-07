Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1D439E792
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Jun 2021 21:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbhFGTj2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Jun 2021 15:39:28 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:34485 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbhFGTj2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Jun 2021 15:39:28 -0400
Received: by mail-ot1-f52.google.com with SMTP id v27-20020a056830091bb02903cd67d40070so14838693ott.1;
        Mon, 07 Jun 2021 12:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FRSxC13zHpan7fvtvaA5He0Vxjqfa70sKFxtkfFWbcw=;
        b=CugNqgTndal7WiqFkFQmQdP47y3XctJr/aJU4dRoTy4YA50/sOfLLgCNNCa5cJZKVN
         +AISFpxED7IgNORY8FnoEkVCB6RuP0TzepqzvIiEdhEW+4lZ+l/CNhb3/8XUnL4e1pZZ
         aAtCTkjIgrY2mlDtzt5THACTGSQpHLd9oZghRqOKBH4Mp9lgPJz3f2cm48j6tS7SS2gR
         l/UlE/pwxgFqYlV76TJahViwga1M4PPgmi8Le2EYF1P41xNgH1UDbV6vVfj7+irgQdXR
         AmqP3rN5JRUPMhDHkdtaC7CZZGSgXT0ojJJpxt2KMXfCTbcpZGFRT6tUufjWVkAejmVh
         YMvg==
X-Gm-Message-State: AOAM531x1NxurHhulDElx2vcFPr2wE7jFw9QkUPedqnw4ar/Tr7HC8Hb
        ShRfRlopYXgCdlJAR7ysXVTROOpzbQ==
X-Google-Smtp-Source: ABdhPJzIBylnHYbjgquLEQkHLHDwH51VYqwQHfURLr0VwtjpKZ+Ex+dM9B6he9kGK3Jtiic6YnNzZg==
X-Received: by 2002:a9d:541:: with SMTP id 59mr10202960otw.301.1623094639797;
        Mon, 07 Jun 2021 12:37:19 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id 94sm2544375otj.33.2021.06.07.12.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 12:37:19 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Subject: [PATCH] dt-bindings: rtc: Add Arm PL031 schema
Date:   Mon,  7 Jun 2021 14:37:18 -0500
Message-Id: <20210607193718.3090202-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The PL031 RTC binding has been in use for a long time, but never got
documented. Fortunately, it's simple and existing users are consistent.

Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/rtc/arm,pl031.yaml    | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/arm,pl031.yaml

diff --git a/Documentation/devicetree/bindings/rtc/arm,pl031.yaml b/Documentation/devicetree/bindings/rtc/arm,pl031.yaml
new file mode 100644
index 000000000000..77452c9e9b63
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/arm,pl031.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/arm,pl031.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Primecell PL031 Real Time Clock
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: arm,pl031
+  required:
+    - compatible
+
+allOf:
+  - $ref: rtc.yaml#
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  compatible:
+    items:
+      - const: arm,pl031
+      - const: arm,primecell
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc@10017000 {
+        compatible = "arm,pl031", "arm,primecell";
+        reg = <0x10017000 0x1000>;
+        clocks = <&pclk>;
+        clock-names = "apb_pclk";
+    };
-- 
2.27.0

