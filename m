Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 767DC186969
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2020 11:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730684AbgCPKt4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Mar 2020 06:49:56 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:59099 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730478AbgCPKt4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Mar 2020 06:49:56 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 140FD24001D;
        Mon, 16 Mar 2020 10:48:29 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rtc: mt2712: remove unused variable
Date:   Mon, 16 Mar 2020 11:47:01 +0100
Message-Id: <20200316104701.209293-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200316104701.209293-1-alexandre.belloni@bootlin.com>
References: <20200316104701.209293-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

irqen is not used in  mt2712_rtc_set_alarm, remove it.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-mt2712.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-mt2712.c b/drivers/rtc/rtc-mt2712.c
index c2709c1602f0..617e397dd820 100644
--- a/drivers/rtc/rtc-mt2712.c
+++ b/drivers/rtc/rtc-mt2712.c
@@ -232,7 +232,6 @@ static int mt2712_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 {
 	struct mt2712_rtc *mt2712_rtc = dev_get_drvdata(dev);
 	struct rtc_time *tm = &alm->time;
-	u16 irqen;
 
 	dev_dbg(&mt2712_rtc->rtc->dev, "set al time: %ptR, alm en: %d\n",
 		tm, alm->enabled);
-- 
2.24.1

