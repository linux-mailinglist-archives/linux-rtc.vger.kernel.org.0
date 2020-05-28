Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625BF1E5D4A
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2020 12:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387969AbgE1KkR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 28 May 2020 06:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387924AbgE1KkL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 28 May 2020 06:40:11 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA070C05BD1E;
        Thu, 28 May 2020 03:40:10 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id r10so13287451pgv.8;
        Thu, 28 May 2020 03:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PccFhNjS4hhr30qgJVviBgbheq+JeXNwdy/AbmdcXhg=;
        b=GJ/O7P976gM9R4fCiCYxrVEz8ja0koSDzYE92U/6XQJLCvTE6/pZyP73revZl0frc/
         tLXaU22Nw3nMpojTGdjGipJ7K8Jo0cSApT9L119zjuduyjbfbGY56IzPjOAt4ATuC8g7
         KvTFXg419z5JXuqS4LHgL4y8vauJU7K93iIhHPEL7eYuP9aHKhsD7+yXHwBfMY5z8Ppr
         D3U6qLKhAVlp3boPM/mrylqkgAl+v+OAHxrgDRykbhP5e+YrpCXxyI6eg7XEfboayHhE
         uaSd7/hvgr6dRW6qDa3mc9Scj5mX4+HxL7YLL85OgmK+Is0H/q954zTaamamBBHj+FSF
         t2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PccFhNjS4hhr30qgJVviBgbheq+JeXNwdy/AbmdcXhg=;
        b=pMZPZ+FnPKYYVyYlzwdWzzS6L5j5B7OlXmKM71LPtqPL4bxiG8d/Sfbdc9DTXGlXQg
         W2XiGAuI1pHR8T+cDN9hqAL7GBSWqu4CJZY+nLiDjDvS5CArjHRPZGfR2WNmwg1sMdO5
         48rEh9zkyUo/QPbp6214+VEcdaMV4EWcJM1BCgu2954n814jufp4V2m0t0Iv99V87FIx
         O3ZuXBlcHsvXIKrDNjXyFnI/4mCxf1J/5PTvXBMK5eywCbaqd3Xn1OldfTSP9DOvV5fC
         +N313r58wdkWFZWerXPJq4lymsxzOostdx97AMCGeaY1Wp28XmqG2rzQ/EKunu8vuFU5
         e73g==
X-Gm-Message-State: AOAM531GJ+AmuaU5knOeoIpPd0YtGqB90yGkcjU/B9/DdbI8Ca2yNNcM
        uYXJs+PgylrszBSFbgt72yqXNQlsi3E=
X-Google-Smtp-Source: ABdhPJyGfKrKva7e96GB3sLA2msk21C5TMjfObeCKF6EFrMIgMQGMwSTLus4hhMyANeb+Jzrjr9jxg==
X-Received: by 2002:a62:6404:: with SMTP id y4mr2354759pfb.64.1590662410555;
        Thu, 28 May 2020 03:40:10 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id mn19sm5115152pjb.8.2020.05.28.03.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 03:40:09 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2] rtc: rv3028: Add missed check for devm_regmap_init_i2c()
Date:   Thu, 28 May 2020 18:39:50 +0800
Message-Id: <20200528103950.912353-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

rv3028_probe() misses a check for devm_regmap_init_i2c().
Add the missed check to fix it.

Fixes: e6e7376cfd7b ("rtc: rv3028: add new driver")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Add fixes tag.

 drivers/rtc/rtc-rv3028.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index a0ddc86c975a..ec84db0b3d7a 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -755,6 +755,8 @@ static int rv3028_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	rv3028->regmap = devm_regmap_init_i2c(client, &regmap_config);
+	if (IS_ERR(rv3028->regmap))
+		return PTR_ERR(rv3028->regmap);
 
 	i2c_set_clientdata(client, rv3028);
 
-- 
2.26.2

