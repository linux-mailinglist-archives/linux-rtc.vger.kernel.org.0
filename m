Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 174521C2841
	for <lists+linux-rtc@lfdr.de>; Sat,  2 May 2020 22:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbgEBUfE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 2 May 2020 16:35:04 -0400
Received: from mta-p5.oit.umn.edu ([134.84.196.205]:58108 "EHLO
        mta-p5.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728495AbgEBUfE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 2 May 2020 16:35:04 -0400
X-Greylist: delayed 359 seconds by postgrey-1.27 at vger.kernel.org; Sat, 02 May 2020 16:35:03 EDT
Received: from localhost (unknown [127.0.0.1])
        by mta-p5.oit.umn.edu (Postfix) with ESMTP id 49F11C5m3Xz9vCGw
        for <linux-rtc@vger.kernel.org>; Sat,  2 May 2020 20:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gbuwZI-WmkId for <linux-rtc@vger.kernel.org>;
        Sat,  2 May 2020 15:29:03 -0500 (CDT)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 49F11C4P6Jz9vCGK
        for <linux-rtc@vger.kernel.org>; Sat,  2 May 2020 15:29:03 -0500 (CDT)
Received: by mail-qt1-f199.google.com with SMTP id q43so15593039qtj.11
        for <linux-rtc@vger.kernel.org>; Sat, 02 May 2020 13:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=XhfKgI9d6Gl57N2Xx+fFhl6LTDCxp0mSoTy+rfsye04=;
        b=NACOQcAGJGH5sXKDxAh57PTNyXO4NzVhdP3BU6XhZ8epwS8RJ2Gqems+ZANNqkshZd
         uPmytVOkdjETi8P8i2eKnEHpqKFYxRjRz4DLDAUKX1yFEso52g+05AeYgtl3lQbo9jtP
         41rPj+JygDd+3H9lSBqf3YICiBsKsXCb6Un+deoHXK5b3fqpLFSec/bXI80jNkd390eQ
         F/THkSvUvEafMhaTHgCDfWWBlUXwvFKDSjrdUpNw2vrkz66/z9v4iT1KQy5PuQRZ28ij
         Oq1zZAT4pKxi6OBksgnXzISTvdEsOoyEuSBdpSQPSmkRQGsa/pW3SvHc4+jVGklQxCOg
         ddGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XhfKgI9d6Gl57N2Xx+fFhl6LTDCxp0mSoTy+rfsye04=;
        b=Rby5fgM3AdfVvfKcdmeY+ey6yT0yODwHV8SILZfhnzpQlDfsRnGhDzUmzMFBrnELML
         CIErLaIISCWk1/htW84vWlj8l32Pz535W9LVjr59TiglsQ/EeDPLqkoGuXUnSTVq4QOr
         RhX9zy0rV4Him/tro9Ofd8dRK8R20/a2sD+kJiqozTg1B5ZQFFNIJ7mhE0JR4ao0eHkK
         WzivyioBqOr93OMhytD8oaGjpKBckrbyf0H48Q7Hqoel+0vXFX4GeBZdl+WB0fc7TDkX
         /Pdurvkb+5WAZc0OMWfKaViMN8x01BqSx+2d4jjzg12BWC31La4DWcUpNkT18PitIkgK
         TQdw==
X-Gm-Message-State: AGi0PuYsn+1NS3Pp4czPQWPKMIy4HsTeuY6278jxg1C8cVJ4QESjrgBl
        RxpnP7vjZvX6mw7vurnXSU0HVFBJGF/A13EtdVDZ0XcXJBUFHk7mETJ0fH24r6gPICH0uyx29px
        oWEvbFI9IreFMwVh8UGnwzxhy
X-Received: by 2002:a37:ac14:: with SMTP id e20mr8576893qkm.23.1588451342941;
        Sat, 02 May 2020 13:29:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypLnqqSKaOgG4dqiXXVM5Q4flAZk4SPm0seeBmN6KTYxyCVHWkAQKRlXcl69Z44LbuBMXv4Xkw==
X-Received: by 2002:a37:ac14:: with SMTP id e20mr8576878qkm.23.1588451342498;
        Sat, 02 May 2020 13:29:02 -0700 (PDT)
Received: from qiushi.dtc.umn.edu (cs-kh5248-02-umh.cs.umn.edu. [128.101.106.4])
        by smtp.gmail.com with ESMTPSA id b10sm6023306qtj.30.2020.05.02.13.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 13:29:01 -0700 (PDT)
From:   wu000273@umn.edu
To:     a.zummo@towertech.it
Cc:     alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kjlu@umn.edu, wu000273@umn.edu
Subject: [PATCH] rtc: mc13xxx: fix a double-unlock issue
Date:   Sat,  2 May 2020 15:28:52 -0500
Message-Id: <20200502202852.13731-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

In function mc13xxx_rtc_probe, the mc13xxx_unlock() is called
before rtc_register_device(). But in the error path of
rtc_register_device(), the mc13xxx_unlock() is called again,
which causes a double-unlock problem. To fix this problem, we
need to call mc13xxx_lock() again in this error path.

Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/rtc/rtc-mc13xxx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mc13xxx.c b/drivers/rtc/rtc-mc13xxx.c
index afce2c0b4bd6..d6802e6191cb 100644
--- a/drivers/rtc/rtc-mc13xxx.c
+++ b/drivers/rtc/rtc-mc13xxx.c
@@ -308,8 +308,10 @@ static int __init mc13xxx_rtc_probe(struct platform_device *pdev)
 	mc13xxx_unlock(mc13xxx);
 
 	ret = rtc_register_device(priv->rtc);
-	if (ret)
+	if (ret) {
+		mc13xxx_lock(mc13xxx);
 		goto err_irq_request;
+	}
 
 	return 0;
 
-- 
2.17.1

