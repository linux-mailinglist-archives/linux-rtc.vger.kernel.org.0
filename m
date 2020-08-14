Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE8A2446E1
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Aug 2020 11:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgHNJRm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Aug 2020 05:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgHNJRl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Aug 2020 05:17:41 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79DC8C061383
        for <linux-rtc@vger.kernel.org>; Fri, 14 Aug 2020 02:17:41 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id w17so9580126ybl.9
        for <linux-rtc@vger.kernel.org>; Fri, 14 Aug 2020 02:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=QsRsOCpoXcwdRIsVUMLGWKWsf8QgiczNEiWX1UbiUY4=;
        b=oGYgJqsYuUV0Hms2m3LZF+iq+NfQ6YoaeJQuq9z72NuNFa7OMslSlpLVFCZsmBJKNY
         ZaWg1WLV+vs/Ii/09pl7wGF+m/bB3EF5lLW7WI/pC3dVEM2c1ZuHHEsSSup17xqCh0Ec
         uCnsrdpI/LkrE0aBV+2tu7VnODtCWhubakNAmOVfig+qZvz/xH1E4BYlCJRCCqkq2PKD
         D7+5oFEyqcp7GrBssXUJh+wS72z4rB+PKi04rD25p4gCEkOgi9S3CC0BBwPFSrgw2CS8
         o3D4+7jfC777vMMakgcTIm1i2mvi2D1nyoPJL9heKLuQ0bfK6llK/R6otOm3LGuJNKRJ
         vOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=QsRsOCpoXcwdRIsVUMLGWKWsf8QgiczNEiWX1UbiUY4=;
        b=DapOqDVEZwGiA2EM0iuJF+z0aw9CRD8/N6ibxYNBLUkFEKfzIMo6gSAoK9xeuOHi9o
         zpD24B6aGePxH/bQ5jQldOXZkSnXuH2HsrR+XdiR31k9WGPGypQqguSaa4SS+hNFl8Mw
         VwmkciE153jpp1IBhXtoV1On/+HBx5SardsjUVjQM0+rcDt1n72Axi24hon5H7wLNPAt
         GhagRk+jE7gn3UKTk5SF770WV8YpmBH9LwhLqpyqKjdvNtxTWVcD6tBQV9zM0/f3SGU0
         oJJuIz75y31R/zvq8M/gYedWRdNE6oOK52lmZTaba1vCibrPVJkJ/4qYaKxIjl+nrKOk
         4R+g==
X-Gm-Message-State: AOAM533W/KW9YJ8m2+1FoJ3epn/JsOYxieBuP7cHqPovfdZoS9vWeoUb
        7XMpk8jRCmrrUYEf6BMYlJDCyBSP/SI6ocBc
X-Google-Smtp-Source: ABdhPJyqUdHa5EmOBsxJ8UelCFoy6G5Gk4fPgGTLmQMMoD2fMMoqIo1HcRzpjCoZNQJBP39oDw+oJT22mnXtWQ4J
X-Received: by 2002:a25:3556:: with SMTP id c83mr2374756yba.412.1597396659823;
 Fri, 14 Aug 2020 02:17:39 -0700 (PDT)
Date:   Fri, 14 Aug 2020 19:17:30 +1000
Message-Id: <20200814191654.v2.1.Iaf7638a2f2a87ff68d85fcb8dec615e41340c97f@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
Subject: [PATCH v2] rtc: cmos: zero-init wkalrm when reading from CMOS
From:   Victor Ding <victording@google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Victor Ding <victording@google.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

cmos_read_alarm() may leave certain fields of a struct rtc_wkalrm
untouched; therefore, these fields contain garbage if not properly
initialized, leading to inconsistent values when converting into
time64_t. This patch to zero initialize the struct before calling
cmos_read_alarm().

Note that this patch is not intended to produce a correct time64_t, it
is only to produce a consistent value. In the case of suspend/resume, a
correct time64_t is not necessary; a consistent value is sufficient to
correctly perform an equality test for t_current_expires and
t_saved_expires. Logic to deduce a correct time64_t is expensive and
hence should be avoided.

Signed-off-by: Victor Ding <victording@google.com>
---

Changes in v2:
    - Initialize the struct to 0 instead of -1;
    - Initialize the whole struct rtc_wkalrm.

 drivers/rtc/rtc-cmos.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index bcc96ab7793f..c633319cdb91 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -1006,6 +1006,7 @@ static int cmos_suspend(struct device *dev)
 			enable_irq_wake(cmos->irq);
 	}
 
+	memset(&cmos->saved_wkalrm, 0, sizeof(struct rtc_wkalrm));
 	cmos_read_alarm(dev, &cmos->saved_wkalrm);
 
 	dev_dbg(dev, "suspend%s, ctrl %02x\n",
@@ -1054,6 +1055,7 @@ static void cmos_check_wkalrm(struct device *dev)
 		return;
 	}
 
+	memset(&current_alarm, 0, sizeof(struct rtc_wkalrm));
 	cmos_read_alarm(dev, &current_alarm);
 	t_current_expires = rtc_tm_to_time64(&current_alarm.time);
 	t_saved_expires = rtc_tm_to_time64(&cmos->saved_wkalrm.time);
-- 
2.28.0.220.ged08abb693-goog

