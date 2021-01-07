Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272A72ECE1B
	for <lists+linux-rtc@lfdr.de>; Thu,  7 Jan 2021 11:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbhAGKrf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 Jan 2021 05:47:35 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:11639 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbhAGKrf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 Jan 2021 05:47:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1610016455; x=1641552455;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=yHSXn6PNaIM5VUt6eMTv9SHPBhxQB6kktLgSWl4aL3g=;
  b=HeN2JZ7n5VIffX3yOY3npFLjkxV/o9IYMk7fp5bnL60wlyrzJzufiV4d
   rhS5TJJEgEB1c9BfQ8ImZ7wUnbU8QWt9kUFdzKmbiBasFADfTQIHcv0Zw
   TsJu+9QuJvVlTeXyIpFLyNRkS4V4qEtANmIaSt4OQZ5yzd08jCU9p4sFC
   vSZKN+umCjlQ07HCK+VNOuw8awkFZiXgNOtbtFWqrE4Q2XJyM8EZbLY1W
   WBHKWK0OdNTMnSY602YAHHodoep2DhqbTvZtLLwPjcpinqPdWAOkZ7bS3
   coSmrZeuNYbHWuvyYAFk4sf+VrZMQrvX8vuibRd/Wx7QkHCil5li8VvT+
   w==;
IronPort-SDR: Lafo0b6nQZ9shAR+tKcmHkRIMxFsKrM/bE0rLbdP03aiYdSI1Nk74HUIhar3XWYuHLKPUFrQ/n
 j07pw1WeQ/5ksxfOjfW0FgAv/VrwTkyLokpKqx+t4vLtar4XU6oI9GsLnxZTQa8Gq0EVlt/O6m
 YGVKxnVcj0KyaBmDu/CnN/XQ8qvlFnS0s0DriO/G7yaRh5vCGff075xQu+918CY4TNY/kA6gB7
 /d2JYFyJn/aATrUPjTd3VM5QUCNhILkUeWC2rO3PTNsjiLduzlqElt7+/bTC8CjTBt++I32HdV
 wIw=
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; 
   d="scan'208";a="110118444"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jan 2021 03:46:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 7 Jan 2021 03:46:19 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 7 Jan 2021 03:46:14 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <nicolas.ferre@microchip.com>, <ludovic.desroches@microchip.com>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH] dt-bindings: rtc: at91rm9200: add sama7g5 compatible
Date:   Thu, 7 Jan 2021 12:46:12 +0200
Message-ID: <1610016372-31784-1-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add compatible for SAMA7G5 RTC. At the moment the driver is falling
back on SAM9X60's compatible but SAMA7G5 doesn't have the tamper mode
register and tamper debounce period register thus the need for a new
compatible to differentiate b/w these two in case tamper feature will
be implemented in future.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
index 02bbfe726c62..994de43d17fa 100644
--- a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
@@ -20,6 +20,7 @@ properties:
       - atmel,sama5d4-rtc
       - atmel,sama5d2-rtc
       - microchip,sam9x60-rtc
+      - microchip,sama7g5-rtc
 
   reg:
     maxItems: 1
-- 
2.7.4

