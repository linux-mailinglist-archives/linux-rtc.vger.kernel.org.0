Return-Path: <linux-rtc+bounces-1246-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2558FD526
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jun 2024 20:06:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CEAF1C21996
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Jun 2024 18:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5D914F12F;
	Wed,  5 Jun 2024 18:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kNi4DOsm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B19214F11A
	for <linux-rtc@vger.kernel.org>; Wed,  5 Jun 2024 18:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610580; cv=none; b=rIiUnnB+kqZpidFKxtkKzVHO5j44uan58wZaGiXxhAy1Xz0vJY7ZbSt5/yryiw8eOhDcaB8m2cMqMbAUx9QLYP9g/ERm0+v31uJCrQOVSu0O8lx+mehK/Gh+yEM9Q+OCrbs+JWNuVZ0zWRs14QNuTx9hYe0f6/xkvMFufa22yNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610580; c=relaxed/simple;
	bh=F7v/jReeX3F7roR5IktBU242vDNjjn7EqsY7CVC37N0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=saBILyG+cE984zjuavWmMBij0Rk3RKjlvpSUndAYWAQ3lV8F+ept8YbTf8fxRE2oCT2q7BZ+WGl7qDOE3usDXqzvH5fZ1ijHu9MApFwmcXzocRqD6ritdIm6uXFJ9u3kL4ijIdKVJSQJPzZZwplaHQUk9K1tipjid/Jpz5Rm3zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kNi4DOsm; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-62a50486746so240727b3.3
        for <linux-rtc@vger.kernel.org>; Wed, 05 Jun 2024 11:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610577; x=1718215377; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gIyLXo+tPpGJoYrLFVnPX7LJcwSjEvXHtDXEdVowSIA=;
        b=kNi4DOsmR2eFJD/ozPIJsZfY+u1FaWLBIwASVQfRGxgFjLlTOUI7zjev1aEAMfsKW/
         0yLbhyipzyZtFoC+DUR4FYJiSoXO5mH4/eulRQR9F6nT/ixTUVnH89p8nLpSKs+ryqZ6
         PQDB5Kq9C8mDvTjazJGZigJLIebVnW2iS5jBdtWMwaDdH3Nm0KtC+riYBGgJRElKzcBc
         nb0zPBm9tbmB8B9Nt5DQWLR/elAziVjIPIPDCS45F2QREIVOQMwAJMr3aIZrSPFIy5N7
         4I9Ab10rDhZjjGPg8NhmVnxMrZ1wybrQdk1R3hz/PGLFOiA1QeUxuqHLnxFWVNZSGdTh
         f60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610577; x=1718215377;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIyLXo+tPpGJoYrLFVnPX7LJcwSjEvXHtDXEdVowSIA=;
        b=iHEtKtmxYpd8SZqS03Y6qI9T825/8BQtEixNJOHqBEX4Exqb/D2RhzU1hOVRSfwry/
         vGBrhOKuUArqKVUZo3g64NVqWlgqlOILP1W+TFKZ+x00jhnrbe4x40L/161UnCgg8DDP
         OXgVFYhVpHkbSySTDR+zEI9FmTmGkcyMYFgUU7+qFNZ683CtEbWzz+0YhVcO87975OBo
         oylKumDSkbnk44M41HPa9+iFMwPG9zKT0OdzWoThqr+8VcxPwrr/EeAsz5P684zEEnCg
         3ict/U/7KAuQr21/vKBsOl4xzjQTAKvuxIETrbQEazHyJJGVAv7rPPvankvAVmyWLl9m
         Iqjw==
X-Forwarded-Encrypted: i=1; AJvYcCUn9Fm8MIjmtTw0z8rcDn+Lp04cGjx7edRlUXJBxCU8I9Iwl4VBLGL5ttj9QKvuXGrVxp76+QtSThNtpPvDif7tzPFvKdqx7jjd
X-Gm-Message-State: AOJu0YzOP64GvHTsLKvo7N6+WmesP1wFM8IKpSfxLgEuWhW2VsCO8xG0
	2pADwlz2icA5oxBaVgRTcPkYEoYNxBvC13JYU0CuJrBS/yXUJJqcKncRHwHycu+fMgMVD7gB1vW
	hspOA3UxutA==
X-Google-Smtp-Source: AGHT+IHG2azfatKIs/LKs8bXyfwjNeJAhdZhoJHXxOf8ZfbWIWN9yiXy7wSmGDJ/xHP8XZ6qdqs5ZKpzypDE7g==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:887:b0:62c:35fd:678b with SMTP
 id 00721157ae682-62cbb5ab5a2mr4622397b3.8.1717610577229; Wed, 05 Jun 2024
 11:02:57 -0700 (PDT)
Date: Wed,  5 Jun 2024 18:02:34 +0000
In-Reply-To: <20240605180238.2617808-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605180238.2617808-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605180238.2617808-4-joychakr@google.com>
Subject: [PATCH v1 13/17] w1: slaves: w1_ds250x: Change nvmem reg_read/write
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
 drivers/w1/slaves/w1_ds250x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/w1/slaves/w1_ds250x.c b/drivers/w1/slaves/w1_ds250x.c
index cb426f7dd23d..369de01cd84b 100644
--- a/drivers/w1/slaves/w1_ds250x.c
+++ b/drivers/w1/slaves/w1_ds250x.c
@@ -137,7 +137,7 @@ static int w1_ds2505_read_page(struct w1_slave *sl, int pageno)
 	return ret;
 }
 
-static int w1_nvmem_read(void *priv, unsigned int off, void *buf, size_t count)
+static ssize_t w1_nvmem_read(void *priv, unsigned int off, void *buf, size_t count)
 {
 	struct w1_slave *sl = priv;
 	struct w1_eprom_data *data = sl->family_data;
@@ -159,7 +159,7 @@ static int w1_nvmem_read(void *priv, unsigned int off, void *buf, size_t count)
 	} while (i < OFF2PG(off + count));
 
 	memcpy(buf, &data->eprom[off], count);
-	return 0;
+	return count;
 }
 
 static int w1_eprom_add_slave(struct w1_slave *sl)
-- 
2.45.1.467.gbab1589fc0-goog


