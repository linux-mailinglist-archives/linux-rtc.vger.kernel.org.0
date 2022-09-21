Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3D65BF7F8
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Sep 2022 09:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbiIUHmA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Sep 2022 03:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiIUHlu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 21 Sep 2022 03:41:50 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234023F331
        for <linux-rtc@vger.kernel.org>; Wed, 21 Sep 2022 00:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1663746109; x=1695282109;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sKhwkOcOYjdqb7bwSkn3b+kCrVmijBxr/gIMBO7i0rM=;
  b=aa3jKonH7g3+DMDrsGeya2bnKIc6R0eMnJxoJrxvxp02/4E7DBFBRa7c
   jMYV77TfeGTrNHXuWKl4rDH7YEL4diDZ5rNdPbtwZiTGSHDN6brt1wEGG
   ozjd8ePV0za/iJgDM4/XQ7WZtmpllBOb50ehrw5ktJ5yFqL9zGAfpkhZ9
   WMy1qvU6BFf3RpDc+plyEKGA5e+VZ4O+UFUWDlwT+SSo65g80sgxJJrGQ
   ZDrCkDdS62pDnI98FsYty6nfXpBsvs31rxMhQBSBj3HTzwXEJoFrkY6Dt
   0HmUeuCqEyQ5rX6n7APxIsaONqUXaHDuY+hH9sj4TKwLpiED9YmBfEpXN
   g==;
X-IronPort-AV: E=Sophos;i="5.93,332,1654552800"; 
   d="scan'208";a="26302180"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Sep 2022 09:41:47 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 21 Sep 2022 09:41:47 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 21 Sep 2022 09:41:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1663746107; x=1695282107;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sKhwkOcOYjdqb7bwSkn3b+kCrVmijBxr/gIMBO7i0rM=;
  b=I/6Dp9D4x8aOvB4Jl1BikjdwsC3nI8AYzfHSEYIsO+ZeBuyDYTlDTDlH
   cbf84cw2HCBzDcx3gGDM2eTNUZC//Rnf9a8V98jum66ZSTBOI3gyAIPkd
   J1VC3MpX8kFEwja0O5Po5So+p1Do7V3izCYEu5+yIyfOGogq/O4aSDECG
   fV4ALjub0OwXNygS/ydWl3y7FIzZjCHeDA8+uizdLOyh8lD2XF/oYFOvZ
   Pf60o0Dyto7I/Z9Y3b9iFZXQhEv8EHmbwnrw9UA+hpJ6JwR+bXLiXpav/
   SNFk8YNLycc6BkQk7SCwA4UoeIqK06s8vfHOyw8ygOtlKmEOYzrDATMNp
   A==;
X-IronPort-AV: E=Sophos;i="5.93,332,1654552800"; 
   d="scan'208";a="26302179"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Sep 2022 09:41:47 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 35A96280056;
        Wed, 21 Sep 2022 09:41:47 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-rtc@vger.kernel.org
Subject: [PATCH 1/1] rtc: pcf85063: Fix reading alarm
Date:   Wed, 21 Sep 2022 09:41:41 +0200
Message-Id: <20220921074141.3903104-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

If the alarms are disabled the topmost bit (AEN_*) is set in the alarm
registers. This is also interpreted in BCD number leading to this warning:
rtc rtc0: invalid alarm value: 2022-09-21T80:80:80

Fix this by masking alarm enabling and reserved bits.

Fixes: 05cb3a56ee8c ("rtc: pcf85063: add alarm support")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/rtc/rtc-pcf85063.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 095891999da1..99f9cc57c7b3 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -169,10 +169,10 @@ static int pcf85063_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	if (ret)
 		return ret;
 
-	alrm->time.tm_sec = bcd2bin(buf[0]);
-	alrm->time.tm_min = bcd2bin(buf[1]);
-	alrm->time.tm_hour = bcd2bin(buf[2]);
-	alrm->time.tm_mday = bcd2bin(buf[3]);
+	alrm->time.tm_sec = bcd2bin(buf[0] & 0x7f);
+	alrm->time.tm_min = bcd2bin(buf[1] & 0x7f);
+	alrm->time.tm_hour = bcd2bin(buf[2] & 0x3f);
+	alrm->time.tm_mday = bcd2bin(buf[3] & 0x3f);
 
 	ret = regmap_read(pcf85063->regmap, PCF85063_REG_CTRL2, &val);
 	if (ret)
-- 
2.25.1

