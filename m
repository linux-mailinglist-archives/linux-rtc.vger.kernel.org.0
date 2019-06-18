Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A03149810
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2019 06:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbfFREYU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 18 Jun 2019 00:24:20 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39110 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfFREYU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 18 Jun 2019 00:24:20 -0400
Received: by mail-pg1-f195.google.com with SMTP id 196so6942713pgc.6;
        Mon, 17 Jun 2019 21:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=trghcI0kguPxHRpabSOQXTiUe9keIUZtHbrrlskJREE=;
        b=QZsOIpMwAWIJq5VpLMmmI1bWXvKwULYlZMhJWReOjHQmCGZ9hGcn5ClX1vBs8CLQTa
         4b/o2zbfbxHhOMJqgLZhTGhkOclpEfhy3kxhnk5xci5vHACSXJT6UnnlgbxenWjNxiXq
         agNhYS4vPV3NWf1HCxarmrK1v0VWA0F2BNFUsqqOX8IUxCmgRB1VRSA917LEfdDY4lvB
         cn5/1tofIDwq/V4awplFO+W2wqqEqiThup2pkpedzORIsJXdJ3uwzINQz9aMGzVdoxyR
         PZdwmiCHeGBEv+wh7kEsFloqILHTod0PxMKYJVXtN/pszSKrn7l55CtYo/lOZaglo+Nw
         wPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=trghcI0kguPxHRpabSOQXTiUe9keIUZtHbrrlskJREE=;
        b=LUoJ1Ho0Mj2xwC5Utvg2m4ztx22EoAxrWB9/w9qzqzVXg8ghZ4dSZyjYmpjXvlSW6q
         PvylOLPebE/5G3MczJDCtbeiSyxMj+0zkN5lmyi70dRZfly2JbOwktb8ixp75eVh7vBE
         /FaBNPH7OowBxJ4AWpQhU51kDdsPl3p21IjvKo0BHNbhI1h4AbJp+0vDG6+0/olHwN9M
         UKybyuYl0Y/pAKivyd30nIwf0sKAhW6geu0taRIRYCbZnchnYICIVqpAPoA7pWMSurfi
         zg7WITqvxjrOePArjwDvdbIN7ANUbnvdMfVTsuO5tmAv7AyQohlpP479Q+XKYWtaNWE5
         iTrw==
X-Gm-Message-State: APjAAAW5XhWNrfHPfEdhCzLKUQDc5uqudHrzllJ3qR6gs9Q0kYNhO5QP
        dtJQxxHN0BMHAhiYR3xTsNw=
X-Google-Smtp-Source: APXvYqwRp5xyCS/EImIFkluSBGJv/D20lGoFSqd2f9rny8SdEJweAgQ9jtQ0JS2KCmoTBozzEUyUhw==
X-Received: by 2002:a62:1d8f:: with SMTP id d137mr34900719pfd.207.1560831859206;
        Mon, 17 Jun 2019 21:24:19 -0700 (PDT)
Received: from localhost.localdomain ([112.196.181.128])
        by smtp.googlemail.com with ESMTPSA id z20sm17754279pfk.72.2019.06.17.21.24.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 21:24:18 -0700 (PDT)
From:   Puranjay Mohan <puranjay12@gmail.com>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Puranjay Mohan <puranjay12@gmail.com>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH RESEND] rtc: Change type of 'count' from int to u64
Date:   Tue, 18 Jun 2019 09:53:51 +0530
Message-Id: <20190618042351.9692-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Callers of hrtimer_forward_now() should save the return value in u64.
function rtc_pie_update_irq() stores it in variable 'count' of type int
change type of count from unsigned long to u64 to solve the issue.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
RESEND - Added required mailing lists in CC

 drivers/rtc/interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 4124f4dd376b..72b7ddc43116 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -633,7 +633,7 @@ enum hrtimer_restart rtc_pie_update_irq(struct hrtimer *timer)
 {
 	struct rtc_device *rtc;
 	ktime_t period;
-	int count;
+	u64 count;
 
 	rtc = container_of(timer, struct rtc_device, pie_timer);
 
-- 
2.21.0

