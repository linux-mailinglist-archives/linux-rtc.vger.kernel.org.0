Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37A732691A1
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Sep 2020 18:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgINQdZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Sep 2020 12:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgINPq2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 14 Sep 2020 11:46:28 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A183C061353
        for <linux-rtc@vger.kernel.org>; Mon, 14 Sep 2020 08:46:08 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k15so138776wrn.10
        for <linux-rtc@vger.kernel.org>; Mon, 14 Sep 2020 08:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AzEpLYmbKmiQH23cwCt0zuNgJwoYOVOuAiMHB8Xci9c=;
        b=fGe90BwUL9T/sVeFm8B8qjEDsbV7N1Fc0qp1Yn5hDUJkwKQIS4qyv0txAkGyG02TwZ
         S/EOD9gJYHnj5vGJISv78CjFbkvzKYJNm1VNxL0rxnlQNfqI2SEsCj7+cQaE4vKG1dZm
         YRwZRKUJj0vx+U88dcWCJl8dv6MDJ+ygddYPQjUAXHUAymD4whxbFh+JbnEjUd84dDm2
         FAFNKRhEVkRDw3d7N7iVmVwKFu7mq3MLMeBOM8vj4YEq+V5ITixlz0ir3No1MUhgPMhO
         gWGUrKfEzI3nRFDtUsdF7MJ8JbF3aAw/YYcRfIZLvxLqyHnWyMRzrctjjX0kBJXEG5Ey
         riVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AzEpLYmbKmiQH23cwCt0zuNgJwoYOVOuAiMHB8Xci9c=;
        b=UwgdL8WOhgkjU572sNvFIZ0Kz20THJ/TIw9USSpD3FRjyryxa75tUnQjtzHz0DcdNe
         VLLwqIgJgDx83cUOiIffoPYR2DzKcZ2nUsME4athKbkwzWLUwhfJL7cZWj3tL+R3GyvE
         Md96Tm//+DZIRTFR4o4CJH2q/u8rry3jT8LaVLkZ87cfzLnvaTeQkCFhXicauoYy5Nwl
         Xs6pTnzpZXt9UyLHM0y0EeCZM1qYqqMmwPTnaYPMHciwH3M8Div9nOrMbDPtcf4/sTHT
         EpD86NCG6kGQfmgAwWwccOR22yETSen+oRk5PK1OROzU5q90jNOdTSuwKohDoPCacU5s
         IbZQ==
X-Gm-Message-State: AOAM530FjNIH2BKDTWTsfohlcztvs2bDaHUUKPKzNqYzIToSmrKigJsC
        O46qDz3/Eb7rP+ym3HsPEo6DHgsNxoZEcw==
X-Google-Smtp-Source: ABdhPJxvTqzsOYQKy+ApiwvZXKRhb5S5X2RREAKmVMVu9Qx3kT15m1tgR+R1ozwQL9VQTHk88NYFww==
X-Received: by 2002:a05:6000:83:: with SMTP id m3mr16497440wrx.165.1600098367011;
        Mon, 14 Sep 2020 08:46:07 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id l19sm19510448wmi.8.2020.09.14.08.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 08:46:06 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 03/14] rtc: rx8010: remove unnecessary brackets
Date:   Mon, 14 Sep 2020 17:45:50 +0200
Message-Id: <20200914154601.32245-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200914154601.32245-1-brgl@bgdev.pl>
References: <20200914154601.32245-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Remove brackets wherever they guard a single line.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index c6797ec0aba1..79a3d90d2c43 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -181,9 +181,8 @@ static int rx8010_set_time(struct device *dev, struct rtc_time *dt)
 		return ret;
 
 	flagreg = i2c_smbus_read_byte_data(rx8010->client, RX8010_FLAG);
-	if (flagreg < 0) {
+	if (flagreg < 0)
 		return flagreg;
-	}
 
 	if (flagreg & RX8010_FLAG_VLF)
 		ret = i2c_smbus_write_byte_data(rx8010->client, RX8010_FLAG,
@@ -284,17 +283,15 @@ static int rx8010_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	int err;
 
 	flagreg = i2c_smbus_read_byte_data(client, RX8010_FLAG);
-	if (flagreg < 0) {
+	if (flagreg < 0)
 		return flagreg;
-	}
 
 	if (rx8010->ctrlreg & (RX8010_CTRL_AIE | RX8010_CTRL_UIE)) {
 		rx8010->ctrlreg &= ~(RX8010_CTRL_AIE | RX8010_CTRL_UIE);
 		err = i2c_smbus_write_byte_data(rx8010->client, RX8010_CTRL,
 						rx8010->ctrlreg);
-		if (err < 0) {
+		if (err < 0)
 			return err;
-		}
 	}
 
 	flagreg &= ~RX8010_FLAG_AF;
-- 
2.26.1

