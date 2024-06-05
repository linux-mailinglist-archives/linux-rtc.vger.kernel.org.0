Return-Path: <linux-rtc+bounces-1239-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6C68FD4E1
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jun 2024 20:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 575F51F228CC
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jun 2024 18:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18D9195B2C;
	Wed,  5 Jun 2024 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yW9iJgkc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A582B195991
	for <linux-rtc@vger.kernel.org>; Wed,  5 Jun 2024 18:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610430; cv=none; b=GxDHDjFk7hocX1CzVfM8VCMeWEFPXxDj7dVnlqjr+cpGDrzBmX/Q3Cl77B+rmKIx2D88D2Kyohe10j6jlde8jX8GNLr663OITcRRHFMreN33OZamezhy+P+04vvqpO58Vj1B5pqKgtsnHskyenzVmNk0nWx7WSogMF/iNg+kDFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610430; c=relaxed/simple;
	bh=7s5ualCvDc0GEz4419Gj42eDU6iSkCy4DM1JO8Cp5kE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gcXwjRHPLIHjd38770jg7TbChVOCtqayc11pdcTBCPKWvXyYYvubiLUPbcumBzl/6l11OkLfoTMllG45z0DdEXv8UacfYDMsb474qhgfL+PsEV6cL2FaINcq7m2NqCioPal0SvCbeapCoUar/zupckoWfsPLOOKLVZBf2DMTA+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yW9iJgkc; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62a3dec382eso601767b3.1
        for <linux-rtc@vger.kernel.org>; Wed, 05 Jun 2024 11:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610426; x=1718215226; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq8gN9PC4V0/WUeYJD+ngNL2/82oznUqnDRsVCEUyhc=;
        b=yW9iJgkcljzKSnVxoazsYECi5fP6QNHHLJ9IlEuTsYQL+RlaWWDmJD2d4e+DNhDTlm
         KIfryHEvd7FtNm8eHNyqjTI1XXd9/8uhvtg7pv/6kGvV3N26EfwVy000lhOWFWeeOYca
         tJ5tYDQzM0o210kyrr+IgjNfC2CA3bJ/iL77N6LlXzTEq98PU3R3wL/25tRG7uPbotgU
         cpbVNwzhr6IKc2fqP3RBBaMQHVM8jgX0F5gRXjSonWVCOuoyDtvr1Rlg6q+Zn0PJq947
         LFpzYOwiH3TGEwZZHterdbmrVBOoTZV4ppyVHdrpANxTOrfCSPzqLu+DJ+cBDsXOimAK
         gLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610426; x=1718215226;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq8gN9PC4V0/WUeYJD+ngNL2/82oznUqnDRsVCEUyhc=;
        b=WjDV1kqtsEjKklP3HlJnfYMm2u3+ExZNzKltSEWLO4wTIFYGJggoeUaGGEtJ9ANAsx
         n4Yx1l7bromTMNYfGyOutolG2C2DtO69l6xf42g4lEw/a6UFPBfWo3X4ugcNJm6BIxiN
         xYk0Azf5kkFJtzaufBDn56p28n2rDu1CwKOqgf+rm2rZDvV2HL3TluTXqT7F1XDWi12H
         Fld9yWeZdhwgp4pz3chyTm91DzRUanXFgUicWQ7erTl1U1AcV6Ecjj4onZfslaonsEYk
         i0Hli677nMQHNIeK0fC86VfnejT6vXllDTP79p3x8Pg+utBHNiTdKjTZ0ujLMJks1D8m
         UPLw==
X-Forwarded-Encrypted: i=1; AJvYcCVVdi8b47V+DDD+8GxY/9QJDM8/N6Py3o9Su5g2Q+jEG5W09ttpn3gd8gnwKBf0kxWew7cEBwhu1yklyqrJzL8hb3uHyIoAASl5
X-Gm-Message-State: AOJu0YxCr2XM7vfR3p7KODOe9FcZUveiZb8olVydHgfmVq9BhOzMEfuv
	bP5DDlQ7958Ak8f1EckMPGSu5qyUCCJeN50nT0MBesX6oFUwvREMC5Q0hxmamAr4QkMa1H+jZJL
	tvKS/ipILXQ==
X-Google-Smtp-Source: AGHT+IGpQQ4ibO82CB++j7EQg4rT4P/RHw0r35tzLXXxO3B/dL6yEQW14Z2L0s1fkq9sPWcVhlzFxs8YqockaA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a0d:d4ca:0:b0:623:be6:d5e4 with SMTP id
 00721157ae682-62cc71784bdmr605497b3.4.1717610426639; Wed, 05 Jun 2024
 11:00:26 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:50 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-7-joychakr@google.com>
Subject: [PATCH v1 06/17] misc: eeprom: at24: Change nvmem reg_read/write
 return type
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

Change nvmem read/write function definition return type to ssize_t.

Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/misc/eeprom/at24.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 4bd4f32bcdab..0e8d92d6ab1e 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -424,8 +424,9 @@ static ssize_t at24_regmap_write(struct at24_data *at24, const char *buf,
 	return -ETIMEDOUT;
 }
 
-static int at24_read(void *priv, unsigned int off, void *val, size_t count)
+static ssize_t at24_read(void *priv, unsigned int off, void *val, size_t count)
 {
+	size_t bytes_read = count;
 	struct at24_data *at24;
 	struct device *dev;
 	char *buf = val;
@@ -465,11 +466,12 @@ static int at24_read(void *priv, unsigned int off, void *val, size_t count)
 	if (unlikely(at24->read_post))
 		at24->read_post(off, buf, i);
 
-	return 0;
+	return bytes_read;
 }
 
-static int at24_write(void *priv, unsigned int off, void *val, size_t count)
+static ssize_t at24_write(void *priv, unsigned int off, void *val, size_t count)
 {
+	size_t bytes_written = count;
 	struct at24_data *at24;
 	struct device *dev;
 	char *buf = val;
@@ -509,7 +511,7 @@ static int at24_write(void *priv, unsigned int off, void *val, size_t count)
 
 	pm_runtime_put(dev);
 
-	return 0;
+	return bytes_written;
 }
 
 static int at24_make_dummy_client(struct at24_data *at24, unsigned int index,
-- 
2.45.1.467.gbab1589fc0-goog


