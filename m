Return-Path: <linux-rtc+bounces-2111-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C89993DDC
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 06:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFB521F246D7
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 04:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B983F9FB;
	Tue,  8 Oct 2024 04:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="X9xPEK23"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDF33C0C
	for <linux-rtc@vger.kernel.org>; Tue,  8 Oct 2024 04:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728361078; cv=none; b=dD0d2dD4EQQggnFm2pF2qlnVXW8Xb2MIFdZJ+QqGz8vdvbux1IFsGMAFvD9hUVZgR90blZHN3p+qp9CtuWlZLqCa2z/FXC0r3S+vn8k/D/Qi4T/oZbiN1f6v2P/D2kMLNPGeTigBMndgqD8alWlUPHjKJlG7NZHK1eUSQxVcefE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728361078; c=relaxed/simple;
	bh=6HfLF08HYL3p3XfIceMe4VbK2ifsfg79xObxJmr0sVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OPqDSlj+vcD2faMeTasKg7RM2+5U9F2K+AJuJRF5NpwiPaBQXOxlzeaO2LiBE1epAQHRnBeI9HKXAfor+fCGT1TG1lO1OZlkW1Zw8bu15ZJMejyR7+4uWO4B2CcMsmG+/WOjH3ZH7L6ofxuqMBHhMwFFOn0yIqefui0XZlz7kP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=X9xPEK23; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20b90984971so53407005ad.3
        for <linux-rtc@vger.kernel.org>; Mon, 07 Oct 2024 21:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1728361076; x=1728965876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qwcy1Q3TMls1bnUmrpkwAG4GSqExbl+rH8vmvD0fjhY=;
        b=X9xPEK23SW43+dcrRSn+rF4DTvv2wzUX5KsgQgMghvXn9IDox+9c+5in4u5f3Q90hb
         aSiE8tCCtPcDXlUs9OTKpy2OjfqzIjxupPlK9d7IH2L/k6O+H16T4McTZgm8cume1DNZ
         zLYhaEbp0Kc4KSvrAsleLrTVx5pbE0USuvDoc/TUGsomB1gJHbJpPC448C8jEXGW9PM6
         OkxfrRyJDE8anTF+LB94gSbKY1nFsGW3S3AVeU10otGrda7C0Y2sroULBtdcvFbREcmN
         nH2Ppjz6RWPt/bEWrizUNtOveVFGzBkfTh4kh0ZF73Mg3FCRqiVrzLi3+tCx7huZxqBb
         tyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728361076; x=1728965876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qwcy1Q3TMls1bnUmrpkwAG4GSqExbl+rH8vmvD0fjhY=;
        b=RPbcmkWd31cQ6EN4reGo1O73ZRDyq9tT/UjtE5Tr1Jkq28UXjJ1qC02AdABenmeOyD
         WBIsAXC9rGSGK128vat0zMySjHwefP9z/x6RstdRiPNnHS/JpwocMz+JZd0EP7fnPaz/
         GvtcRuIrCuMw9Bui+G7HdB55cJNnaJgnfhxpFMi2yZfDMgHgd315mGtV4pXIx9HGHNBY
         cnuVnszRyjoRhY9jsvi8cAs80/9w+pkHjNKGoiuksgP9a+6Cbz0o8la3XpV0YogTeT1f
         S6/RZGGNahMXdZI7M5FQhlCbSzbti94MTAPnGy25QU/AO0dmmIFr6DdmCOUq/JbuCNaV
         o/bg==
X-Forwarded-Encrypted: i=1; AJvYcCU2F5Ard45z7nblVt2uzehPZKjf05DpTFzkh+qalaQe2w6UvqxrB9AAneblMHaYT7NnGJbvdJvGvX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVdpCl4HccAmQM4gsZkPhGoWSfQRg3cRozch157WKF1bvv+Uo/
	1u9+AjOU1UBYh+YlvdieVivB47gmg+1cUH0f8fNqzL3XVHEwxDtMviQ95Wdx
X-Google-Smtp-Source: AGHT+IEh8+JdOX8UEHE73IwMV3DO/pt3CS+IqKhGFGP7T+L5b5Z16aHIMvyypjInsvw7o9r7iTWVIg==
X-Received: by 2002:a17:902:e80c:b0:205:5d12:3f24 with SMTP id d9443c01a7336-20bfdfc0557mr191055685ad.20.1728361075664;
        Mon, 07 Oct 2024 21:17:55 -0700 (PDT)
Received: from localhost ([2405:6581:5360:1800:5cd1:adf7:7fbd:8a98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cec9dsm47168085ad.103.2024.10.07.21.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 21:17:55 -0700 (PDT)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
	Jeremy Gebben <jgebben@sweptlaser.com>
Subject: [PATCH] rtc: abx80x: Fix WDT bit position of the status register
Date: Tue,  8 Oct 2024 13:17:37 +0900
Message-ID: <20241008041737.1640633-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WDT bit in the status register is 5, not 6. This fixes from 6 to 5.

Link: https://abracon.com/Support/AppsManuals/Precisiontiming/AB08XX-Application-Manual.pdf
Link: https://www.microcrystal.com/fileadmin/Media/Products/RTC/App.Manual/RV-1805-C3_App-Manual.pdf
Fixes: 749e36d0a0d7 ("rtc: abx80x: add basic watchdog support")
Cc: Jeremy Gebben <jgebben@sweptlaser.com>
Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-abx80x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 1298962402ff47..3fee27914ba805 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -39,7 +39,7 @@
 #define ABX8XX_REG_STATUS	0x0f
 #define ABX8XX_STATUS_AF	BIT(2)
 #define ABX8XX_STATUS_BLF	BIT(4)
-#define ABX8XX_STATUS_WDT	BIT(6)
+#define ABX8XX_STATUS_WDT	BIT(5)
 
 #define ABX8XX_REG_CTRL1	0x10
 #define ABX8XX_CTRL_WRITE	BIT(0)
-- 
2.45.2


