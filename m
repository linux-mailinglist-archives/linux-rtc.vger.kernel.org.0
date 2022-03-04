Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE4864CD66D
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Mar 2022 15:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239894AbiCDOaS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Mar 2022 09:30:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239842AbiCDOaP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Mar 2022 09:30:15 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12BCF1BB71D;
        Fri,  4 Mar 2022 06:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646404168; x=1677940168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ItwHa2LGg6vVjt4JwnVSxcBCS+3q6NmheNIr1H3INP4=;
  b=hV2BKkhr9GrRbQVc/uqhv0QZmLEEzMSZ3R2nwbCqbUwCXdsbikcgQAGY
   /uxvzGl7qnrD7g22UhJYSv52ZdQGV3FKAKJsRxHQcgEKs/o20eFvPU8vF
   WoFpbbB0/rk07JNHToIXdBxqr9JkUJ1xVkXDnqzS9XLyZNX1HS3FKn8uK
   5LiuINcbONXzZtw5cc4tEKaVbcV/2u1WkXuXmCADSyXEeXTcDA7j+7cVr
   I9ajLb7rrnlS2pBLPyLT3hahBQpANijaWXPNCQj22OIOJpD3IA4jjnqcn
   WJYI3aqHVgiu5GcbNgRZjsqCNhCfCf998upgVHssX9pxpf7jXbCfbuYzy
   g==;
X-IronPort-AV: E=Sophos;i="5.90,155,1643698800"; 
   d="scan'208";a="155275847"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Mar 2022 07:29:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 4 Mar 2022 07:29:24 -0700
Received: from ROB-ULT-M68701.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 4 Mar 2022 07:29:22 -0700
From:   Sergiu Moga <sergiu.moga@microchip.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski@canonical.com>,
        <nicolas.ferre@microchip.com>, <claudiu.beznea@microchip.com>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Sergiu Moga <sergiu.moga@microchip.com>
Subject: [PATCH v3 5/5] dt-bindings: rtc: at91: Add SAMA7G5 compatible strings list
Date:   Fri, 4 Mar 2022 16:27:46 +0200
Message-ID: <20220304142746.121947-6-sergiu.moga@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304142746.121947-1-sergiu.moga@microchip.com>
References: <20220304142746.121947-1-sergiu.moga@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add compatible strings list for SAMA7G5.

Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.yaml
index d2452067bfe4..e5c3c384e172 100644
--- a/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.yaml
@@ -21,6 +21,10 @@ properties:
       - items:
           - const: microchip,sam9x60-rtt
           - const: atmel,at91sam9260-rtt
+      - items:
+          - const: microchip,sama7g5-rtt
+          - const: microchip,sam9x60-rtt
+          - const: atmel,at91sam9260-rtt
 
   reg:
     maxItems: 1
-- 
2.25.1

