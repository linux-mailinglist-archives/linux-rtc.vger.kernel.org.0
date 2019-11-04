Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38732EE43D
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2019 16:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729401AbfKDPue (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 4 Nov 2019 10:50:34 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41270 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbfKDPud (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 4 Nov 2019 10:50:33 -0500
Received: by mail-wr1-f67.google.com with SMTP id p4so17649314wrm.8;
        Mon, 04 Nov 2019 07:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=clU1bKHT6brcxpybdIWScjXO4jR8ML9CYkdJSkfKRuE=;
        b=Yw9n7TwiEYa9fp+A5e/RLb4byJXfyYLBxxAel9gksuFgNn5rPRTZQAALS6u8CTiY3p
         CNxhKo/8GnZzIJawDAPcgoiBSmqrksuYcM27uS5yGZiTDFT2BzpK1LutVBMfLvLA1+s6
         npojTeyELwkekqwg2YHynh7GiuNCKh9TL+Po8U5XLY/7hTORMzvGkFNXIAto1u698GeJ
         vDt/YgSG8zbIF1Cx5iIXusAfukLzSl8L/2i1QmIBWXyjIFRA5pMc81b9YgfJ3q0c1OyL
         N1011f0bgmrFW5HLSyfi8tfvczCcS6Od+ruyvM85nEUNOI8wL0+T/iomvnF48Oqq8xav
         qevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=clU1bKHT6brcxpybdIWScjXO4jR8ML9CYkdJSkfKRuE=;
        b=F27gpUw1QtU6xjS54t+lLyx0rbrqIzmnzRWH5tXs1rfVgSHym+CQLaE8gkKLLyYhs1
         y+J6g9XmXNIVZiP8Lnm7GbHbAF8LUJXZvHWPz38SPJF6SCGjS9oXbI53ESrBV9apmSsc
         ZI1UqUDOlBQ4VA7MBnhwPB+KYqeVaENoFSPo6J0FJL0uIn7RaTIVxbPd9SmBuABkZDpH
         N8M7IQ7hUvIBGcgAQpAXZQWV9ULrT0yaKZL2fZEWa+IExpA0hsFwnD5cGxmgDtLBTdA/
         mzsT/XCBxiQP3n30wQ35f1fz44mssd5mvNXALXDRn8k4tLkh6mWcQQJ521XJ5IU1B3N7
         b3eA==
X-Gm-Message-State: APjAAAXrAl/qUfPwVGO6dICWlvDYiqlid4SROXBRa/+GIrOBsU5AK3S9
        XbTqKf+hbnGPl2+m8P6IADw=
X-Google-Smtp-Source: APXvYqwBJhMarOb9DuoSeD9Eo8Lc26NxpepeppxQG4OIxoUZW28lf16IvA+EqxulYRqvcR8eaU6MUw==
X-Received: by 2002:adf:ab4c:: with SMTP id r12mr20114632wrc.3.1572882631918;
        Mon, 04 Nov 2019 07:50:31 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id k4sm19569710wmk.26.2019.11.04.07.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 07:50:31 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] rtc: brcmstb-waketimer: add missed clk_disable_unprepare
Date:   Mon,  4 Nov 2019 23:50:19 +0800
Message-Id: <20191104155019.9053-1-hslester96@gmail.com>
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

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/rtc/rtc-brcmstb-waketimer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-brcmstb-waketimer.c b/drivers/rtc/rtc-brcmstb-waketimer.c
index 3e9800f9878a..06b2bdde584a 100644
--- a/drivers/rtc/rtc-brcmstb-waketimer.c
+++ b/drivers/rtc/rtc-brcmstb-waketimer.c
@@ -277,6 +277,8 @@ static int brcmstb_waketmr_remove(struct platform_device *pdev)
 	struct brcmstb_waketmr *timer = dev_get_drvdata(&pdev->dev);
 
 	unregister_reboot_notifier(&timer->reboot_notifier);
+	if (timer->clk)
+		clk_disable_unprepare(timer->clk);
 
 	return 0;
 }
-- 
2.23.0

