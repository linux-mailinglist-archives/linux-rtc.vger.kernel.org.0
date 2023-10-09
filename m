Return-Path: <linux-rtc+bounces-60-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F657BE71D
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 18:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D53E2815FC
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Oct 2023 16:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0EA1D535;
	Mon,  9 Oct 2023 16:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="MCdfFnbR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E87E1A28A
	for <linux-rtc@vger.kernel.org>; Mon,  9 Oct 2023 16:57:53 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD88C9D
	for <linux-rtc@vger.kernel.org>; Mon,  9 Oct 2023 09:57:51 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-313e742a787so2836473f8f.1
        for <linux-rtc@vger.kernel.org>; Mon, 09 Oct 2023 09:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1696870670; x=1697475470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Czavm+hA74AE3KkSlm2hXBEMwAG3Dh3p+tVw2heAB7A=;
        b=MCdfFnbRJW1WAaKwEDUwiHSCpY562wWuKtkxn4NY+1haJGcoYfPPVi1Zy39PxNOJ7C
         ZIUFW+etlhHrfUNjVtyh6xIhdf0IJLjA6HPu0/wLTVMyQhcmgilBs0hn8GRb6TPt7QWM
         ilYe4fObxWLV3dXIT5XJOG35AgwwMTOPkNHvlZFPsBbHpNpbZsv9p7Q7Y+wv23qWcVJW
         OsYV1NNiJRjXsXSEfihdZoxL2aFa2KWVxZYGq0snyIAhlMZiUmIbnv5gi+FjofVCzE+O
         VK+uqe2ahdGNTnyftZSfTSS8JUAOOZDYPK9rzbGS+ThhViz/fbmI0WKqQ60mZlAGzG94
         VO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696870670; x=1697475470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Czavm+hA74AE3KkSlm2hXBEMwAG3Dh3p+tVw2heAB7A=;
        b=c1ewnZBKEf+/SSjekBqfgp2i1/EPSQATST5SKLLHqeAUmC46i8o9v2ZD5Q78wlAL6B
         1ao3nI5KMrAuJtZXHUVhXYT4DH4FopwIAtWCRpxxr9KcYeBNiP2B18sZgzLF6/6kdpEq
         2doSz+pk+Ca8F3aGFVAba5yW7WQKXecxrdPl0uXjKYF18z/sevjJ/4rs8kn0o37wIhNb
         dvVBgXfo/6usoYEJn8fPhhHHEyK2bjNhp89j0ImV0BKEtkwbKoRAhx4TYOGT+Xg10Fn/
         TDleVIc7oPyLoVESSZLqLZVvEuObzeulHk85sXZV9kRO7F+F6f3zcN4AqCel1DqVCHEy
         3fyw==
X-Gm-Message-State: AOJu0YywSuCqmzlolhGF2bCDfEoPsfpKf8gVYpAYWoHekc3suZK7I3LL
	fXA+18kMQ5hnCRQTZ4RTBKC96Q==
X-Google-Smtp-Source: AGHT+IFMPqlr6PBRJnc3l9ctF3+CO5b90t85bTkLlY255sMAJWBYlApRgM4RXBucCwVJblJI0p/izg==
X-Received: by 2002:a5d:4dcb:0:b0:319:6997:9432 with SMTP id f11-20020a5d4dcb000000b0031969979432mr11098692wru.1.1696870670148;
        Mon, 09 Oct 2023 09:57:50 -0700 (PDT)
Received: from heron.intern.cm-ag (p200300dc6f49a600529a4cfffe3dd983.dip0.t-ipconnect.de. [2003:dc:6f49:a600:529a:4cff:fe3d:d983])
        by smtp.gmail.com with ESMTPSA id d9-20020adff2c9000000b00324887a13f7sm10199828wrp.0.2023.10.09.09.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:57:49 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Max Kellermann <max.kellermann@ionos.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] drivers/rtc/sysfs: move code to count_attribute_groups()
Date: Mon,  9 Oct 2023 18:57:34 +0200
Message-Id: <20231009165741.746184-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This avoids overloading the "groups" variable for three different
purposes

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 drivers/rtc/sysfs.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/sysfs.c b/drivers/rtc/sysfs.c
index e3062c4d3f2c..617933d52324 100644
--- a/drivers/rtc/sysfs.c
+++ b/drivers/rtc/sysfs.c
@@ -313,21 +313,25 @@ const struct attribute_group **rtc_get_dev_attribute_groups(void)
 	return rtc_attr_groups;
 }
 
+static size_t count_attribute_groups(const struct attribute_group *const*groups)
+{
+	size_t count = 0;
+
+	for (; *groups; ++groups)
+		++count;
+	return count;
+}
+
 int rtc_add_groups(struct rtc_device *rtc, const struct attribute_group **grps)
 {
-	size_t old_cnt = 0, add_cnt = 0, new_cnt;
+	size_t old_cnt, add_cnt, new_cnt;
 	const struct attribute_group **groups, **old;
 
 	if (!grps)
 		return -EINVAL;
 
-	groups = rtc->dev.groups;
-	if (groups)
-		for (; *groups; groups++)
-			old_cnt++;
-
-	for (groups = grps; *groups; groups++)
-		add_cnt++;
+	old_cnt = rtc->dev.groups ? count_attribute_groups(rtc->dev.groups) : 0;
+	add_cnt = count_attribute_groups(grps);
 
 	new_cnt = old_cnt + add_cnt + 1;
 	groups = devm_kcalloc(&rtc->dev, new_cnt, sizeof(*groups), GFP_KERNEL);
-- 
2.39.2


