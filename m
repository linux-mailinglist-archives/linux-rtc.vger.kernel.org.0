Return-Path: <linux-rtc+bounces-4080-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC26AB1C65
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 20:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EA111C22D0B
	for <lists+linux-rtc@lfdr.de>; Fri,  9 May 2025 18:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAFE223D2BB;
	Fri,  9 May 2025 18:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLigsjHr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1C4647;
	Fri,  9 May 2025 18:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815902; cv=none; b=hoi3G04+rmgFIloFjSbgmH4YMMbhqLwYOZxqcmmKbWaRMWyAx6ITYZwj48XbxQc2Wa48I717CvWu0xjpNywl1rI7wQeS7utWerlxa4BEhm9+iqJ4iEgUTDelJ73VkWQ7Jmg1usVJl+hLA1BciW2/hADhcekRsROdfj2huIrzuG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815902; c=relaxed/simple;
	bh=dd/290aZNY5O/JLWsp6iT01AgdGYQcXC8+O//KRhEpg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e5Ht9dIOOPaLCOfNIsditUH0gmCdty8X+VGP+C1zAAFXuTehVgoIo15kl04AFm7E3e9JvhlVMiTzg+HC2URSED4BFQiD0sL0iUaXiZV96+LPy0OeXo60y4KXdenUg3aCeIKdln4U81q3bwd+vP0PVfLm5oHxnZS/HTfQa1di2W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLigsjHr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so26851655e9.3;
        Fri, 09 May 2025 11:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746815899; x=1747420699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=spwwddOcr2bxy5oZCe+k46ppxSM8rzeZ93fwj//zW8g=;
        b=VLigsjHrJFQo9dkDso5gzt5GLxk/G0+bAtiit/4v0l3irM3fBoIEvkd+BADH6+DWt6
         51dK5D/zXGGbQv9fwVSjNtpvfMmQEq/+IXQ4sQ0gatiyc9mpr9XrLT5HGmHI5oBmiKc9
         VyGAlgF8JJeNu7nQBzCcUZ5U749CqSEoEExyDUy6lj6jnSBGq5e7kCtywX+mbhbW6tTl
         qBoXvf3djpZDYJI7EZpp9q74ca6rwQR3fpgReXSh9IZQoF2Wmh16DJnfFDSzYy0b1e/b
         u0oYENg65HiwYU0gsnBEIJrTIXuQ5IbTcw5UXIUB8hsP9UbafTkW3YgE1Dl9TW9zrePR
         cXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815899; x=1747420699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spwwddOcr2bxy5oZCe+k46ppxSM8rzeZ93fwj//zW8g=;
        b=JQ0I+XrWFJixBMZ1gBMSfDwKa/v6hBuSLZJ350oNC+gLDXiQO+u1SXm+KA6qRRYjt9
         mgS5b9VL6C12wNppoLOmajO3oUvoPvN9RTqtb5qyXWMi96ngd+dNkUpgMIbsWg3Ovrsh
         Z/YE3LzlCqAuBJyn7LAVK+UOjoAhr6oauWSJt1yFpjfbLcCCextGmRDlo0ovyRsKAGbr
         hzwLft1a9n7d0h8yzGUUcD0ApV1qpDHOQezhopcFZ8i+WP8NZKZjzJA38FQ+kWu7h8IE
         fq/REWyU4rq5TNbZrrHnkVb+c/vUPWUBYQbkwjUEZTmwThfo0Lrw4SPFnK9Oe53h6WoX
         gsPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNzvciKrHLI45VqhCXwz4idK2BABOzbWcM0vlQ1A8R8a7vtO7ahqedDm75+DSmCzXX/XJ1T5Ln15Bt@vger.kernel.org, AJvYcCWDtH/O7jWaV4cuJQXvmVrEEedTYNKljDN4F7Wb7Be/ltoXqJLX3V8NSWmLNfkFymuoBfm5tyZknHVpfdn/@vger.kernel.org
X-Gm-Message-State: AOJu0YyugoToHH1r/XWDeN2Ua8265GM1/PXcJPdKNGIr9+lVyc+fG0B6
	41GCg4KEkW+T9TB9jtnSVS6nfsusH40NpQ6dBK7tjjiWne3XB8nu
X-Gm-Gg: ASbGncvESfb2lLgjQ3JH2YFW0g7zjlvsnA0t3sbCQeqdcxVxyQMlDPs6zZqCD5884q/
	dqArEJURzgEa7y2E9bL/jeo3QqodnmcCVoNAODVGp6tFR8BF5LMc705S33DfANUKutwCYyUqAsP
	D1gzGQ1SBS3W7yhlySaP3uMduNIvOCrhmvzQvtPOds3/gDd0eQxfOZQOKSI3F6r6J6N8z3esdPG
	LiLYgQN+uBTTpEok5ru8bE87khKcLGKAkbIdBDy7GN1FUtdjkcDZ0PZ+gdD6rTtgotYkniiWcIc
	AHpmE1lVH/MKLsvomTxQoYbQt6ZZzuGgaJYgyVDAu3mtk2+nQP437AOONTVBN0vlIiISlQ==
X-Google-Smtp-Source: AGHT+IG5h0s1CO26LtdR3Zhb2EwUJywBAJkxUoLkDGxmNffMgAN3d7Bn6tsUN7Bj3T8pWFgLjfCaWA==
X-Received: by 2002:a05:600c:6818:b0:442:cd03:3e2 with SMTP id 5b1f17b1804b1-442d6d18ad5mr44432925e9.2.1746815898847;
        Fri, 09 May 2025 11:38:18 -0700 (PDT)
Received: from localhost.localdomain ([78.210.112.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2f4sm3999878f8f.78.2025.05.09.11.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:38:18 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	alexander.stein@ew.tq-group.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH RESEND v4 0/3] add support for RV8063 SPI rtc
Date: Fri,  9 May 2025 20:37:47 +0200
Message-Id: <20250509183750.95836-1-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Microcrystal RV8063 real time
clock module with SPI interface. This device is very similar to RV8263
(which however uses I2C), so I decided to extend the existing driver instead 
of creating a new one.

RV8063 datasheet: https://www.microcrystal.com/fileadmin/Media/Products/RTC/App.Manual/RV-8063-C7_App-Manual.pdf
---
Changes since v3:
* dt-binding: fix indentation in spi example
* pcf85063 driver: add of_match_table

Changes since v2:
* dt-binding: send as patch 1/3, not patch 3/3
* dt-binding: fix indentation in spi example
* dt-binding: fix order of enums: rv8063 before rv8263

Changes since v1:
* pcf85063 driver: drop MODULE_ALIAS, add id_table
* dt-binding: add "pcf85063" to the commit message


Antoni Pokusinski (3):
  dt-bindings: rtc: pcf85063: add binding for RV8063
  rtc: pcf85063: create pcf85063_i2c_probe
  rtc: pcf85063: add support for RV8063

 .../devicetree/bindings/rtc/nxp,pcf85063.yaml |  33 +++-
 drivers/rtc/Kconfig                           |  21 +-
 drivers/rtc/rtc-pcf85063.c                    | 182 +++++++++++++++---
 3 files changed, 199 insertions(+), 37 deletions(-)

-- 
2.25.1


