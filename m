Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C72A7288CB7
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Oct 2020 17:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389355AbgJIPbK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Oct 2020 11:31:10 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:52669 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389297AbgJIPbK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Oct 2020 11:31:10 -0400
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 05D5B200008;
        Fri,  9 Oct 2020 15:31:07 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] rtc: rv3028: fix trickle resistor values
Date:   Fri,  9 Oct 2020 17:30:59 +0200
Message-Id: <20201009153101.721149-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201009153101.721149-1-alexandre.belloni@bootlin.com>
References: <20201009153101.721149-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Version 1.0 of the application manual had the wrong resistor values. Fix
them according to version 1.1

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3028.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index fcc21b1b07b4..5cfce6415d9c 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -95,7 +95,7 @@ struct rv3028_data {
 #endif
 };
 
-static u16 rv3028_trickle_resistors[] = {1000, 3000, 6000, 11000};
+static u16 rv3028_trickle_resistors[] = {3000, 5000, 9000, 15000};
 
 static ssize_t timestamp0_store(struct device *dev,
 				struct device_attribute *attr,
-- 
2.26.2

