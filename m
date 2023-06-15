Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6240B7315EC
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Jun 2023 12:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343832AbjFOK65 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Jun 2023 06:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343770AbjFOK6y (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 15 Jun 2023 06:58:54 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9061A272D
        for <linux-rtc@vger.kernel.org>; Thu, 15 Jun 2023 03:58:44 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f8467e39cfso398840e87.3
        for <linux-rtc@vger.kernel.org>; Thu, 15 Jun 2023 03:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1686826723; x=1689418723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gv+DyaZll/H2jD9ow4C+es+DNFI9kuFxb3UaUHDFHqk=;
        b=Mb+vso8FaqEEofawsYkCeO6DcWi2o/+zW8gnJATEZQOM4QaWY0QPvGxuwLl7IJogHB
         dxeDv8yKMU27OtF5I5Mqlk/X3lbiRg0CZ75rF51wFgaN2G1UjUmiO9BkQ3TuKjnMNJ6T
         kUrCQabCoKJ8kJXxwDkmuwQJZhNOaEqoRjsJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686826723; x=1689418723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gv+DyaZll/H2jD9ow4C+es+DNFI9kuFxb3UaUHDFHqk=;
        b=DdJSu0b42+6O1b/e6FpTjSf6vM910kEtMXcSWi9Q8U7D8yPlJwKiEZFiUdE7bbULiz
         bUVqZvmyqsQSTso5oA8svTths//tp1EPcFFiGzxWz+9zYEb0C7Tx5KU3Pj0EdiYMzFWs
         WdXBNolfoq/57XkyFCfKjSWHW5h4UyKjtiYv6E/hz9ogsMtd2TnkI6hHRcT6S/h8r3tk
         RHkU9ArDvmiJedrEwJPqWkTEcMq3M+uoeT1BAVCsfQL1lcyBfnJPXYHPtI4AGSVGCU4v
         dieL57+jKHn5l42WTdOd50TY4f7H0SL3ySOqe9ipKv7jKYZuF8fyhyVf9jj3XjvMcb2I
         oRAw==
X-Gm-Message-State: AC+VfDy0sXSgjsNLvKr2QbgPGYUFWsB1p0vO2ii9m0QxlP9VFx+X+XZQ
        1ReVWLK99yN8IiZQF79MgwdX8w==
X-Google-Smtp-Source: ACHHUZ55S44mbroI4h4dOvkl5CJL0C/g7l1shWyyYYaWVWNVM1qxhxYMPsD8IgVniWLYd4y5+ukC6Q==
X-Received: by 2002:a19:9150:0:b0:4f8:48f3:f08 with SMTP id y16-20020a199150000000b004f848f30f08mr12996lfj.21.1686826722859;
        Thu, 15 Jun 2023 03:58:42 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id h7-20020ac25967000000b004f13f4ec267sm165364lfp.186.2023.06.15.03.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 03:58:40 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/8] rtc: isl12022: implement RTC_VL_READ ioctl
Date:   Thu, 15 Jun 2023 12:58:23 +0200
Message-Id: <20230615105826.411953-6-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230615105826.411953-1-linux@rasmusvillemoes.dk>
References: <20230612113059.247275-1-linux@rasmusvillemoes.dk>
 <20230615105826.411953-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hook up support for reading the values of the SR_LBAT85 and SR_LBAT75
bits. Translate the former to "battery low", and the latter to
"battery empty or not-present".

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/rtc/rtc-isl12022.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index 6a757f0a4736..a48456abdcb9 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -204,7 +204,34 @@ static int isl12022_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	return regmap_bulk_write(regmap, ISL12022_REG_SC, buf, sizeof(buf));
 }
 
+static int isl12022_rtc_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
+{
+	struct regmap *regmap = dev_get_drvdata(dev);
+	u32 user, val;
+	int ret;
+
+	switch (cmd) {
+	case RTC_VL_READ:
+		ret = regmap_read(regmap, ISL12022_REG_SR, &val);
+		if (ret)
+			return ret;
+
+		user = 0;
+		if (val & ISL12022_SR_LBAT85)
+			user |= RTC_VL_BACKUP_LOW;
+
+		if (val & ISL12022_SR_LBAT75)
+			user |= RTC_VL_BACKUP_EMPTY;
+
+		return put_user(user, (u32 __user *)arg);
+
+	default:
+		return -ENOIOCTLCMD;
+	}
+}
+
 static const struct rtc_class_ops isl12022_rtc_ops = {
+	.ioctl		= isl12022_rtc_ioctl,
 	.read_time	= isl12022_rtc_read_time,
 	.set_time	= isl12022_rtc_set_time,
 };
-- 
2.37.2

