Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77799321DCE
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Feb 2021 18:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbhBVRNw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Feb 2021 12:13:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbhBVRNq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 Feb 2021 12:13:46 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E59C06174A;
        Mon, 22 Feb 2021 09:13:06 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id BC0EB1F451E2
Received: by jupiter.universe (Postfix, from userid 1000)
        id 4E8464800D9; Mon, 22 Feb 2021 18:12:51 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-mtd@lists.infradead.org,
        kernel@collabora.com
Subject: [PATCHv1 1/6] rtc: m41t80: add support for protected clock
Date:   Mon, 22 Feb 2021 18:12:42 +0100
Message-Id: <20210222171247.97609-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210222171247.97609-1-sebastian.reichel@collabora.com>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
modules SQW clock output defaults to 32768 Hz. This behaviour is
used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
the clock is disabled and all i.MX6 functionality depending on
the 32 KHz clock has undefined behaviour. On systems using hardware
watchdog it seems to likely trigger a lot earlier than configured.

The proper solution would be to describe this dependency in DT,
but that will result in a deadlock. The kernel will see, that
i.MX6 system clock needs the RTC clock and do probe deferral.
But the i.MX6 I2C module never becomes usable without the i.MX6
CKIL clock and thus the RTC's clock will not be probed. So from
the kernel's perspective this is a chicken-and-egg problem.

Technically everything is fine by not touching anything, since
the RTC clock correctly enables the clock on reset (i.e. on
battery backup power loss) and also the bootloader enables it
in case a kernel without this support has been booted.

The 'protected-clocks' property is already in use for some clocks
that may not be touched because of firmware limitations and is
described in Documentation/devicetree/bindings/clock/clock-bindings.txt.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 Documentation/devicetree/bindings/rtc/rtc-m41t80.txt | 1 +
 drivers/rtc/rtc-m41t80.c                             | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
index c746cb221210..ea4bbf5c4282 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
@@ -19,6 +19,7 @@ Optional properties:
 - interrupts: rtc alarm interrupt.
 - clock-output-names: From common clock binding to override the default output
                       clock name
+- protected-clocks: Bool, if set operating system should not handle clock.
 - wakeup-source: Enables wake up of host system on alarm
 
 Example:
diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 160dcf68e64e..3296583853a8 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -546,6 +546,9 @@ static struct clk *m41t80_sqw_register_clk(struct m41t80_data *m41t80)
 	struct clk_init_data init;
 	int ret;
 
+	if (of_property_read_bool(node, "protected-clocks"))
+		return 0;
+
 	/* First disable the clock */
 	ret = i2c_smbus_read_byte_data(client, M41T80_REG_ALARM_MON);
 	if (ret < 0)
-- 
2.30.0

