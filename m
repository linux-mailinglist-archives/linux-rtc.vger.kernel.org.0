Return-Path: <linux-rtc+bounces-49-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 615C67BB3CD
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Oct 2023 11:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7E27282125
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Oct 2023 09:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B51C11714;
	Fri,  6 Oct 2023 09:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eoAlB5AE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B07A79C0
	for <linux-rtc@vger.kernel.org>; Fri,  6 Oct 2023 09:06:00 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B5683;
	Fri,  6 Oct 2023 02:05:58 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9b29186e20aso328541166b.2;
        Fri, 06 Oct 2023 02:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696583157; x=1697187957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K4HOKOpHHPlHT6d0maywPvHxqU0NRGC5LpozW09vLNA=;
        b=eoAlB5AEPTIAp458718A2eTT6rq+NhLuK7B/w/JYo2F84yhZETyrDATwtxETxi2ADO
         RtHtXZhrCsFS873GNWludaqOC7Ya0WYZInO2HEAUimJW72qW87/L9+HqaLMSUbF0B0hB
         QgovWZQCYmZ7NvkL9jaPRfwBREGh4tl5LGCo3DZMgnzmroqW9sFizis5R9bsOI/6+1+p
         oeooJ2GPx0yNUi+DNK6JglC6vayeMbQzb5a9jJPR9qUw8llNOEShk02KTr3e5Q5peTCy
         rsjtmCyEQBf+n8m9we9kVvk6XsOoHfGVHs4PPGwWeLpCZUAJH52dYCeUxrhKSeGCcFX0
         QUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696583157; x=1697187957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4HOKOpHHPlHT6d0maywPvHxqU0NRGC5LpozW09vLNA=;
        b=IfZNJ1Yf7byLChVVfzLjwjvmZrgfURoXifi+unO+XyMN3MegunztPVJP8q95wD+MFS
         S2Ekd/pKJe/pZZS0V8d/eAZ0sj5o5VEUI9L/8h+9F3CTZyA9oBbsF7Z9chEoTlKKfSDt
         BHj5uFP+NDvK/xUVBe/JE39CZnYBnVFlUiKeIkpB7b6Jg3J08qTgW7HdGO9oYwaxEk8Z
         ZLerE9AScVR9GvsZoqEAVfdjH5Mrx6sgDtAdWX2pw9E30qNPHhWcni/ILvdh1wWkiwoo
         TA48iX6ZGwzayuglYSGc8OlQ5B1hJY7cHNzrB9MgsjpgKdFwKTWH8v3InywtJ4XqMQF5
         OKTw==
X-Gm-Message-State: AOJu0Yz1VYwugyU713e4RpT15IVsCg5EkQ7ZoWLiYEA+1GqF1wPD0tgm
	/XZQ+gwqbnHkgZkLwhgH9HANNT13h3a9hdHrlXg=
X-Google-Smtp-Source: AGHT+IFTJ6rcB8I7EMJ9//iL8v3mQ1Z6mTmHYep+kIZhraf0HNeWOZ+eLaVLE2kaKvyRE3E39yRd1Q==
X-Received: by 2002:a17:907:78d1:b0:9b3:264:446 with SMTP id kv17-20020a17090778d100b009b302640446mr6986948ejc.0.1696583156474;
        Fri, 06 Oct 2023 02:05:56 -0700 (PDT)
Received: from mkorotkov.rasu.local ([212.22.67.162])
        by smtp.gmail.com with ESMTPSA id o6-20020a17090611c600b009ad875d12d7sm2509128eja.210.2023.10.06.02.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 02:05:56 -0700 (PDT)
From: Maxim Korotkov <korotkov.maxim.s@gmail.com>
To: Alessandro Zummo <a.zummo@towertech.it>
Cc: Maxim Korotkov <korotkov.maxim.s@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] rtc: efi: fixed typo in efi_procfs()
Date: Fri,  6 Oct 2023 12:04:44 +0300
Message-Id: <20231006090444.306729-1-korotkov.maxim.s@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

After the first check of the value of the "eft" variable
it does not change, it is obvious that a copy-paste
error was made here and the value of variable "alm"
should be checked here.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 101ca8d05913 ("rtc: efi: Enable SET/GET WAKEUP services as optional")
Signed-off-by: Maxim Korotkov <korotkov.maxim.s@gmail.com>
---
 drivers/rtc/rtc-efi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-efi.c b/drivers/rtc/rtc-efi.c
index dc6b0f4a54e2..fa8bf82df948 100644
--- a/drivers/rtc/rtc-efi.c
+++ b/drivers/rtc/rtc-efi.c
@@ -227,7 +227,7 @@ static int efi_procfs(struct device *dev, struct seq_file *seq)
 			   enabled == 1 ? "yes" : "no",
 			   pending == 1 ? "yes" : "no");
 
-		if (eft.timezone == EFI_UNSPECIFIED_TIMEZONE)
+		if (alm.timezone == EFI_UNSPECIFIED_TIMEZONE)
 			seq_puts(seq, "Timezone\t: unspecified\n");
 		else
 			/* XXX fixme: convert to string? */
-- 
2.34.1


