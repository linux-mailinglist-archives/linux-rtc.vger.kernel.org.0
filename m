Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9495CF5200
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Nov 2019 18:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730530AbfKHRBs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 8 Nov 2019 12:01:48 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37304 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727654AbfKHRBq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 8 Nov 2019 12:01:46 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 040D3291340
Received: by jupiter.universe (Postfix, from userid 1000)
        id AAFFC48009C; Fri,  8 Nov 2019 18:01:42 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [RFCv1] rtc: m41t80: disable clock provider support
Date:   Fri,  8 Nov 2019 18:01:35 +0100
Message-Id: <20191108170135.9053-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
modules SQW clock output defaults to 32768 Hz. This behaviour is
used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
the clock is disabled and all i.MX6 functionality depending on
the 32 KHz clock have undefined behaviour (e.g. the hardware watchdog
run to fast or slow).

The normal solution would be to properly describe the clock tree
in DT, but from the kernel's perspective this is a chicken-and-egg
problem: CKIL is required very early, but the clock is only provided
after the I2C RTC has been probed.

Technically everything is fine by not touching anything, so this
works around the issue by disabling the clock handling from the
RTC driver. I guess the proper solution would be to simply mark the
clock as always-enabled, but this does not seem to be supported by
the clock framework.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Hi,

This is a downstream workaround/hack for the issue described in the
commit message. I would like to upstream a board based on Congatec's
QMX6, which requires a proper solution for this. Do you think it
would be ok to have an always-on flag for clocks similar to regulators?

-- Sebastian
---
 drivers/rtc/rtc-m41t80.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 5f46f85f814b..81743d93d03e 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -973,7 +973,7 @@ static int m41t80_probe(struct i2c_client *client,
 		}
 	}
 #endif
-#ifdef CONFIG_COMMON_CLK
+#if 0
 	if (m41t80_data->features & M41T80_FEATURE_SQ)
 		m41t80_sqw_register_clk(m41t80_data);
 #endif
-- 
2.24.0.rc1

