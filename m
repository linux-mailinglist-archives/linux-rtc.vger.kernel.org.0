Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D12B6418F07
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Sep 2021 08:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232973AbhI0GjM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 Sep 2021 02:39:12 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:44975 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232821AbhI0GjM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 Sep 2021 02:39:12 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 68878240005;
        Mon, 27 Sep 2021 06:37:30 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Daniel Palmer <daniel@thingy.jp>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: msc313: fix missing include
Date:   Mon, 27 Sep 2021 08:37:23 +0200
Message-Id: <20210927063724.312687-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The driver needs io.h

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-msc313.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-msc313.c b/drivers/rtc/rtc-msc313.c
index f493ca5f181b..5f178d29cfd8 100644
--- a/drivers/rtc/rtc-msc313.c
+++ b/drivers/rtc/rtc-msc313.c
@@ -10,6 +10,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
-- 
2.31.1

