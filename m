Return-Path: <linux-rtc+bounces-2110-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5087993B41
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 01:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79C431C233A2
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2024 23:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D9318C908;
	Mon,  7 Oct 2024 23:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="B0/EKPly"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C893318C00D
	for <linux-rtc@vger.kernel.org>; Mon,  7 Oct 2024 23:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728344215; cv=none; b=V0Z7ESTT24kAJgJOmdcPvLB82F1mESJuKcIp9z/C+k3j+fzHtCs3es6v5xwJHbIE5oA91/zAQmjA8tKdgPt2leVi1A1YW5VUP7dW7pzHbcI1146EszW3+rc8atagYCEp0NAmmJHoo4PFre+vkTTmwFiKOYYLculQ6IfDNn77OHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728344215; c=relaxed/simple;
	bh=PQH80u4PFX9rxrGkb6hXV+uCtwBOPCjXw0gCaRJULNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iuxi2myipzHsMpQMB/dh69kSbK3CtnEzg2y/dB5fJpSGxJy3xhBwWsxLO2pDXVotiIhiazymN8O/fFQSSiVgPcXWHrF/gF2rxTy9ralOX8N/Rb9OD+Y74UUehumPwKH6QiFN+qZzKO54PIL8NM299t2keoOC0zdnCxd4An9vpAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=B0/EKPly; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71df0dbee46so1796122b3a.0
        for <linux-rtc@vger.kernel.org>; Mon, 07 Oct 2024 16:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1728344213; x=1728949013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DEyzLMemmqq/dWbd7xuJOCvbVaFumTMHAO9VHuJszJg=;
        b=B0/EKPlygNC0g8byT3qEqoih3m1zxphIpo4DEKaPZBiuWu1MKOlhay6kDG0vTuKjOK
         4L8zzsb4HtKuMmE4rgPhTSN7vhhtieajH3OAOtoudndgKkPMgWzaUAEh4Qo/RXsFHGkT
         bWc7QElP65TKo7hfKhvUzuiM9kX2CE1HHFR5NCnrERqHvsrm2hhVuMO+lXDMrLs+PQ9L
         eBrDky331Wqvcu48HOdiU+YGz12qrsZZi48ivJF+LuMYfMoL0/fqU+sHykwDg76/BVVz
         76eYFz2wrdjKmXBKyXatyP9rgOpXCXg6LdpQknLd4ph1s42vuxu08SyCSfal+Qp4i5rM
         2Ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728344213; x=1728949013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEyzLMemmqq/dWbd7xuJOCvbVaFumTMHAO9VHuJszJg=;
        b=BEfg65n3G0v3/SSgtfof3lL3Cv4cIHW4sv3kCXSg2597ufrLTpqcGPXffaqN+gFJIR
         fudbyIy0JRzqY77QwGy08Bq7sKVlaLJZXTppV8UJCIim8VrabUoQZ3LNegSmkuTJolG6
         yos+uEoRQ1EA9yqi5ZtrYhZHrx6ZcFBj/KxThdGHL2SvHuyLBIls4f1wdzlXlc7Ks7SM
         Bsud6kP5S6DjJbBc1D+Es+ufTlgdiuCTdksObw4+fhuOmV5IkLpzG0UiUsbNNwppLWri
         B1QwuVM5itNwSj5nFmeMejHF5jYJFBYXS4JQ77dmO5dAGwM5gImN4baLvIjYNCnVWiSf
         +QCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3N2phzU2FeE721WXUUswxnSV+UQ9AwYruu+GMAleT3GwPg+q5v5Qy9dlU8JUa8M14KNk6bj2mM90=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4olHA1V6+9sNkZbS+ItYKlgor89PdahaiZBVdXTQ0U+FlW6jq
	5yNj5QS/KemEU2EuRGp5UsQNuqsFMjdPk/XeQl3GpzQ7GufoCOvIg02+sZEJVM+Y+NcGI7HjTA=
	=
X-Google-Smtp-Source: AGHT+IHGf31XYd45H99S839jS0sgv7aRpe+oG52gA7j9zvRgNAQb26bmDm+0JSgzPF1FVShyapC4gA==
X-Received: by 2002:a05:6a00:1406:b0:71e:69e:596b with SMTP id d2e1a72fcca58-71e069e5bc5mr5786386b3a.17.1728344213023;
        Mon, 07 Oct 2024 16:36:53 -0700 (PDT)
Received: from localhost ([2405:6581:5360:1800:6658:dcfc:245b:dd1e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d6243asm4954286b3a.151.2024.10.07.16.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 16:36:52 -0700 (PDT)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
X-Google-Original-From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: macro@orcam.me.uk,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH v2] rtc: rtc-mc146818-lib: Use is_leap_year instead of calculate leap years
Date: Tue,  8 Oct 2024 08:36:18 +0900
Message-ID: <20241007233618.1442937-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

The is_leap_year() for determining leap year is provided in rtc lib.
This uses is_leap_year() instead of its own leap year determination
routine.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Acked-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 drivers/rtc/rtc-mc146818-lib.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

  v2: Add Acked-by: Maciej W. Rozycki <macro@orcam.me.uk>
      Eliminate the leap_yr variable.

diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
index 651bf3c279c746..dbd2d5835f002c 100644
--- a/drivers/rtc/rtc-mc146818-lib.c
+++ b/drivers/rtc/rtc-mc146818-lib.c
@@ -216,7 +216,7 @@ int mc146818_set_time(struct rtc_time *time)
 	unsigned char save_control, save_freq_select;
 	unsigned int yrs;
 #ifdef CONFIG_MACH_DECSTATION
-	unsigned int real_yrs, leap_yr;
+	unsigned int real_yrs;
 #endif
 	unsigned char century = 0;
 
@@ -232,8 +232,6 @@ int mc146818_set_time(struct rtc_time *time)
 
 #ifdef CONFIG_MACH_DECSTATION
 	real_yrs = yrs;
-	leap_yr = ((!((yrs + 1900) % 4) && ((yrs + 1900) % 100)) ||
-			!((yrs + 1900) % 400));
 	yrs = 72;
 
 	/*
@@ -241,7 +239,7 @@ int mc146818_set_time(struct rtc_time *time)
 	 * for non-leap years, so that Feb, 29th is handled
 	 * correctly.
 	 */
-	if (!leap_yr && mon < 3) {
+	if (!is_leap_year(real_yrs + 1900) && mon < 3) {
 		real_yrs--;
 		yrs = 73;
 	}
-- 
2.45.2


