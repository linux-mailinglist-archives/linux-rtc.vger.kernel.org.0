Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D65EF0213
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Nov 2019 17:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390014AbfKEQBC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 Nov 2019 11:01:02 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52751 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389571AbfKEQBC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 Nov 2019 11:01:02 -0500
Received: by mail-wm1-f66.google.com with SMTP id c17so14234360wmk.2;
        Tue, 05 Nov 2019 08:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2rC8ggX+aC8YuG4dw8OqC3Cq4cY6/6sYtuLebkBYV4k=;
        b=DvEC2H29tCL+5FSH3h12iT9678mGG5PYHCknN/4DD/qmkbY0zsnvhF6cxSvNZJJaPE
         Fl9dfbN+IA0bbrWN9aTeyBXbqI2E9Xvs32sfb8+unxxZXeZjR6++wQv3Wda8TEqymh0r
         tOeHIIRA9YmwNw7zH0hzB5/qDwSgYNqgnNbzWGS/XFTDp+f3/nBf+b5CUZUNsQIS8Ihc
         F8HHsZHjKlOBkvZDsDB0K7cLtDdFzJdQsMlgrGcse6TuLYRIEj6UKo5SI4HKZMmAWqo2
         O5V3v3eNXvGY2oPub3QLVw4Ui9GxOAkVThPOO65KCuLrOCuQJq8DGyi+VwrwjPUgpjJd
         0oJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2rC8ggX+aC8YuG4dw8OqC3Cq4cY6/6sYtuLebkBYV4k=;
        b=ulA36M3xfFOWRdWeVOIlST3sxS/ewpAoEkU6dnK0epBembRcACRSv0A9TF1YS8g0C0
         pFayvIoU5BV8keQSKVC1fTAknZzgZFNi7VqyBqj/U+LRYKlu6mTUKZ+4DBrvcKdgi2z3
         dGxNw3N+hd3/Nl47ckYslQlKn5ATYZQNhjUh0I5IcSQcKNb907lQlDXZBb3QwffpCwwO
         bQWkvLwBhlOLgPXCPEcVLb6YaeXO+IlMkzoYuB4rJZh+ntIT0g17kpcpKaK/0tnqeEG6
         Gqu6nKZm5WZ10KRGUi/JkpNIS60KWdu4KoM7HJ9MzuCsEphElQeaNsRgI4SeH+lw07il
         zoCQ==
X-Gm-Message-State: APjAAAW34PqImE3T6LTvLJ8LYlh32s9x7uSTm4KN62RknDX8QRFo2CmK
        42V2g+ZkqU6vb1JVhXfGCEdhsfHccP8=
X-Google-Smtp-Source: APXvYqwRw/XYWeN4DeCUQgpwYfCK8xy2IpSeVe+Wf+k/ptFsKWKpXASzQ8Y1D3NSGWO9vJ5BJML98A==
X-Received: by 2002:a7b:c4c8:: with SMTP id g8mr4549883wmk.36.1572969658656;
        Tue, 05 Nov 2019 08:00:58 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id w8sm26805133wrr.44.2019.11.05.08.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 08:00:57 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2] rtc: brcmstb-waketimer: add missed clk_disable_unprepare
Date:   Wed,  6 Nov 2019 00:00:43 +0800
Message-Id: <20191105160043.20018-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This driver forgets to disable and unprepare clock when remove.
Add a call to clk_disable_unprepare to fix it.

Fixes: c4f07ecee22e ("rtc: brcmstb-waketimer: Add Broadcom STB wake-timer")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Remove the check for timer->clk and add fixes tag.

 drivers/rtc/rtc-brcmstb-waketimer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-brcmstb-waketimer.c b/drivers/rtc/rtc-brcmstb-waketimer.c
index 3e9800f9878a..82d2ab0b3e9c 100644
--- a/drivers/rtc/rtc-brcmstb-waketimer.c
+++ b/drivers/rtc/rtc-brcmstb-waketimer.c
@@ -277,6 +277,7 @@ static int brcmstb_waketmr_remove(struct platform_device *pdev)
 	struct brcmstb_waketmr *timer = dev_get_drvdata(&pdev->dev);
 
 	unregister_reboot_notifier(&timer->reboot_notifier);
+	clk_disable_unprepare(timer->clk);
 
 	return 0;
 }
-- 
2.23.0

