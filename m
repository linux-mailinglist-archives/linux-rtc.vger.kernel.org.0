Return-Path: <linux-rtc+bounces-1282-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 781CB904DAA
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Jun 2024 10:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14153B27557
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Jun 2024 08:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CF816C86F;
	Wed, 12 Jun 2024 08:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X2FX80A+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7780E16C84B
	for <linux-rtc@vger.kernel.org>; Wed, 12 Jun 2024 08:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718179720; cv=none; b=YCzI5cETcBE1ivvGx7nkq5s6k3DES/GYMwIPSZosnFO8G7okyI4ZvuLbQNUYOLPC3ulH3pEIEUtZVyR1YUTzpOfy9Cf27PC6i1wqbpI7DHcA8mlQCbc7jgZz5iAbeGTs9SGSgRovSyuebP1cnp9E8ZLlxtGQZ6A3E3VvSfNPLa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718179720; c=relaxed/simple;
	bh=em6ArzsA1tRoEmAp99yMuwK6zz4EyOuG0naI3YxS0zY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=IjumMsrkWOlP3QdZecp7U/QWte2ojibFJN4fTM0K4tNgN9sv3uM1koiX5/VO1G+dSiZQnWivWMn2/DwiiTkfYADVesDB0sidWwVO1uS+UiHahhG+WvA7xN5zCVLO47f7BpRkEMi8uTRV3WKhHLTpFKSyvvRNGsrMnWvXbUw1IV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X2FX80A+; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-62cf6040b72so76045487b3.1
        for <linux-rtc@vger.kernel.org>; Wed, 12 Jun 2024 01:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718179717; x=1718784517; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D7wZcftQ9M/yW4wOMYmHU4YilbwPgD+FPr90gUkx4Jo=;
        b=X2FX80A+3BD6G4gmpv671EYunMRBPnvJ8Xs7m1GmjKbnGPCoMmvAkPFqZEpyFfTUfD
         OOutjUz0OX1gnPhq9YdAssUmRF4IUcjJC96U148zEBBfmci3sFSdI8Gt6umYkmjvCHsY
         9CCX8Gg6xYBfLoHZ2JxH2BE3tGCLxXgN1g2R4LFeienEQGLx6qWb3p7RNgygaFSGGpqP
         ynrob8T9rk4P1cm65W+xUaRb69+NeSYbOgUHHJ7YsowjSQ80sJOVYCMu5nKsF71at0QV
         UxTeh1irB3MUeG0oeKNfCL0bbT2Pld6jQxvnCsS/WcNF7G3pR0L3NP202Dhva0Jw86bj
         nHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179717; x=1718784517;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D7wZcftQ9M/yW4wOMYmHU4YilbwPgD+FPr90gUkx4Jo=;
        b=GHHk8RNP+1oZaSLrK9Kx/jdcpakJX8ORmtSlm/J81adONy9ZkfPHkxRVMq2FSczv20
         7sP2IwSTp4W0HuIbwv09qjyBCUwWupRIbRGHxpd4eFK6bdiVdlLfZTvjLn1lrGQDRKD8
         7aGj0MosgBZ4xMt6j0teuTpcVWzOzo7q5d3QlAS1YlR1LypWsSkk38PhvUY/BJUOMS1F
         fqB+z+9z/iOaJHMxCwMEwJriZljIcswB6BJRV1p68XDwCwfSNV/gVPaVQa/PIm7qRddt
         ZLxKzt3zkebskv9+/DuOqEmD+XiVn6l4im2V+Hfm7kGNHFnw5YR1NCFYALfljZLC3D4A
         wAiQ==
X-Gm-Message-State: AOJu0YyXtEUt+zqIt76QuzOPbTmeeQ8jxwaGFs2ESWwa5w0XYgo7Ytia
	6GkVXcThXsCCRWzBbATrkeHLAmhk3cO5KSbIHPKd7IPvJxjQRGPDJrX75Gb0+oVPpYeh6gKfJDk
	HW2OhzufYYA==
X-Google-Smtp-Source: AGHT+IFih9KOCmkvGDr3QYIZoisL4WxR63SjUfwB6+Hinvi4meZpmIs024F5z0kQ/rRtn5JXq3yWrK9EA3jC2Q==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:d8f:b0:62d:42d:5f73 with SMTP id
 00721157ae682-62fbb6fb1b8mr3478157b3.5.1718179717496; Wed, 12 Jun 2024
 01:08:37 -0700 (PDT)
Date: Wed, 12 Jun 2024 08:08:31 +0000
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <20240612080831.1227131-1-joychakr@google.com>
Subject: [PATCH] rtc: isl1208: Fix return value of nvmem callbacks
From: Joy Chakraborty <joychakr@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Trent Piepho <tpiepho@impinj.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Read/write callbacks registered with nvmem core expect 0 to be returned
on success and a negative value to be returned on failure.

isl1208_nvmem_read()/isl1208_nvmem_write() currently return the number of
bytes read/written on success, fix to return 0 on success and negative on
failure.

Fixes: c3544f6f51ed ("rtc: isl1208: Add new style nvmem support to driver")
Cc: stable@vger.kernel.org
Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/rtc/rtc-isl1208.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index e50c23ee1646..206f96b90f58 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -775,14 +775,13 @@ static int isl1208_nvmem_read(void *priv, unsigned int off, void *buf,
 {
 	struct isl1208_state *isl1208 = priv;
 	struct i2c_client *client = to_i2c_client(isl1208->rtc->dev.parent);
-	int ret;
 
 	/* nvmem sanitizes offset/count for us, but count==0 is possible */
 	if (!count)
 		return count;
-	ret = isl1208_i2c_read_regs(client, ISL1208_REG_USR1 + off, buf,
+
+	return isl1208_i2c_read_regs(client, ISL1208_REG_USR1 + off, buf,
 				    count);
-	return ret == 0 ? count : ret;
 }
 
 static int isl1208_nvmem_write(void *priv, unsigned int off, void *buf,
@@ -790,15 +789,13 @@ static int isl1208_nvmem_write(void *priv, unsigned int off, void *buf,
 {
 	struct isl1208_state *isl1208 = priv;
 	struct i2c_client *client = to_i2c_client(isl1208->rtc->dev.parent);
-	int ret;
 
 	/* nvmem sanitizes off/count for us, but count==0 is possible */
 	if (!count)
 		return count;
-	ret = isl1208_i2c_set_regs(client, ISL1208_REG_USR1 + off, buf,
-				   count);
 
-	return ret == 0 ? count : ret;
+	return isl1208_i2c_set_regs(client, ISL1208_REG_USR1 + off, buf,
+				   count);
 }
 
 static const struct nvmem_config isl1208_nvmem_config = {
-- 
2.45.2.505.gda0bf45e8d-goog


