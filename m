Return-Path: <linux-rtc+bounces-1234-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D7F8FD4AC
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jun 2024 20:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CC4728AD2D
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jun 2024 18:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D411482F9;
	Wed,  5 Jun 2024 18:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J4iEbje9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9B413D501
	for <linux-rtc@vger.kernel.org>; Wed,  5 Jun 2024 18:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610407; cv=none; b=dj8KwkIOif1Ew7pSvlSaeao9ORR0joe7YzG2lLdfcHW4nkpmZPcysKPEV7ECW99mGCTPWIJHdCPPbObH8tGa49nov7emJ9VEJWJkhnHbxPrzUIxLtjJ1pTxr4eLrABLQyPGVP2/o8PEJTN8nWcZ5Jk+bdF+U+8EXvNPMw/oFAKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610407; c=relaxed/simple;
	bh=ipr39Oe7qflzshs+uqKeD5dsLOI2DywzVbGtmwc3XF4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JUQPpxuQry8lRgbAkyZixMS8fgvYyLblUROg8WF7W1ezKR05sw12CQEKslUgthtKTQ2GW/qRIl/kF6ndpBPPAVdyH9txNcsZ0T5Tr4xTb2DDDEo8VfJx+cSxW/PdC7FuN7UQhMb6zApQnTEkZclcq8ovIY6+7lMfQBA3WHpvPFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J4iEbje9; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-df78ea30f83so1550300276.1
        for <linux-rtc@vger.kernel.org>; Wed, 05 Jun 2024 11:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610405; x=1718215205; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nEr10taYCu3WGRiwn+CGqfggqJNbp7A+We0V3ygommI=;
        b=J4iEbje95ninWiXtqqt5T/9d9/rhCySu+uRgj5M+PAahakXxAmJMwbOM3Vl+q9ipwO
         cR2XMTaT3Cl6rtmhHcCzhm9ADVnFZb1p7yDmg+5o5KLMVVkrKunBBEwcfC6DifTaKXZY
         +22DMkjtteZbmFu3YZvAFV37gq3FnCxnNGemPsZXaxgCOZFtLwTgb/ySUoNoxgKThXqI
         /j358DaGUSozaVs/XrXx5gTTjXCJvJ2f3lRsZKCCy3KtAdh0gF3OvCEX+ecoMyu8HbjC
         QoZmOUWx+hkMmSCw6alLz9KvgAyuX7At1Lbtv2yzZUUbf2fKO7pPiVpatVP+Lflv7Hil
         VtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610405; x=1718215205;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nEr10taYCu3WGRiwn+CGqfggqJNbp7A+We0V3ygommI=;
        b=E74ET/d0kIwF6+RZBpIhefJznkQZf7nYM0c6l972gs+cu+tOz+eVA37Sjzz0weG6sx
         bLaQ7PYIF0quAuK9Lyy0FmBqnNopXkVUSG13LtK03M8iZS2Ou1WNMhBcM8hAG806YmLy
         EZw4xZdD5cA4aDOz80bTUZvnUpn6n9Xyza77Hq7+h1y7rbmyEF1oeqWbMVFeCxaM/i6F
         4sV/77OPh9Z+qMEOQyQbggJYQDT6Hp4m7fz6YHMUEMoHGMatQuXVDJksNyIKfPfd6s+r
         IDAlIE6XsbaBhrkAthurBXmpe3WXJzoxYf8/ox+d+MB3P2W+s3RKBQSoPzTGU611+wms
         wPkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlijXsFJsuyFPCaQMsM3nnpp0CK6cfV9w7W5py0BJIBCABvbhlcB5kHJ+4N1AX+64PRkGWGvIehWfrbNUbAn3ltDkr0LQa5tk+
X-Gm-Message-State: AOJu0YyFDnp3dy3kk5xvCTu0OPDxl2bPnNOnKGlA4QciUkNOkKs+KeIs
	XZVqLcRT44/ka28vI7RwLJPZihvoxsTljoNNtmrRq+zqy6M8om95Lnu2viF0KI6c22DyzCusbnM
	wzGQh5zMytA==
X-Google-Smtp-Source: AGHT+IEFfd1XOUpmBlCQ8OC96XaGHvsQJFoGDWo7KSg31aa/FmwG5qSwwUZMqSajPkXkOc1t6VuaS9UByNrZ0g==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a25:dfd5:0:b0:df4:eb0b:8fd with SMTP id
 3f1490d57ef6-dfade9e0f4dmr76066276.2.1717610404805; Wed, 05 Jun 2024 11:00:04
 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:45 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-2-joychakr@google.com>
Subject: [PATCH v1 01/17] hwmon: pmbus: adm1266: Change nvmem reg_read/write
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
 drivers/hwmon/pmbus/adm1266.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 2c4d94cc8729..7eaab5a7b04c 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -375,7 +375,7 @@ static int adm1266_nvmem_read_blackbox(struct adm1266_data *data, u8 *read_buff)
 	return 0;
 }
 
-static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
+static ssize_t adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t bytes)
 {
 	struct adm1266_data *data = priv;
 	int ret;
@@ -395,7 +395,7 @@ static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t
 
 	memcpy(val, data->dev_mem + offset, bytes);
 
-	return 0;
+	return bytes;
 }
 
 static int adm1266_config_nvmem(struct adm1266_data *data)
-- 
2.45.1.467.gbab1589fc0-goog


