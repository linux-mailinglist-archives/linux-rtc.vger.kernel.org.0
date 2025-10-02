Return-Path: <linux-rtc+bounces-5041-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E97BB372E
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Oct 2025 11:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA5CD3264BD
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Oct 2025 09:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E9A2FFDF7;
	Thu,  2 Oct 2025 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YG180d8e"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DBF2C15B1
	for <linux-rtc@vger.kernel.org>; Thu,  2 Oct 2025 09:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759397102; cv=none; b=AWcIkvWvJyMCKqah2E9gyblpmwWwdLNvXaShi98Ebcv8bD0UF9KM0EXMgdsHj4wYBpZDF8XWvWtui9YH/jk9IImGhzI/2DZkM4j+wD8Yczo6n0/ulu5WYXCJqc/NOC3NImhp9qytilIz4CmZbFhJITouj3Xm2yHoNYSQ7o4qa5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759397102; c=relaxed/simple;
	bh=wyk+LiOY+/2xhWdko/Utglt2dKK24fcOQB0e8E/SMOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lr2+PDGwNbLF376E/zNNA3kc7HPFqaS+6tmU1uYS+H1S19DV9ibQ/wKukNk8Fn197J5ckQ6ufChAL9wrn9Pj2O2AR3O30HOqeQr0BPFNObG89aJHcAxW8oweQ6G5jAMPU+JQhOauph9Oyqop46MfFSvicY32lDtmYLvzHxApiKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YG180d8e; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57d5ccd73dfso848025e87.0
        for <linux-rtc@vger.kernel.org>; Thu, 02 Oct 2025 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759397099; x=1760001899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cnd1oe+gCOsUbP0Y8B7hIjrdA1ewGBuYtns+fASNVw4=;
        b=YG180d8ehU31W6azkkDPH5yYiB0ZZEXFH5Juq9/HKcxD2oT9WWG7D4KW3v3pzgTonZ
         SJjQ+ZrHyTlCTJHH+10nfa8WVGnBvymYuy7S45mosOrnyQXuvWRsvIw3gcRK5Q5wue1q
         FdPoxP/scviegUFWPCln8dgvbmj4wYtvxlXu85iE9QEF22ADI+vgENis8gx0ZkG6c0N6
         NTks407YwrhdU/d0GciMJABzi+vWKTXI3a555958jJdh1XLZXHukyxZUaXPZrs0kEMc/
         iaO9jzUGc10CUG4P5mN7yvKyWfF3qLcyVMY156/FLS7Hz/aGTFihccOGqPeIvUeuOvqP
         zaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759397099; x=1760001899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cnd1oe+gCOsUbP0Y8B7hIjrdA1ewGBuYtns+fASNVw4=;
        b=tYVCmr651qEwYzkiLtFTY5IhhiW3lA/8B5z9wmuCsXnFQ4O/3tGdf1qQ0pv0MBvdSx
         bkhdVf/2x0Q7bmS5sC06vqiLeQxqlD7YbXtY0L0mpHmZPn2mPAMXCq1SoXrSA7yQAMkT
         CIUOFHgUIe7uFcXaTixr9a0zLXKKbn8c6TfIxAzaoRyH2tfyq/MTnaJtduYpAnRYGMuE
         rFUzmj5lzZqBBO+Qb1iKnum4//yUDXnV8XzJcjgfOrOc7YLJI8dWMdZRC4hLOl3DEz7x
         Gh6P8+5KZphA4t9+ORSEapHRQoY99T7T/DgW9WdTaW14ukgdds8BgE6m3j9WM9Y5o80l
         jn8w==
X-Forwarded-Encrypted: i=1; AJvYcCXpKc/3KuABZXVPR81qtz7XVUdwDEMWAzLDQBiT9dxTXsSUq4AJ3UTULTFr/3yERx95TdV7WHbP8ag=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfSR5emLeDooyGRVhRWafg6BRxVnMasru0dPIRKeHz3boWzJca
	T/GbvUYT24HZBghBCZw6eub8/BWvWsSBxCcqIIAi0DykGI3K7ojCAxzS
X-Gm-Gg: ASbGncvZpR1QfGU/Sb1oLtCY7CAk4EE3xVVRNNdGCpE3Ohpfp5QeYwC1+QQPqLvfs23
	ky9SHWINz1d5tXzpgEbm7FnzWpRTxeRY6VRa7sThOC20HyHx48RXuoBn7IvuWNJogOLltH0eGm3
	fJ1GNGGAaX8XXsaRGM0V08v65e7glHAUxX11lWWBMh/eSsfNIWn+eIW1OcWopZON/Pmiez8AqRb
	fZc3kgd1rH+pvFokrCKKQxqto1D/GVCMEXvED4uqbiT0FbMfuFZzmzfqRgIde38lblFORfRTOIn
	PFtAAXRDootxeeNt6IrPMyLveeP3yc4qY+s44aVVeuUh9jUQZjBqBMKIUiENdxFgu2tXFz4r8fb
	Qx3UI5GGKyHcGUyuG+PDnvg2hq+Q5a4rNyzXsF1UBeZIc1QY/K9PdHOqZLmMpfIleu6iiTn0vZ9
	en9B7N4kcn6eT1WSGTUtEgjnArvx7Q/igRUV8cEOtv
X-Google-Smtp-Source: AGHT+IESR5YgtJIt0LMDa26rTnIZwd70OvmJPXrkYGT8voRp7WuzaTPAueJHEK1uF9O71i7anaaZGg==
X-Received: by 2002:a2e:bea4:0:b0:36b:9ecc:cb36 with SMTP id 38308e7fff4ca-373a74829bdmr19011161fa.23.1759397098830;
        Thu, 02 Oct 2025 02:24:58 -0700 (PDT)
Received: from localhost.localdomain (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba2e1f37sm5575651fa.19.2025.10.02.02.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 02:24:58 -0700 (PDT)
From: Alexandr Sapozhnkiov <alsp705@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] rtc: fix error checking in wdt_disable()
Date: Thu,  2 Oct 2025 12:24:52 +0300
Message-ID: <20251002092456.11-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexandr Sapozhnikov <alsp705@gmail.com>

The i2c_transfer() function may return an error.
Ignoring errors returned by functions is bad practice.
Especially when these functions perform core functionality.
What's the point of continuing to call the same function 
after an error is returned?
If the second function call succeeds, data corruption will occur.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
---
 drivers/rtc/rtc-m41t80.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 0013bff0447d..b24d09c57816 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -677,11 +677,11 @@ static void wdt_disable(void)
 	};
 
 	i2c_data[0] = 0x09;
-	i2c_transfer(save_client->adapter, msgs0, 2);
-
-	i2c_data[0] = 0x09;
-	i2c_data[1] = 0x00;
-	i2c_transfer(save_client->adapter, msgs1, 1);
+	if (!i2c_transfer(save_client->adapter, msgs0, 2)) {
+		i2c_data[0] = 0x09;
+		i2c_data[1] = 0x00;
+		i2c_transfer(save_client->adapter, msgs1, 1);
+	}
 }
 
 /**
-- 
2.43.0


