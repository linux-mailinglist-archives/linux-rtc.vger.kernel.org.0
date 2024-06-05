Return-Path: <linux-rtc+bounces-1240-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 603118FD4EA
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jun 2024 20:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E151A1F258E2
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jun 2024 18:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CAF195F31;
	Wed,  5 Jun 2024 18:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xh8vf0dA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B989190490
	for <linux-rtc@vger.kernel.org>; Wed,  5 Jun 2024 18:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610434; cv=none; b=YzVd0LyVrrWHIwDUnIKIATxLSQhacVMxxZFhbD+W0hUSrl7HDH2ePz1eGn7fbWajrbFkKY9nrP/Ih7qHmmWhO2xlEhvrRmpowK7Cdtn7VxrDKyj0TNhsrE34yPJFcIuzNPlqqPNK1LIXJGp5vAVTvPTb80QFoWuOZgnsBRJ+EkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610434; c=relaxed/simple;
	bh=7YntdTNu7aMZ5zLGGRpR3JsfAB0rBOtanC3KQe4XBYY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ClYL1mDCR+gZQ7HkuiqHAfO2Quov9kbmzJs5KUmR/CrbtTonxbQ+dvQOistNFz1Sl0xKQu/u8o3GV4GrvReoQBaVWVHIlsp+BPmHIRlwg7+fFt7LiDH4bnwJjGQ/qCxXhaxnD+Nlp+tlXwxvqiFX/Km+6aLxJatiKzVtAeh5Yo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xh8vf0dA; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62a3dec382eso603287b3.1
        for <linux-rtc@vger.kernel.org>; Wed, 05 Jun 2024 11:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610430; x=1718215230; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GabZAVwK9FSl0VODpa0rRnhc7Hb5WIAFsUpyNY/Jkgw=;
        b=xh8vf0dA+TFlUnkkazIa6Em6KzJbbntuGamI4Gn8Wj1jFYYx5ZYFkn2tA0alpWg68u
         9jhNXfx2DxL9m7tqmgthqmC1rUSflk24zLEIHrstf3mW39EvFDR2FeelUhLsupY30DEi
         /gVZrfJA0Slzv9rEogcUVgXiY8hLFc0E46E+FUZ/X8hWU6PYTTTOsgDQPMK44rgcyi4X
         g7UTGxktSZ/IcwoGFDfvWXQYzCbWyLYks/FVJWCMOKozF5JwJ5koJWgZ7381pzPo2fKz
         JwnKZftDOTv9WkuxVVV5rBvZHglYy9BQThw/il2JbfCMaxHpHsqQPdwDUsOxRCnGKcAo
         B5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610430; x=1718215230;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GabZAVwK9FSl0VODpa0rRnhc7Hb5WIAFsUpyNY/Jkgw=;
        b=VQB/WliDPq1YO2GAFWOTPGSF3rS0XAWvhL8wPLx9kdvwoHEQbTMFD/iZCP4oGpnl2O
         24vKbWRopfe1zhTE4QPEhzA5FMrKwJXPOwEdCLgspU6le2Mxh+F9m05Kufxp23/wxiN5
         OZfw7xC3y09kLmoBF3drdCqCnBh5kaAUBoOUIa67725ejjOr5hiikpB5vraRwP92rCyG
         W6SYVMUBja8AwuEdyKaiKJFVcgtA34ZzVnHz6RJ9e1U443JgvX3BWqNopTSf42cViEWW
         dD4yi4GQmwJWZy7MmZsjHnO4ck7zJgoRbneslbr2/R0iLVd+ui+P8wAoxnEFDXOpWGD2
         xJBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/2d/n3DRjOVzaWJsMtsWeddAw4UL7ZjBX4M+XTXsR2a04nxMidkm7TNu9vZTYgWgjLf/jI0NmkjDgywD3e993Hq1m2NR9+DrK
X-Gm-Message-State: AOJu0YxU5fBaKwd8eLVuItJoNndn2qosJhaPkFpyvZLKiTjR38KcnflE
	fAe3aKhN/vE53E8gLPZboKSLEGUIZ9r+ykktbAMzv2z5tVva2yQm+WrBvftkofdb110k8YzJY6L
	ljrhI+/Fkyg==
X-Google-Smtp-Source: AGHT+IEja+GLVOpS7V2U0r8IR9Z9ZB6nAf9rPU6225JSB7wTRYk1qUU4QFIkeBtYF/8VHx1IHDowrDp0WPzcZg==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a0d:d952:0:b0:627:de82:8077 with SMTP id
 00721157ae682-62cc709af05mr798057b3.2.1717610430440; Wed, 05 Jun 2024
 11:00:30 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:51 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-8-joychakr@google.com>
Subject: [PATCH v1 07/17] misc: eeprom: at25: Change nvmem reg_read/write
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
 drivers/misc/eeprom/at25.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
index 595ceb9a7126..73d60f80aea8 100644
--- a/drivers/misc/eeprom/at25.c
+++ b/drivers/misc/eeprom/at25.c
@@ -74,8 +74,8 @@ struct at25_data {
 
 #define	io_limit	PAGE_SIZE	/* bytes */
 
-static int at25_ee_read(void *priv, unsigned int offset,
-			void *val, size_t count)
+static ssize_t at25_ee_read(void *priv, unsigned int offset,
+			    void *val, size_t count)
 {
 	struct at25_data *at25 = priv;
 	char *buf = val;
@@ -147,7 +147,7 @@ static int at25_ee_read(void *priv, unsigned int offset,
 
 	dev_dbg(&at25->spi->dev, "read %zu bytes at %d\n",
 		count, offset);
-	return 0;
+	return count;
 }
 
 /* Read extra registers as ID or serial number */
@@ -195,10 +195,11 @@ static struct attribute *sernum_attrs[] = {
 };
 ATTRIBUTE_GROUPS(sernum);
 
-static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
+static ssize_t at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 {
 	struct at25_data *at25 = priv;
 	size_t maxsz = spi_max_transfer_size(at25->spi);
+	size_t bytes_written = count;
 	const char *buf = val;
 	int			status = 0;
 	unsigned		buf_size;
@@ -313,7 +314,7 @@ static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 	mutex_unlock(&at25->lock);
 
 	kfree(bounce);
-	return status;
+	return status < 0 ? status : bytes_written;
 }
 
 /*-------------------------------------------------------------------------*/
-- 
2.45.1.467.gbab1589fc0-goog


