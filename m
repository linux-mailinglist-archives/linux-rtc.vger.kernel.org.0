Return-Path: <linux-rtc+bounces-4735-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54616B2E596
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Aug 2025 21:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBF4FAA2CAF
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Aug 2025 19:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51044215191;
	Wed, 20 Aug 2025 19:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQRjW2tY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89749212D7C;
	Wed, 20 Aug 2025 19:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755718242; cv=none; b=ZKNVEQRuN27rMYlawu4UTxUnlxmV4G/rQDcUu5dqdI2s+cVn7rvfaO+VI89mRe5zIj3VpcA8FaeYwH126udbBSDoKYuwV/9wxjq22tojuUwcat7YhmV1MKySG2m+GI1RtAttP9+1mhbEw5pEz8J2iyJmA9e/mD2awNzLKd7RZpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755718242; c=relaxed/simple;
	bh=oWgMmkF+VavFhTKCU41iCrjm9M8rM6Vy+86aNjRCt6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U1rEJavkGZko2stYnACP00Tv2D6xtP3MvHPUGQc5PHJwKW5wKpWh79vaud+exP6mtPndkFhfiqzt+QhhTnhYTNsAoj2kbiPePq8bAb56LfF0X5caoFVRnDdSYTlIznPakubN9dQ+uLDEujvSafj7YwYWXNGmCgoWjuz1Z1msLmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQRjW2tY; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb78f5df4so42842766b.1;
        Wed, 20 Aug 2025 12:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755718238; x=1756323038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xFgVtYJ8Gh4sCpaIkpLqNQZzoK7dIue6xEz/XU13DfQ=;
        b=hQRjW2tYAvjbSstR5TIWH0v33FvgB4uA2I4OqXIFNO2GC7DV8439BZPPiIKr7v3FTS
         P2DfmcJyRhIlYttfykl6K2OBILCaxuCdS6/FUJF7QBvRXkMZ6mjQOi51BHVxwghTa8pW
         TOK93T0Vupymkn1nOC8c31z6pqB4uS9DCZ+ehe1d5BNz3S0uciMJJhrpJDLjjKPGwUUm
         JEUt5dDBhUwBEDx1g5Rqbl6QP5hgzLpb8sM1V9rLTsh2jnocSv92Y/WFJhCaQNZh74z2
         hVY432vmGezjYU3tqEKX8/KvsGxyliLRB6QF69ER23PBylDsfSr37exX6DYnjWf6YShi
         o7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755718238; x=1756323038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFgVtYJ8Gh4sCpaIkpLqNQZzoK7dIue6xEz/XU13DfQ=;
        b=UEolfU8tp9WJ7mfU3uKpR0O9/mmdBvz/qY5xmcaRoOsAi789kZEkTQew56iDWNrWjq
         JhKGbqnpxIgWefAmHN6EnL3fvOrTee1c5J/BFwchAXV+ZoglOCQHGDYlHHvertzmU1b/
         dZmxT4yKHOW98MvMJZLpco9mE62lN1D2jKjfQSLmYEbupWvdZlKfpz+G7DCo3FwJxyFg
         kWI9WUd+svgIrobVqdKL4F8oky2HlkNLfE2EX2LKsCofUgbNAggYANGwSHv8EHKilSjp
         ms3syn2W8S0fHazDJsGM/zKnDN15LDx7bCRGo8eRlTXDnAjckzxiC3aR3L+GcROxmU3Z
         fxNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ+HqdYe/rRhj/ug8Evwys8Lq+QWTHqT3RCZDj3ua3PIK/eU7mUWfK3krhJoi03MqSspEIUSc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7SyLX+JTnnfIi83lnjyziLhJ9bCFc7znBdspCMJRgslmVTiz8
	WeHt3qypBcmFNOhvpnyflX4rc3q4M/hBaxOP+aW9twWMAAtVZjy5s1urjPd1J+MC
X-Gm-Gg: ASbGnct7R844GVT5+quWVwf2FoTrtkDgwFmpnUbb9j8OVpnqw2UVhq1aTp17Tqzel75
	9yHpV0GjAthTK7sUuvqZA/ESt07ecWBpGwdQZ1JCC2Q9ZwJVum3T8EvnWGwYHDXoQ/rCeQ9WwS9
	iSZw8M2hBLQHQ9aN1VknbxQK0HzeoqIykLqI2rWmEKNmF7pJytBURJeNgV+X5btAVU6C1IBrfpP
	93XMLJhweDUSeb07+xDIQGSLumMhY8zlNXTqkm2d5CTc/KFOcdFtuHJZhrvuhxJCjofg5jCOqVU
	cyJWOyxyAK9sGv8OH3ow53LeMwHB7HcfZxDLpYlu/f7dhqxDBkNHXrqgTxEdWQDIM/GuFsw/InR
	hzKDTB+zlsF0fjKklRDGU1GoPWpoiYU1qrOVXfJFrEvbLYE48AFw40zGNMt/Eol/bEBYWcbf6Ng
	AKCZk=
X-Google-Smtp-Source: AGHT+IFCBiHSlW/ki1YtdYMi2uRfdwcyFfP12k8/JIn26TTFHKMJ3fGSane3cZ3VpRG2pvAcrBKJzA==
X-Received: by 2002:a17:907:3c91:b0:ae3:cc60:8ce7 with SMTP id a640c23a62f3a-afe07a07df6mr3257766b.19.1755718238220;
        Wed, 20 Aug 2025 12:30:38 -0700 (PDT)
Received: from fedora.tux.internal (85.191.71.118.dynamic.dhcp.aura-net.dk. [85.191.71.118])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded52ea4asm230009366b.101.2025.08.20.12.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 12:30:37 -0700 (PDT)
From: Bruno Thomsen <bruno.thomsen@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: bruno.thomsen@gmail.com,
	stable@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Elena Popa <elena.popa@nxp.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH] rtc: pcf2127: fix SPI command byte for PCF2131 backport
Date: Wed, 20 Aug 2025 21:30:16 +0200
Message-ID: <20250820193016.7987-1-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When commit fa78e9b606a472495ef5b6b3d8b45c37f7727f9d upstream was
backported to LTS branches linux-6.12.y and linux-6.6.y, the SPI regmap
config fix got applied to the I2C regmap config. Most likely due to a new
RTC get/set parm feature introduced in 6.14 causing regmap config sections
in the buttom of the driver to move. LTS branch linux-6.1.y and earlier
does not have PCF2131 device support.

Issue can be seen in buttom of this diff in stable/linux.git tree:
git diff master..linux-6.12.y -- drivers/rtc/rtc-pcf2127.c

Fixes: ee61aec8529e ("rtc: pcf2127: fix SPI command byte for PCF2131")
Fixes: 5cdd1f73401d ("rtc: pcf2127: fix SPI command byte for PCF2131")
Cc: stable@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Elena Popa <elena.popa@nxp.com>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 drivers/rtc/rtc-pcf2127.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index fc079b9dcf71..502571f0c203 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -1383,11 +1383,6 @@ static int pcf2127_i2c_probe(struct i2c_client *client)
 		variant = &pcf21xx_cfg[type];
 	}
 
-	if (variant->type == PCF2131) {
-		config.read_flag_mask = 0x0;
-		config.write_flag_mask = 0x0;
-	}
-
 	config.max_register = variant->max_register,
 
 	regmap = devm_regmap_init(&client->dev, &pcf2127_i2c_regmap,
@@ -1461,6 +1456,11 @@ static int pcf2127_spi_probe(struct spi_device *spi)
 		variant = &pcf21xx_cfg[type];
 	}
 
+	if (variant->type == PCF2131) {
+		config.read_flag_mask = 0x0;
+		config.write_flag_mask = 0x0;
+	}
+
 	config.max_register = variant->max_register;
 
 	regmap = devm_regmap_init_spi(spi, &config);

base-commit: 880e4ff5d6c8dc6b660f163a0e9b68b898cc6310
-- 
2.50.1


