Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECFA8CFC5D
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2019 16:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725795AbfJHOZr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Oct 2019 10:25:47 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38876 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbfJHOZr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Oct 2019 10:25:47 -0400
Received: by mail-wm1-f66.google.com with SMTP id 3so3351219wmi.3
        for <linux-rtc@vger.kernel.org>; Tue, 08 Oct 2019 07:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id;
        bh=T1EoziBTkltAHMdc4buw9CGaKKcLnkZK2Xg/SL3bAR4=;
        b=yXu869UJT4DZ6ShP3Lq21w+k8SvrbwZ8BBXbEyayU0MvLGlVN3E2x1fFomLnlsmvYZ
         DbfNuFvjNpjti30lwXOENTvIDu4MiRca3YQ2N3r+cql9Kj2PyDju9lqX0OP8pmASzC6d
         OY7DttRSnAnzlQTE+sbf2xRBiizj5VykngpWgDfQ+hqVB7DmbyCkvXuR1zl9aBHvDCuL
         I4vAqaRSq+jigGBskbCgUemaslfTPxO6cVZS13SB++qADsBWF5EETqcj6joc8XpjbF4w
         mccVrmF0uFeTTkh+HJgtHsrDi+bbyz9pdJ3c0muVodEpQYuYq4hFnwbSUaXHLE9N1CUh
         hPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=T1EoziBTkltAHMdc4buw9CGaKKcLnkZK2Xg/SL3bAR4=;
        b=AwyYOw4RUzJgfjjbldARCPd5RZo84AuEXEk8RzdHGRaO70Hk7e2Mty+UFtjtvigrKd
         OdEDB4A3wTzZEOnSh9yhjn+vz9gBUszVGD5gVgn0cY3EK8IFA4A0jlqOaFFi7Km4J8kI
         b4AG64Iqxs3jCnjaaDjvcvkoi/V2cmKs74OK2R9aLIbOBBKEYDmLPLjV4hyqlEXST7hT
         FEAThq71+HL4AOC2osTbyFD+YF25WLYllwEg5eZFcqEat8af91oIXwpsbg7fS9OKqd9q
         TGJeRemSIPPZH+yqZQhSWmAeboVVk7eV3R4KU+WDO1Z3W3LLAGnehEoHHGlyKMndl68/
         y6WA==
X-Gm-Message-State: APjAAAXC+I9gOgFJWq+KC4Kuj7qdV2hSOgA34wdqkuuePrJJDDBH0nJ9
        pM5Pg2srVv7EYFLmQ3efPCaS1g==
X-Google-Smtp-Source: APXvYqyWKsQ9SfdIDOC7smhgfVGN4ZnXDTPhORIUYTwQs0c17NQHzryFDWGsfQjjV5PUvpaqvl9hSQ==
X-Received: by 2002:a1c:1fd3:: with SMTP id f202mr3957965wmf.18.1570544743722;
        Tue, 08 Oct 2019 07:25:43 -0700 (PDT)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id d10sm4485803wma.42.2019.10.08.07.25.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 07:25:42 -0700 (PDT)
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, git@xilinx.com
Cc:     Srinivas Goud <srinivas.goud@xilinx.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: xilinx: Fix calibval variable type
Date:   Tue,  8 Oct 2019 16:25:41 +0200
Message-Id: <20765c4c27aa92c75426b82fd2815ebef6471492.1570544738.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Srinivas Goud <srinivas.goud@xilinx.com>

This patch fixes the warnings reported by static code analysis.
Updated calibval variable type to unsigned type from signed.

Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 drivers/rtc/rtc-zynqmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 2c762757fb54..da0dbea8def3 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -44,7 +44,7 @@ struct xlnx_rtc_dev {
 	void __iomem		*reg_base;
 	int			alarm_irq;
 	int			sec_irq;
-	int			calibval;
+	unsigned int		calibval;
 };
 
 static int xlnx_rtc_set_time(struct device *dev, struct rtc_time *tm)
-- 
2.17.1

