Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A779B18E394
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Mar 2020 19:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbgCUSIs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 21 Mar 2020 14:08:48 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:41268 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgCUSIr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 21 Mar 2020 14:08:47 -0400
Received: by mail-qk1-f195.google.com with SMTP id q188so5484922qke.8;
        Sat, 21 Mar 2020 11:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LRcpqUlfEwj9Z7VT8/V9McP3zliMkBrA9OW7JFw5CHc=;
        b=L2FkCANfE35N/g2oOrN0KLgiohhfdBuWkw49Pw1JFL9dd+y7IdF/bkPXSZs4yujFiU
         5Cn2TBqRD9opmIK69Y/ZdBfnlqWwc4q/7Hd8PwGEvJ6HPN++oRwci4eoyoy2oocP2ujj
         rQ70DkUnsAixCvYK5qVa7e9YcYgm13iBCoC9Rpql2X0isoB+dv3EvCrJ4hnzLOnW7EvO
         dOqpxHWMIHf3WtXK7/mzwl2KckMQzc01/64m0KZVGvR4g+aB0KM9+AlsSijenlatH3wX
         /kkbuUPbcyxmGTsy3jqydYS4RM6GYAKTrNAkoNO4XfHeFlfHhVJFgjLKwx0aPdgmSzKy
         fEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LRcpqUlfEwj9Z7VT8/V9McP3zliMkBrA9OW7JFw5CHc=;
        b=XabilnO2JC+AhPLNQ9i23RaoK0C0g1TmP0woD2awty5dV0f4Jf8f4+H1X+Z2qtXa1w
         BcXEmjLTo4vXqgIuH4n7zIwxj7szfFoxms/ZphcnCb6yboha2ks/mJu2QR207ooryWsJ
         jA6EFP0mze5kxCMWuzaa9RwQH6pA60tgS3Xe8HhvE89zYbFAGPJEPPMIQsBU3jCwKDbS
         QwWo1/lYcNgd98NZwwzYyTpIqQjDknmN6dCexRdAIotTdvqrdjdB3iq8diUVIllb5VvT
         bmo45dtFsMcnbJfk3KtdYTEG46wIhQr94cdflnSUPsnhK4XJg7F+PWJDisAkOu8mCzOp
         3kYA==
X-Gm-Message-State: ANhLgQ11Mfev2d6ZQSN/E/qBw9DfMJqPZ4y8/nzmHaPnslcCfXij093O
        ZRIaI639nUZkSrNM2u3jUw35jlKPf+uG3HM=
X-Google-Smtp-Source: ADFU+vtYVxUKGckui2o06J7hc+GrICup+6Bw1ia+ktyAgs+4I9/kdUxS20MWHoai21VrgjQnIefGdA==
X-Received: by 2002:a37:9e8a:: with SMTP id h132mr13477343qke.314.1584814126517;
        Sat, 21 Mar 2020 11:08:46 -0700 (PDT)
Received: from localhost.localdomain ([142.184.118.218])
        by smtp.googlemail.com with ESMTPSA id 79sm7277092qkg.38.2020.03.21.11.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2020 11:08:46 -0700 (PDT)
From:   Keyur Patel <iamkeyur96@gmail.com>
Cc:     Keyur Patel <iamkeyur96@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: bd70528: Avoid double error messaging when IRQ absent
Date:   Sat, 21 Mar 2020 14:08:37 -0400
Message-Id: <20200321180838.12729-1-iamkeyur96@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Since the commit 7723f4c ("driver core: platform: Add an error message
to platform_get_irq*()") platform_get_irq() started issuing an error message.
Thus, there is no need to have the same in the driver.

Signed-off-by: Keyur Patel <iamkeyur96@gmail.com>
---
 drivers/rtc/rtc-bd70528.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index bbbb1f07c91f..4492b770422c 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -542,10 +542,8 @@ static int bd70528_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq_byname(pdev, irq_name);
 
-	if (irq < 0) {
-		dev_err(&pdev->dev, "Failed to get irq\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	platform_set_drvdata(pdev, bd_rtc);
 
-- 
2.25.0

