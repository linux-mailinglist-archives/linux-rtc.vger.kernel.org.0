Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD2DA3542A2
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Apr 2021 16:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235848AbhDEOOU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Apr 2021 10:14:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235763AbhDEOOU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Apr 2021 10:14:20 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 581C6C061756
        for <linux-rtc@vger.kernel.org>; Mon,  5 Apr 2021 07:14:14 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id c3so11567592qkc.5
        for <linux-rtc@vger.kernel.org>; Mon, 05 Apr 2021 07:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qkYrLuIJtmzdFA+UITP1gB3xB15FAR1oaiWoAmYgfGU=;
        b=P//iaUv8377+FjSXFeotOegZtDT6/8RFkxHO3eZ28KLNBfgFQ3CXJRdsUFMzYHm1Wv
         JcdKoW80ODuieNuApK9qNmsZS+VPOlAMSfIYC/f+miaWwi8tcJYNBhsze+aSIsSIIVRW
         vbAnjNuIcrGPlg1hmC3MQZRRYC/iCzCyL2ihju9bs68BX5W4irJu79VTaSkAV0lgcMnV
         UPQW8PLjOb2dn0xjwWOI+6apue9IY7/EXI3I0sRT7j5ITDhlqwJqgOi8Nj5za3R9u678
         WB/PugEnX80ILl92m6oLKZwLY/b5LLHl2v1Kd4YycKCIc8bV5Di1ty2jsY0jfgKPecJ1
         Pp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qkYrLuIJtmzdFA+UITP1gB3xB15FAR1oaiWoAmYgfGU=;
        b=Q2tvRKr4HEHcUCbrIpu0XWJ8NNlGjWhpYAMYKptkxK/U4Jk7r41ZKiEo2Z//k6XQgy
         oVU1uyH6XxKMA0n6nQ6D6nEkvjZpvitBglmzHko7vYE4uUAEBxIcOM1/fUrjzsW7m8PL
         zYEOgJlAhuuRd3bM/UPNJ9UB8lOWSkeDgO5fJfPhSMZmZVJo183B/VMKvx4N/nNVtmGK
         chpAh97H6cRWWttW1iTlUvMB7T/eeZowBZZqDa8Vd8yOZkz7RtXCIw/MhlYsuRP1JV21
         Wesy6UaFoC8CJvXFKwmf5GAQVQUNdinHNbE6Mdq3DLqNeKec/9QHPLIc4Cg8fFqIw/+p
         5y9A==
X-Gm-Message-State: AOAM530KUjoyZu0gc2t+GuFMz1RKiRZ3F3IZ4ZGba0u3VFmjSpKRohi4
        UfJsKoM/PmGQKUaQjnbljKPPA1v9LI2REg==
X-Google-Smtp-Source: ABdhPJw07B8DzMJ0S7PPUKxcPNJ322v6YHsOpPr1IoKSsnvcHRk5I58+9xt+96jNWTb/DsDZrwLr1w==
X-Received: by 2002:a05:620a:13db:: with SMTP id g27mr25146599qkl.367.1617632053661;
        Mon, 05 Apr 2021 07:14:13 -0700 (PDT)
Received: from shaak.xiphos.ca (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id h14sm11970633qtx.64.2021.04.05.07.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:14:12 -0700 (PDT)
From:   Liam Beguin <liambeguin@gmail.com>
To:     liambeguin@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, panfilov.artyom@gmail.com
Cc:     linux-rtc@vger.kernel.org
Subject: [PATCH v1 1/4] rtc: ab-eoz9: make use of regmap local variable
Date:   Mon,  5 Apr 2021 10:13:31 -0400
Message-Id: <20210405141334.3884528-2-liambeguin@gmail.com>
X-Mailer: git-send-email 2.30.1.489.g328c10930387
In-Reply-To: <20210405141334.3884528-1-liambeguin@gmail.com>
References: <20210405141334.3884528-1-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Liam Beguin <lvb@xiphos.com>

Make use of the regmap local variable to shorten long lines.

Signed-off-by: Liam Beguin <lvb@xiphos.com>
---
 drivers/rtc/rtc-ab-eoz9.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
index b20d8f26dcdb..2568984fb8d3 100644
--- a/drivers/rtc/rtc-ab-eoz9.c
+++ b/drivers/rtc/rtc-ab-eoz9.c
@@ -124,6 +124,7 @@ static int abeoz9_reset_validity(struct regmap *regmap)
 static int abeoz9_rtc_get_time(struct device *dev, struct rtc_time *tm)
 {
 	struct abeoz9_rtc_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 	u8 regs[ABEOZ9_SEC_LEN];
 	int ret;
 
@@ -131,9 +132,7 @@ static int abeoz9_rtc_get_time(struct device *dev, struct rtc_time *tm)
 	if (ret)
 		return ret;
 
-	ret = regmap_bulk_read(data->regmap, ABEOZ9_REG_SEC,
-			       regs,
-			       sizeof(regs));
+	ret = regmap_bulk_read(regmap, ABEOZ9_REG_SEC, regs, sizeof(regs));
 	if (ret) {
 		dev_err(dev, "reading RTC time failed (%d)\n", ret);
 		return ret;
@@ -174,10 +173,7 @@ static int abeoz9_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	regs[ABEOZ9_REG_MONTHS - ABEOZ9_REG_SEC] = bin2bcd(tm->tm_mon + 1);
 	regs[ABEOZ9_REG_YEARS - ABEOZ9_REG_SEC] = bin2bcd(tm->tm_year - 100);
 
-	ret = regmap_bulk_write(data->regmap, ABEOZ9_REG_SEC,
-				regs,
-				sizeof(regs));
-
+	ret = regmap_bulk_write(regmap, ABEOZ9_REG_SEC, regs, sizeof(regs));
 	if (ret) {
 		dev_err(dev, "set RTC time failed (%d)\n", ret);
 		return ret;
-- 
2.30.1.489.g328c10930387

