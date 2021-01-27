Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78DFC3062B3
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Jan 2021 18:53:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344210AbhA0RxY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 Jan 2021 12:53:24 -0500
Received: from foss.arm.com ([217.140.110.172]:56916 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343741AbhA0R1j (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 27 Jan 2021 12:27:39 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 348DA1477;
        Wed, 27 Jan 2021 09:26:17 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D11713F66E;
        Wed, 27 Jan 2021 09:26:14 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Samuel Holland <samuel@sholland.org>,
        Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v5 12/20] dt-bindings: rtc: sun6i: Add H616 compatible string
Date:   Wed, 27 Jan 2021 17:24:52 +0000
Message-Id: <20210127172500.13356-13-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210127172500.13356-1-andre.przywara@arm.com>
References: <20210127172500.13356-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add the obvious compatible name to the existing RTC binding, and pair
it with the existing H6 fallback compatible string, as the devices are
compatible.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index b1b0ee769b71..4193e5813344 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -26,6 +26,9 @@ properties:
           - const: allwinner,sun50i-a64-rtc
           - const: allwinner,sun8i-h3-rtc
       - const: allwinner,sun50i-h6-rtc
+      - items:
+          - const: allwinner,sun50i-h616-rtc
+          - const: allwinner,sun50i-h6-rtc
 
   reg:
     maxItems: 1
-- 
2.17.5

