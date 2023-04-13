Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0516E0DA4
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Apr 2023 14:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjDMMrx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 13 Apr 2023 08:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjDMMrw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 13 Apr 2023 08:47:52 -0400
X-Greylist: delayed 61 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 13 Apr 2023 05:47:48 PDT
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE6C9744
        for <linux-rtc@vger.kernel.org>; Thu, 13 Apr 2023 05:47:48 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id mwLapE3KkPm6CmwLcpKMmE; Thu, 13 Apr 2023 14:46:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1681390004; bh=kR4F0OKtricoezD1YtUmEKzC02018hZp0+doNYMiWHM=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=nQO+3rTEb2NrQ9dpK+53vf39wJPPpDMXIt0FzOHPY73VsDG/TO4BCkpCOjPIYWIft
         IKRj6bCWCWYRwk8R5wy5IeorinZIxcaXQiaRJVM41FxzoYmATsGJ/CN1JqAIZ5+2xG
         4OsgLGNo31Id98hcl8gYFB4Fxr7v0IFQoAuz8MDoZDU3Y20uLeqdcZCsf4gZqB2YVz
         UfzMDsKKdjp4K7y7Qk9VwsBRg8bcLc8tPCEi82U7b/TsqxtslQvvnILwDBGrGQEzvP
         fEjBDJ6IAsxG/fBB9NaGcxW2j1B0zDyWqpmLo9mOQqWR64MV1L2fwPxilAqS05mDCT
         7kHTniuoOeaEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1681390004; bh=kR4F0OKtricoezD1YtUmEKzC02018hZp0+doNYMiWHM=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=nQO+3rTEb2NrQ9dpK+53vf39wJPPpDMXIt0FzOHPY73VsDG/TO4BCkpCOjPIYWIft
         IKRj6bCWCWYRwk8R5wy5IeorinZIxcaXQiaRJVM41FxzoYmATsGJ/CN1JqAIZ5+2xG
         4OsgLGNo31Id98hcl8gYFB4Fxr7v0IFQoAuz8MDoZDU3Y20uLeqdcZCsf4gZqB2YVz
         UfzMDsKKdjp4K7y7Qk9VwsBRg8bcLc8tPCEi82U7b/TsqxtslQvvnILwDBGrGQEzvP
         fEjBDJ6IAsxG/fBB9NaGcxW2j1B0zDyWqpmLo9mOQqWR64MV1L2fwPxilAqS05mDCT
         7kHTniuoOeaEQ==
Date:   Thu, 13 Apr 2023 14:46:42 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     linux-rtc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] rtc: m41t80: Fix invalid alarm time
Message-ID: <ZDf5soNMNaI+VOId@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Envelope: MS4wfHp/mQF9widY9IyBWOZw2ZZ8sApATeJTFylNTcnA+LkMW+riKHbSUPEAZ6lODGWwpizkC7LJ1fY8NLtvbPKLITIdnwSoOaCAeMJx7m0IGBv5dpWai0VU
 tNp4OZuPyLHyaUXz0EIKcPyFr0Y9v9xMfrCZVTxRQ7PmAWjwHrPUQL1l5sS3PLJPl9Zi4ZnRl1+O5Tp4XSmF8n3R6bRjbiXPCWg=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

When no alarm has been programmed on m41t80 chip, an error message is
printed during boot:

    rtc rtc0: invalid alarm value: 2023-4-12 45:85:85

Fix this by returning -1 instead of actual register values.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 NOTE: 
 This patch is shamelessly based on
 15d82d224987 ("rtc: sh: Fix invalid alarm warning for non-enabled alarm")
 so question arises whenever rtc core should'n handle !alrm->enabled
 case itself.

 drivers/rtc/rtc-m41t80.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 084ff1f07a82..678769847df6 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -572,15 +572,23 @@ static int m41t80_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	if (flags < 0)
 		return flags;
 
-	alrm->time.tm_sec  = bcd2bin(alarmvals[4] & 0x7f);
-	alrm->time.tm_min  = bcd2bin(alarmvals[3] & 0x7f);
-	alrm->time.tm_hour = bcd2bin(alarmvals[2] & 0x3f);
-	alrm->time.tm_mday = bcd2bin(alarmvals[1] & 0x3f);
-	alrm->time.tm_mon  = bcd2bin(alarmvals[0] & 0x3f) - 1;
-
 	alrm->enabled = !!(alarmvals[0] & M41T80_ALMON_AFE);
 	alrm->pending = (flags & M41T80_FLAGS_AF) && alrm->enabled;
 
+	if (alrm->enabled) {
+		alrm->time.tm_sec  = bcd2bin(alarmvals[4] & 0x7f);
+		alrm->time.tm_min  = bcd2bin(alarmvals[3] & 0x7f);
+		alrm->time.tm_hour = bcd2bin(alarmvals[2] & 0x3f);
+		alrm->time.tm_mday = bcd2bin(alarmvals[1] & 0x3f);
+		alrm->time.tm_mon  = bcd2bin(alarmvals[0] & 0x3f) - 1;
+	} else {
+		alrm->time.tm_sec  = -1;
+		alrm->time.tm_min  = -1;
+		alrm->time.tm_hour = -1;
+		alrm->time.tm_mday = -1;
+		alrm->time.tm_mon  = -1;
+	}
+
 	return 0;
 }
 
-- 
2.32.0

