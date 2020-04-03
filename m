Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1F619D573
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Apr 2020 13:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgDCLFA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 Apr 2020 07:05:00 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49431 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727968AbgDCLFA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 Apr 2020 07:05:00 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jKK7p-0005e4-Gd; Fri, 03 Apr 2020 11:04:37 +0000
From:   Colin King <colin.king@canonical.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-rtc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next][V3] rtc: ds1307: check for failed memory allocation on wdt
Date:   Fri,  3 Apr 2020 12:04:37 +0100
Message-Id: <20200403110437.57420-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently a failed memory allocation will lead to a null pointer
dereference on point wdt.  Fix this by checking for a failed
allocation and just returning.

Addresses-Coverity: ("Dereference null return")
Fixes: fd90d48db037 ("rtc: ds1307: add support for watchdog timer on ds1388")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: move error exit label and remove a return statement, thanks to 
    Walter Harms for spotting this clean up.
V3: simplify, just bail out and return on detecting the out of memory
    condition

---

 drivers/rtc/rtc-ds1307.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index fad042118862..49702942bb08 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1673,6 +1673,8 @@ static void ds1307_wdt_register(struct ds1307 *ds1307)
 		return;
 
 	wdt = devm_kzalloc(ds1307->dev, sizeof(*wdt), GFP_KERNEL);
+	if (!wdt)
+		return;
 
 	wdt->info = &ds1388_wdt_info;
 	wdt->ops = &ds1388_wdt_ops;
-- 
2.25.1

