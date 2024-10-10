Return-Path: <linux-rtc+bounces-2140-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B874998100
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 10:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01AC61F27444
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 08:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654791C9DFA;
	Thu, 10 Oct 2024 08:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="K5noJ4U9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10F91CB339
	for <linux-rtc@vger.kernel.org>; Thu, 10 Oct 2024 08:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550200; cv=none; b=TzpH7V/txCS0u/Ybad7AqgrSvsS12pFY0fFi/pNs50hjkMVJnwxZhXuMWxYf+K4+KANQJroTCeSJuxV8aD11wi9mQShgM/NiO21CU4HhgqURTwRpOPH36HowkPqdqhMl3u17w1+IijYTqoUkwpE4iyMb/P3L3u7xY9oT9q13KGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550200; c=relaxed/simple;
	bh=slfg0DaSFkeDNU8LXiDboSJWkZ2DPcXTnA/669OqVvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fd05esBbSBbveTq10uGlC3us/F9g11IyrMdME/f9HBcMPTJ0hv60aoRyGnITfwy9jazex5/1G/nre4t0ZaJhUiE53S5N82HoeLoHGaeBWGSdt1xbOe5+0vRZq7IrFP3Rpp4O2O8Yf++t3bU5mSzNQbOV8nA5Uq2uKR4g5r1v9zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=K5noJ4U9; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71def8abc2fso558816b3a.1
        for <linux-rtc@vger.kernel.org>; Thu, 10 Oct 2024 01:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1728550198; x=1729154998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwxiOuZiW0MilqUpF34t1/azCDVQlBsGQJ9xFA4qInE=;
        b=K5noJ4U9NLsXiDJkYQfj1BaNLsSG3pjhFLrl5Qg1QWr6f9V2+9Rj8EABhLnqsGCA1A
         NpXo8kjr6U6H329DEULz+x1aZAWjb1AlxoyQUDEiTdlfArDuJRO6HBnc5UYzgccS3LeN
         NaI7FTGXVxXnMAhxnxVM5upRhxIyiqTHH5F6DqLuuGCq9pFYfglT7+JE7m3jOqBR1EjB
         a3ag+6my+9iW2Z2Cq3D+UmpjyN1YKrxVphglq008BoeR8IDNNY0znU0OH6BWLnznQ44a
         y/KHtInaWe0VYD5dSGo3DBWER2LdxPq4xbY326tO6JOMz5IT9y+fKd7lZjn8JmcI1MLS
         rWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550198; x=1729154998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwxiOuZiW0MilqUpF34t1/azCDVQlBsGQJ9xFA4qInE=;
        b=DUDiWAmfzJVNyqV2OFrxKTUcTl6odFuQKui+hqipkLwDQ9Yce/HA2Dgd5+0ovdE/0X
         qLq2lCFQfR1m5FsEE9WA9WDIoMxS1UX58mhY/sIZpkEhKmJ9AgQTC2dHh6defQbkSFzL
         4NEMWrvTfT3yYMzX+vxX/C+7j/kSMyHaFogHYUNE373YCq432uKw5MkZsGDTHFRCvyc8
         49AM/ZfW0jiykUHjLwaSnnpu+FxMtz9J0/wN2D5Q0hWjn1fhx/Q1SLKjGL5ui2RLJBYk
         sEne5V5V9iYny+D5c3wEzH+mXHM73BhYH9jq333fNDIopMICvBpRiL1Zd1RN3q4rdQqo
         ze5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+/NE85ZixzkqpiDH56FOssozJOXOjPXntXuAUn17PgTVNhilyRtH6d9KH/AcYTyzoDpMa1n+9UxM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2UPeEzO1IMimpVWz9SwcZMdIuMCEhvBeIRRW72ELbSTO7y0Rj
	x1agBBpZoF9e9YNxfVAfEJWQg89XNQLshcjxPsxn14NR6SFttYMJrpvQoIIX
X-Google-Smtp-Source: AGHT+IH/qi6Z1/mn39Abax4Q4ZNavXi/nnUr5sovML30PnGihYYYHuLpc8Db+ca6no7uTRFhQBt1KQ==
X-Received: by 2002:a05:6a21:478b:b0:1d7:109a:720f with SMTP id adf61e73a8af0-1d8a3bc3121mr7592460637.2.1728550198000;
        Thu, 10 Oct 2024 01:49:58 -0700 (PDT)
Received: from localhost ([2405:6581:5360:1800:beed:8ae1:b5d8:8b56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8badbf86sm5768295ad.28.2024.10.10.01.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:49:57 -0700 (PDT)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH 1/2] rtc: pcf8563: Sort headers alphabetically
Date: Thu, 10 Oct 2024 17:49:48 +0900
Message-ID: <20241010084949.3351182-2-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241010084949.3351182-1-iwamatsu@nigauri.org>
References: <20241010084949.3351182-1-iwamatsu@nigauri.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort headers in alphabetical order.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-pcf8563.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 647d52f1f5c5e8..4c375e8694da4e 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -11,14 +11,14 @@
  * https://www.nxp.com/docs/en/data-sheet/PCF8563.pdf
  */
 
+#include <linux/bcd.h>
 #include <linux/clk-provider.h>
+#include <linux/err.h>
 #include <linux/i2c.h>
-#include <linux/bcd.h>
-#include <linux/rtc.h>
-#include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/err.h>
+#include <linux/rtc.h>
+#include <linux/slab.h>
 
 #define PCF8563_REG_ST1		0x00 /* status */
 #define PCF8563_REG_ST2		0x01
-- 
2.45.2


