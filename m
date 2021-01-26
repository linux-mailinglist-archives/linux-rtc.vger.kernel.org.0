Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79921304C67
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Jan 2021 23:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729663AbhAZWlE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Jan 2021 17:41:04 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:56437 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728202AbhAZWPW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Jan 2021 17:15:22 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 913A2240003;
        Tue, 26 Jan 2021 22:14:36 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rtc: rv3028: fix PORF handling
Date:   Tue, 26 Jan 2021 23:14:33 +0100
Message-Id: <20210126221435.2152339-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The PORF bit is cleared on interrupts which prevents the driver to know
when the time and date are invalid. Stop clearing PORF in the interrupt
handler.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3028.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 2004f8c5397f..4f8f6092097a 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -268,6 +268,8 @@ static irqreturn_t rv3028_handle_irq(int irq, void *dev_id)
 	if (status & RV3028_STATUS_PORF)
 		dev_warn(&rv3028->rtc->dev, "Voltage low, data loss detected.\n");
 
+	status &= ~RV3028_STATUS_PORF;
+
 	if (status & RV3028_STATUS_TF) {
 		status |= RV3028_STATUS_TF;
 		ctrl |= RV3028_CTRL2_TIE;
-- 
2.29.2

