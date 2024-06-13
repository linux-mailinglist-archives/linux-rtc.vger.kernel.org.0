Return-Path: <linux-rtc+bounces-1292-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 215B6906E93
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Jun 2024 14:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B5B21C230B6
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Jun 2024 12:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62091422B4;
	Thu, 13 Jun 2024 12:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y5KZGu0e"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8CD145A1E
	for <linux-rtc@vger.kernel.org>; Thu, 13 Jun 2024 12:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718280478; cv=none; b=QhwwerAFGwiBxlaWmXF7F0S9vAjovXtU+33/HqKqjrOnI5VlIcIqkddMDfcUgvaDI/S4S6e3i98t/wy9BZfSyenyyo/PUcTbvEo7wnKE4LblRQKmi5uyUwiFcCmkjnJZCeozNZe7u1fx9rlw8UfLY49e+ypwQJA+ZiFr0pyDjv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718280478; c=relaxed/simple;
	bh=ApfIUmMvEtf39ojiOQllZCMOwnzalBblmip9w0Xdo7w=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VVZ/9bUkLG91zorXGfYzaZakURcfJHE3vIfKjg03SpTFiIzZ3Q+d5yOT+LgR2C9ZL2PdDWjqYanx458MqHrtCwcBSajFVfNonmce70/QUBgnp7Y0jfHw2PXYnFgtLFuID9fq3OfcpMd2jugjdR1VFVBF/ezw7HiXzkmy5JflyXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y5KZGu0e; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dfb2fc8ca5dso1410414276.1
        for <linux-rtc@vger.kernel.org>; Thu, 13 Jun 2024 05:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718280476; x=1718885276; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oGodyiYjLAsD0yJbNMBI7MVLGuadjuXw3TChSJWxUzw=;
        b=Y5KZGu0eWU7udil0ghLJo1dz+yZJZd3vOg/d4XuoALJpL8oih1QPKMH2E0hqh34cPl
         zX2kggXpIOTjfibED34a7YAe5DETTBoU7YWyaVKXmUdloQc8t8EJ7sAs/A+FMey1a0eK
         O/50qErDCVAcUjAeOYUcyMmxlewXrHhJ/Tr8Zw6NRlXCrV+cXA5Yu5L1J2xf23e5D2V6
         AfdAAWnccsCjGD+jslmcgvHw0dVvJ5TawZoIPA2dskdB44ljcDb2TgytmRLAGoywhQ78
         9c0gnNgUYuUICaJkLRIbebXBd9vbu9AWAEUyCpTrgzzEWMbcU6oFWqDCd4lK88A7dbEG
         TD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718280476; x=1718885276;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGodyiYjLAsD0yJbNMBI7MVLGuadjuXw3TChSJWxUzw=;
        b=vC1xMy0/UGMHo7W0gRGppToeIFwPD3QV9ZTPJqkav+Iyn6PehOeS0wmkG4XuBJVDwP
         eni/GvOEunzpjol2w2P7wexPFU9vzyngjZ4nNuLEZjHv2cs6QVhkIopa3FMnUrM00/pi
         VDuJJA0GsA3NPln4w/xgUZL7vijQogBYwjZ8JQqCZFyZ54X8dSi+xQcEJ90ERQTRfF+0
         g+qj1kongLtjEFMevN0JNEJGMtDxB79u98338wHh2vaueAmCNTwmrpzTw5hcyRtOUZVa
         AVFiMp5GFWDqJM+65WZCItOtt2xr+1mHaokWr13vS527Qpx9RvzDQZM1m/daAtywMFjc
         6xzw==
X-Gm-Message-State: AOJu0YxdFFY+ocGtAB3iMehePKc+5iKSXr/8IffJNvI9y4Fnr4mA1F3D
	b+uxCYnQXy/Uj/zVJaE8qehieJeNJVJqr3u5ATeEOsPUpcRZdEnUMumFAL36ga5v4MWOOKISqBC
	gpG6JuFuYiw==
X-Google-Smtp-Source: AGHT+IHXow2FDhm75pimKLZX48hWrRy1U08wctHSj/K1NF6TSMVXN+j/Fjh1IvFkAupdAwJLYkrs5thABS5WRA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:1001:b0:dfa:dec3:7480 with SMTP
 id 3f1490d57ef6-dfe69005926mr357042276.12.1718280476322; Thu, 13 Jun 2024
 05:07:56 -0700 (PDT)
Date: Thu, 13 Jun 2024 12:07:50 +0000
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <20240613120750.1455209-1-joychakr@google.com>
Subject: [PATCH v2] rtc: abx80x: Fix return value of nvmem callback on read
From: Joy Chakraborty <joychakr@google.com>
To: Sean Anderson <sean.anderson@seco.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Read callbacks registered with nvmem core expect 0 to be returned on
success and a negative value to be returned on failure.

abx80x_nvmem_xfer() on read calls i2c_smbus_read_i2c_block_data() which
returns the number of bytes read on success as per its api description,
this return value is handled as an error and returned to nvmem even on
success.

Fix to handle all possible values that would be returned by
i2c_smbus_read_i2c_block_data().

Fixes: e90ff8ede777 ("rtc: abx80x: Add nvmem support")
Cc: stable@vger.kernel.org
Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/rtc/rtc-abx80x.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index fde2b8054c2e..1298962402ff 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -705,14 +705,18 @@ static int abx80x_nvmem_xfer(struct abx80x_priv *priv, unsigned int offset,
 		if (ret)
 			return ret;
 
-		if (write)
+		if (write) {
 			ret = i2c_smbus_write_i2c_block_data(priv->client, reg,
 							     len, val);
-		else
+			if (ret)
+				return ret;
+		} else {
 			ret = i2c_smbus_read_i2c_block_data(priv->client, reg,
 							    len, val);
-		if (ret)
-			return ret;
+			if (ret <= 0)
+				return ret ? ret : -EIO;
+			len = ret;
+		}
 
 		offset += len;
 		val += len;
-- 
2.45.2.505.gda0bf45e8d-goog


