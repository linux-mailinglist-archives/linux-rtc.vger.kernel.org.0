Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD0D61A4875
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Apr 2020 18:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbgDJQ1w (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 10 Apr 2020 12:27:52 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:8228 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgDJQ1v (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 10 Apr 2020 12:27:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1586536071; x=1618072071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Eo6p7pz7SWCokkfrt5eRPXSs0G7FQfJNhTJCV7p33Xs=;
  b=vWMNP9Ddq56yCpl3iP08c6qMbrwpY+FR/l/sOcMzJS62+xQyyzv3GQxf
   cGQmAF7tYLvjEm4H6tG/tJea8B2laadKcsGMlRx/hSapdlKzESCA1qGMA
   CUBH7RND0P0uG6oXxtFGkb5RzV1AaTdI79QtBIvc4Up4z5eHThJ56NN5y
   h3asfbpsKV5GShefpaDnF55YuQXemkrrEsnOZ6q/VWpUZYwudL9ztcEiI
   0IpEWZORYmuH/t8iN5ylmMkiFQ++LkKgH+zxvgHTk6lnMeJ86ulJFaNkj
   9ElOQtzhJGQXGwmzwVb0anxbA5tPLRauegm40UqyyYFTbqelN/5WaIcZd
   Q==;
IronPort-SDR: 6AjG0RliC4W9S/dyMTnwaFK7Z5jnQrNDSajrnRVi9WQ8FDMQwgDLEfEQyQfYdt/XDsiKYVDPX2
 PCJ+pboexCDMyPhDPUk+mzAWX/KPZgyYzRBRRJwRiQM0dziGw9l8Y5BRXWUfkMTqf9FIXsGHNJ
 A+VmcUd5+RTxtIK21lubyhRLqL4HkweQmOtAv+pA4ojIWulof504n7U9yuerGxH+Z6+xJfiXzA
 P42OQnNy2pPHlp4j/yO3rqGBZBMHt7gLBUAOmgeBSu1nrD5optfq6bsrhxk5plyq3d84ibci03
 89E=
X-IronPort-AV: E=Sophos;i="5.72,367,1580799600"; 
   d="scan'208";a="75498407"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Apr 2020 09:27:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 10 Apr 2020 09:27:51 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Fri, 10 Apr 2020 09:27:42 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <nicolas.ferre@microchip.com>, <ludovic.desroches@microchip.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>, <maz@kernel.org>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 5/5] rtc: at91sam9: add microchip,sam9x60-rtt
Date:   Fri, 10 Apr 2020 19:26:59 +0300
Message-ID: <1586536019-12348-6-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
References: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add microchip,sam9x60-rtt to compatible list.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt b/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
index 6ae79d1843f3..b2f913ff6c69 100644
--- a/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
@@ -1,7 +1,7 @@
 Atmel AT91SAM9260 Real Time Timer
 
 Required properties:
-- compatible: should be: "atmel,at91sam9260-rtt"
+- compatible: should be: "atmel,at91sam9260-rtt" or "microchip,sam9x60-rtt"
 - reg: should encode the memory region of the RTT controller
 - interrupts: rtt alarm/event interrupt
 - clocks: should contain the 32 KHz slow clk that will drive the RTT block.
-- 
2.7.4

