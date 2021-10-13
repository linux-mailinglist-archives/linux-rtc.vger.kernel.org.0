Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7657342B98B
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Oct 2021 09:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238664AbhJMHwH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Oct 2021 03:52:07 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:49350 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238614AbhJMHwG (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 13 Oct 2021 03:52:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1634111404; x=1665647404;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=agPO9eYzPna92uLuzqA91jgKv9G3o5aacnBM8C4HeLw=;
  b=S99tImOswf9zPdLnuBPs51n86OCYVcKgfpV5n/sgMfH+v8jnryyhYuUG
   9jaW6GFUbWL6ErJbrKhsL7v3skN95xe1zNy6iZ9ys/FXCbnF5pqxJguo1
   AuALZja+cCfvYiNMtZnzRmpWMT/8hUeM/QRJeDwbZh4930s4tXyVyc2L7
   YciGZeLOCLn91p6Vg90//hSS6OYcDLqs0tIwigLGI79aweeqfRB0Litny
   Mq7H9n1CdYKu5F10mXO6wuB+F/4Q5o53vfQ/W4W+7GLBsNJRMgnACsJu7
   PW4H9qQ5Hlz0z6Cvo80uNT5/LJStdw4QXI9QNxP9KjDHEea8Clp1o0bAX
   A==;
X-IronPort-AV: E=Sophos;i="5.85,369,1624312800"; 
   d="scan'208";a="20014463"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 13 Oct 2021 09:50:02 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 13 Oct 2021 09:50:02 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 13 Oct 2021 09:50:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1634111402; x=1665647402;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=agPO9eYzPna92uLuzqA91jgKv9G3o5aacnBM8C4HeLw=;
  b=FZP6szKPaht4Q8vn4N+tkXBMCgHKfYGT+H9/RlCDrpHZ7nU4+w44jXhh
   8ygLx4pd1B27HWAEVLSeYq7wYbL0n+6Uwh+mam+vF5PRum+Jr033lkAGs
   q2l2ZCFBC7Jdfu+Ootz7kKLZtRR2FxgvMdYVhYEAC8qd7mFGxoQJe+fQN
   KQxjrhqBTYtDaSSw/k0IbIUpJZ55I1DwFSI+mK8AgYo9OiLkI4XphtHZ9
   YbDLyfqX8p0N7brhAbKtky1K/JnjrDX35rvg/2hm019auX3H0ZdDIeHDT
   mQ+NfwSlo/taRwGILYfRu/FtVjk0z8DUhmiL70XI0DyW2itFqnxdxznV9
   g==;
X-IronPort-AV: E=Sophos;i="5.85,369,1624312800"; 
   d="scan'208";a="20014462"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Oct 2021 09:50:02 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D1B5F280065;
        Wed, 13 Oct 2021 09:50:01 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/1] rtc: pcf85063: add support for fixed clock
Date:   Wed, 13 Oct 2021 09:49:54 +0200
Message-Id: <20211013074954.997445-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

TQ-Systems' TQMa8Mx module (SoM) uses a pcf85063 as RTC. The default output
is 32768Hz. This is to provide the i.MX8M CKIL clock. Once the RTC driver
is probed, the clock is disabled and all i.MX8M functionality depending on
the 32 KHz clock will halt. In our case the whole system halts and a power
cycle is required.

Referencing the pcf85063 directly results in a deadlock. The kernel
will see, that i.MX8M system clock needs the RTC clock and do probe
deferral. But the i.MX8M I2C module never becomes usable without the
i.MX8M CKIL clock and thus the RTC's clock will not be probed. So
from the kernel's perspective this is a chicken-and-egg problem.

Technically everything is fine by not touching anything, since
the RTC clock correctly enables the clock on reset (i.e. on
battery backup power loss).

A workaround for this issue is describing the square wave pin
as fixed-clock, which is registered early and basically how
this pin is used on the i.MX8M.

This addresses the exact same issue as in commit f765e349c3e1 ("rtc:
m41t80: add support for fixed clock").

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
As mentioned in the commit message this addesses the same problem as on
Congatec's board, although we use a different RTC.
I also shamelessly reused most of the commit message.

 .../devicetree/bindings/rtc/nxp,pcf85063.txt         |  9 +++++++++
 drivers/rtc/rtc-pcf85063.c                           | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt
index 627bb533eff7..6439682c9319 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt
@@ -13,10 +13,19 @@ Optional property:
   expressed in femto Farad (fF). Valid values are 7000 and 12500.
   Default value (if no value is specified) is 7000fF.
 
+Optional child node:
+- clock: Provide this if the square wave pin is used as boot-enabled fixed clock.
+
 Example:
 
 pcf85063: rtc@51 {
 	compatible = "nxp,pcf85063";
 	reg = <0x51>;
 	quartz-load-femtofarads = <12500>;
+
+		clock {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
 };
diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 14da4ab30104..137ad56f2d71 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -479,6 +479,18 @@ static struct clk *pcf85063_clkout_register_clk(struct pcf85063 *pcf85063)
 	struct clk *clk;
 	struct clk_init_data init;
 	struct device_node *node = pcf85063->rtc->dev.parent->of_node;
+	struct device_node *fixed_clock;
+
+	fixed_clock = of_get_child_by_name(node, "clock");
+	if (fixed_clock) {
+		/*
+		 * skip registering square wave clock when a fixed
+		 * clock has been registered. The fixed clock is
+		 * registered automatically when being referenced.
+		 */
+		of_node_put(fixed_clock);
+		return 0;
+	}
 
 	init.name = "pcf85063-clkout";
 	init.ops = &pcf85063_clkout_ops;
-- 
2.25.1

