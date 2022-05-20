Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8E3952E73E
	for <lists+linux-rtc@lfdr.de>; Fri, 20 May 2022 10:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346955AbiETIZG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 20 May 2022 04:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346962AbiETIZF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 20 May 2022 04:25:05 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2BB114042C
        for <linux-rtc@vger.kernel.org>; Fri, 20 May 2022 01:25:02 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id A65D620000A;
        Fri, 20 May 2022 08:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1653035101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=ID1+nmNLImnrgoFrnAXiyDCe2YN8dYKzqeCbV3qacjE=;
        b=ZGFEcVr8wuHoQ7TgU2f7fsICInFmyogn0QBaAcdp3+fGa+PcomPv5tW19dMSx1hsRWVaDh
        HMahYGjIzAhDwzdNk9e5LLCtXdbp6Et2f8KDMuk267qEGEZlFAkPxB1JmOgQixsoxr/XfG
        DbrnGy/Y+1MmE3+J/3hWxYSGALqDlEhI5gZCSVkr2eEyOKcgztIOx+Kb7suJX+fOBN4RpV
        6/KrXynQ2VE5GyF21nXhkADSFQqrVOR8dYthyfI4VeHUxU0pnoqBC4JaP0qhN9HIXzJqRi
        7ZlYHVXjMUKm81A0IGD36POaLJxtmMxdpEEOSq5AkVCumYoYlPrtUJ0X1MRcTA==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] rtc: rzn1: Fix a variable type
Date:   Fri, 20 May 2022 10:25:00 +0200
Message-Id: <20220520082500.489248-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The calculation in ->set_offset() handles both negative and positive
offsets. The 'steps' variable will be checked to be in a specific [-x;
+x] range, which means it must be a signed integer rather than
unsigned.

This also fixes the following smatch warning:

     warn: 'steps' 'true' implies 'steps > 0' is 'true'

Fixes: be4a11cf98af ("rtc: rzn1: Add oscillator offset support")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/rtc/rtc-rzn1.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index bdd4ebd5c887..66405b43ae7e 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -270,8 +270,7 @@ static int rzn1_rtc_read_offset(struct device *dev, long *offset)
 static int rzn1_rtc_set_offset(struct device *dev, long offset)
 {
 	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
-	unsigned int steps;
-	int stepsh, stepsl;
+	int stepsh, stepsl, steps;
 	u32 subu = 0, ctl2;
 	int ret;
 
-- 
2.34.1

