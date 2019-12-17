Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68E51122B01
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Dec 2019 13:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbfLQMNH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Dec 2019 07:13:07 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36393 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfLQMNH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Dec 2019 07:13:07 -0500
Received: by mail-pl1-f196.google.com with SMTP id d15so6026556pll.3
        for <linux-rtc@vger.kernel.org>; Tue, 17 Dec 2019 04:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xtf6TDf0EhJluJsyKI3Z1KciiGeWDlBx+jiwe8Ip/s4=;
        b=Bd+5ZdWSGSwX15sonR+H3CXy3/9QfLHN9ogfuA30J5jmgWioF3aAUGfLyf7PL8PNdc
         UC/GSYZdAQkhCkMtpP2UhmIR1uTUm5Y6tmSrMhsI38Gv2AsLgZESF9Rot33rcle0907u
         G16xvNV+/gI6C652RAxhgPDOmDx8Jv/mynRN8GWDSnmf/cVbt+sMAixlDeTgwU1XZeO1
         /mkdRljcOOFzhC4SBD/6+byL8IupzjXkUiVKvXMpPMFb7XtWZenFC/ad6+0R7sPEsRSR
         0HhYoSePQSSZcWPE5D5PpmA6ObGjT2EWvtvMcnW+d8MyCyzqFG9yFQRO7fst4IJbzUYp
         j+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xtf6TDf0EhJluJsyKI3Z1KciiGeWDlBx+jiwe8Ip/s4=;
        b=orM6kljXcOY+UuwPCHjgLkLUVfB5Nwyn3niyoBGZZM1BiVGehsFlyHuM85mSS315Wg
         iJIKAio37IbxZAdW13sUTSIonDsEolT4L7MoO7VTm/YlkVmO6YEASseAoJM4FuOwtlOl
         GLIkTrSd12n//4qxxlOqZHIfHxZqqGivs2dLVCJvv7Ui2DS8Zp6WG6EYiXNyu9oGGvgO
         HKuwQa3x6j8eKvTaiECHG+bw4QmgllGMNAfftTJGpCw4cqANKgBFop+wzWBeYrA4yvRy
         WI14DPaMbM7LyhfognEVHEWcdCZpJpfPMgdfEMebmS1jFbLth+R1BVzXm3a0Y+Z/m2AF
         flLw==
X-Gm-Message-State: APjAAAX+UK1fh9lKWcV6/RsZ7pYD6FSGw67dDTymRZQihGT/RTv4511z
        Sn+HAbW99hI3OxShddwZbu6TOrevAA==
X-Google-Smtp-Source: APXvYqy1SKKNdTGFP8h21HXoriW7JeKu6xtRIxGnIvPFNnfiFurgIb2vQXd5ENHlFpPNJqmHRHp78Q==
X-Received: by 2002:a17:902:8a8d:: with SMTP id p13mr21192697plo.296.1576584786334;
        Tue, 17 Dec 2019 04:13:06 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:49ba:c4f5:5ab9:da22])
        by smtp.gmail.com with ESMTPSA id g17sm27796858pfb.180.2019.12.17.04.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 04:13:05 -0800 (PST)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     linux-rtc@vger.kernel.org
Cc:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Akshay Bhat <akshay.bhat@timesys.com>
Subject: [PATCH] rtc: rx8010: Fix return code for rx8010_probe
Date:   Tue, 17 Dec 2019 21:12:31 +0900
Message-Id: <20191217121231.2698817-2-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191217121231.2698817-1-iwamatsu@nigauri.org>
References: <20191217121231.2698817-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

In the current code, the return value of devm_request_threaded_irq may be
returned. This fixes it.

CC: Alessandro Zummo <a.zummo@towertech.it>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Akshay Bhat <akshay.bhat@timesys.com>
Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-rx8010.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index c5d3ad2163475..5eefb30d0efc9 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -480,7 +480,7 @@ static int rx8010_probe(struct i2c_client *client,
 
 	rx8010->rtc->max_user_freq = 1;
 
-	return err;
+	return 0;
 }
 
 static struct i2c_driver rx8010_driver = {
-- 
2.24.0

