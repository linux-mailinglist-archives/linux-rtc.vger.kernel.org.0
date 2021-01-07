Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2DE02ED10E
	for <lists+linux-rtc@lfdr.de>; Thu,  7 Jan 2021 14:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728745AbhAGNmt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 Jan 2021 08:42:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728737AbhAGNms (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 Jan 2021 08:42:48 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC83C0612F6
        for <linux-rtc@vger.kernel.org>; Thu,  7 Jan 2021 05:42:08 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d26so5648252wrb.12
        for <linux-rtc@vger.kernel.org>; Thu, 07 Jan 2021 05:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v3qbp3ZMuwuzWhmCass4IRAk8ZAQ/ACJDj2q433vAbg=;
        b=rZXJ+p7nRYeGl9SWPfS1whanzVkdZoIbBxEWvnNvDx/P/T0FRcoy/6H3OM1Frz/1nx
         FGRs5WxCLAFOz+d3ap5a+xHiHJQD2cWlqY4yVKXYrNzLqpg3RnnIJt6LT8ApD8Az3bQj
         u2besmmV3asVZJMii9cWrsryRvCpxgytlYSBlxswLNANwutC01QhPpzXGitSwWh/SjPU
         TZJIcYYqyWT35SBhhjUnFOInUGdeiQ312TAL/EM6cwWnyOLROZxRXoQtLHqCSCymLyG6
         zcYVQ83WNbjUOk1j2HifRpdEzc4SKVFMrBfOsWF0yCzIquI0NwYUyKHcS4q7zK6AFU+O
         oxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v3qbp3ZMuwuzWhmCass4IRAk8ZAQ/ACJDj2q433vAbg=;
        b=gaFTdCLrvhGO4L/mMtdJKIAJxU/ZF+Y/+tGc1Al9mdOoeVZg6SLmxKnEb6yvnV2jdc
         BqyHSlYetCnOoidaa/AI/1NKW+QSMPL4CCctXlc+59y+4vGms+alnz/kydHj9aCFpkY6
         I+nun8gX515KOWMSANq19QTP1ZSocztJJAZd/f3uIYeT8TS5subH2BkFTi2vxaDahGRl
         DO02uCDh0GcKU2wJe1cqbVUqcj1ybD9kpnWEiCJIMBqt1l0SZHcEsSB6l20upYm6bwk1
         dDakW5327g1pmAuJJ6W5GS5lCWj/kC1IPf9xfTTBcvKkFP1WWY6Aj4RfkB/ybF/k6p8p
         Jbew==
X-Gm-Message-State: AOAM532sxyQZUdqr9Tj5Hjx9iHdHCQnoCEP1r5eZ+IwwLft440bZi0Ua
        BPHe+t+02eX0YEzt6zMOar4Q3w==
X-Google-Smtp-Source: ABdhPJyoOYIbXOl7BaXgxmBR2MYncdd+LZgqtPeWdOiP64bRsHmgX+TEX8fh5IC7i0elOaJDb61gew==
X-Received: by 2002:a5d:4dc6:: with SMTP id f6mr9216369wru.336.1610026926883;
        Thu, 07 Jan 2021 05:42:06 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id g184sm7852710wma.16.2021.01.07.05.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 05:42:06 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/2] rtc: s5m: check the return value of s5m8767_rtc_init_reg()
Date:   Thu,  7 Jan 2021 14:42:02 +0100
Message-Id: <20210107134203.9388-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This function can fail if regmap operations fail so check its return
value in probe().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-s5m.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index eb9dde4095a9..e0011d3cf61b 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -791,6 +791,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, info);
 
 	ret = s5m8767_rtc_init_reg(info);
+	if (ret)
+		return ret;
 
 	device_init_wakeup(&pdev->dev, 1);
 
-- 
2.29.1

