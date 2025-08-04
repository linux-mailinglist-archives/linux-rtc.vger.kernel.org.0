Return-Path: <linux-rtc+bounces-4640-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E0B1A6A9
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Aug 2025 17:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7954162576C
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Aug 2025 15:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0CF26CE1A;
	Mon,  4 Aug 2025 15:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V93N0ZkI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891E21D8DE1;
	Mon,  4 Aug 2025 15:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754322481; cv=none; b=mG72hQ30kAJcufnGU2jLT12H3qoCAA9M6A+zPGs49F5h/q7I1F6yqmsuLWUZb66S+m6Qo+odIVOWRnWsFdkRTnQEAFRXqKwH8N4G85qoCTFuE+IDtEjQ11PQhiWM6L3pTrSRziyPv2up+Xo0+yRzZqzc0jFIxdv8tCjjD6XJBmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754322481; c=relaxed/simple;
	bh=K8Enc7V38mQEjPkxfmfVwDGwsvXWD44wq+JmNktVuKg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JyyxRlIlY/iIg6fO2uNSvz3FkcMl+4G/9XhkHj0NSCoPhoXZNvd/0Z7hRlIVO0xLVor+mYIeULEOgOvUaW8vF0l9pM+0Isi6aiUOnvMXzgpwWpKMsIFKzrNDjsiFG5JGnfrr3ouTMwIDvl9kVzmxmtMV4gEhl2L092ES65/q6kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V93N0ZkI; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6154a5344b4so471731a12.1;
        Mon, 04 Aug 2025 08:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322478; x=1754927278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=391okEZQgkiN5U3wf1kx/JWnB4oK+nQqVxWPh/vDhgM=;
        b=V93N0ZkI8EcY9SHAC5e/l6TSDu6t/XtxwVuo5vYzjzXvwBhqN/Jc2lxS0PcIiNhZLX
         5covc0aw/88ixumdGO8OV1aXovP0LAYv2D995xpWFM0okQv+W7tsHmeFTQZNkE2mhHc9
         C3vjT5bjwKjr6gtykX+q/v7CuliZYMIvun8/dOmHYu7eTw/1RgK85rOK+mWqasUmcgEL
         teSoH03EZ8MHATVbAHZyvTpQbRaJCQ3ICwOpBkDFvO8GGVQgYO0Ab7DqXiDsjsND1LAs
         60U58faGSAnqGIu53DYFOw9Hu/L7LtZd5uj7rYnmNW4Xwz5np57uKkzXauNdL6RM2xon
         isqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322478; x=1754927278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=391okEZQgkiN5U3wf1kx/JWnB4oK+nQqVxWPh/vDhgM=;
        b=n9P2oGHDFCFeiFr+zhLvblhWeP11n6AhPkEF1d1tIQJ8FSNQ7+t8csIOkAei6wzTUY
         +JfW0Lc56Mwct1ZxMCHozi+7gLgpJJnfSc7DTP182Wc1DvzPzh7dDA/tEwCs1kL39i9B
         ygl3g8EMUSPSmHoXAVPhDqpBGVfBFw186HwhKnDjXBhvD5oBD92wUb2Z8pZRfmf/PnNG
         BVUkO9xYk3xGqmm8eZmEVpczZqNFMYEadx1+43c6P/8X+m3qAiVLeleEAtk8HzQYBpn5
         qO03468TQGwrFNg369DI5A9auSt4EFCInmdDsoe6uFEdVUnj+lavQt7lG8DcY7Yn66HP
         W+dA==
X-Forwarded-Encrypted: i=1; AJvYcCUhPRwW2uuh+r2jTfIdQdKf5LFXiRM6/zs06ypxfhhLOzFX7nHSUD/aQaTUtj27eFgkR1E6hD1SY3VJiGE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi9g6Cqns2U7zq+/IVKq6rFSdE1nttCt+CgGeeR39iWxO7eBMr
	MEGFesgX7rp8TKaqSTUwfIIIhVhmVceXCvN/RS3S/uBJCU3pgAvo2RfF
X-Gm-Gg: ASbGncvwtu41tuJmFBWMZwrfKotYRKxsJgstLQ02Hi7Fwrjw9sDy8gTSv5zQkCZmqGp
	4UFAWyF5n5swTmvac70Ju9EBn+BnMe0/A+uGcFg+XkeaAshf18Ff0aiiNHBtgREUou+PAoVysBl
	55Ky3WWadukUilSZ/QCayN5qMxb6Bwplu1fS/dheKlhYX9A6AZU+YP1WpvkQxGMtcZijAgyVvQb
	iYkAEOUmBFQB3LTa4TtgG+R9hdShesFpvS/z14ywKl6ChsS/z0BWf42yQK0zn9qirZ+UtOJZbO6
	QCTHb4GwD4z+i1NNOzBB6atCclB/YSE/TibasJ/kqoaxNW5hSj8QS59qUBUVB9hD2Se5JC5tk6U
	bWJ87vMrVwb9nyRwEaFztIQAlYqw+js8NG3vyfmd8i0QQw+Zc8Vic14XI63jvPe8YrN3E
X-Google-Smtp-Source: AGHT+IFuz9oveW+b87s9798g44D9ohpUR7KqQc0AdJN3W/p3dphpR2bNuov/UrcGKhKrQIUxymTgYA==
X-Received: by 2002:a17:907:98b:b0:ae3:617a:c52 with SMTP id a640c23a62f3a-af93ffd4788mr430320266b.2.1754322477478;
        Mon, 04 Aug 2025 08:47:57 -0700 (PDT)
Received: from localhost.localdomain (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e8306sm757276466b.83.2025.08.04.08.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:47:57 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: alexandre.belloni@bootlin.com,
	michal.simek@amd.com,
	srinivas.neeli@xilinx.com
Cc: linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v1 0/1] rtc: zynqmp: ensure correct RTC calibration
Date: Mon,  4 Aug 2025 15:47:49 +0000
Message-Id: <20250804154750.28249-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We've observed intermittent failures with the current implementation on our
Xilinx hardware. These issues were not present prior to the commit
referenced by the Fixes tag, using the same hardware setup. The problem
appears to be identical to the one described here:
https://adaptivesupport.amd.com/s/article/000036886?language=en_US

Instead of explicitly writing 0x7FFF to the calibration register using
devmem, the patch now resets the register.

Ivan Vera (1):  rtc: zynqmp: ensure correct RTC calibration

 drivers/rtc/rtc-zynqmp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)


base-commit: 260f6f4fda93c8485c8037865c941b42b9cba5d2
-- 
2.39.5


