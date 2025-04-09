Return-Path: <linux-rtc+bounces-3852-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2892A82D43
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 19:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C861A4633F0
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 17:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674FE270EC3;
	Wed,  9 Apr 2025 17:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKrA4i6s"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE01E3595C;
	Wed,  9 Apr 2025 17:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744218579; cv=none; b=Gtnb4HN1xfeEP6QUtM5J9yxMSga7e067yQNN3JwZF+2WAggMl4lGS+pc+WxoHmJMsnBUWsVoRcYRwLDJItSSwsIZf0NsOtvJyq1HwrhSY/MUyJjNaSgaL7uWdou0PIAbLkOrgb2d8YOJO+HUwQgSLtoADJITA/OQW3dMoNoyrUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744218579; c=relaxed/simple;
	bh=u47LRbAb12RwSEYn18v/KvEfrwIH+L1i+MOjeyZ6vF4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f8ylNrZsGjzlOosyx7vV6XE/mW+PtVa1yFEWgd2EvX0CXO6t6Gx2HTNwpCWMdQvHYutmRBSk2woNfCTOoQO2mUVST9n0AhB01UlViNGVl4/zReLVg1omyQJZwiKN65N4KeaI84eTvRH6F3xFL5vVA1bF1uSPhah02VNEwokhGbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKrA4i6s; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abbd96bef64so1359526766b.3;
        Wed, 09 Apr 2025 10:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744218576; x=1744823376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fOYjKfRJIeNYlAEB7lg5KXPH2nW3Pu6snGJAUKPZ5ck=;
        b=VKrA4i6sgUEK9ngYF6rvehq4V/VqIyvpUiIqUsvYTiKEo6kl3e48wEWhy3QXUX095E
         9jrcgxeCVxfySH0VAyfpBtsk8ZivOS/LKgXI80FneA+HlMHPjd5ReuTnB4baPu7Fe+gd
         VnuOjOuM5z/2/j5oibbpWvi5zEieVkDm4OIat7IbT1cEfwPFKHz4eVIZz/9YqKC7zvH5
         ioQT8B4tGJ6GYpT8FCTZZu6aHRSaxYY93XqIevfs9IndTgprgGKMiXz6DsO2SMH8XGap
         oD5pbnq11wFKiC+jUxnr+8RzCOPjGHgRER7ihDU9przK0VcZrrq2B0P7ViETpY4t8Auz
         +PDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218576; x=1744823376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOYjKfRJIeNYlAEB7lg5KXPH2nW3Pu6snGJAUKPZ5ck=;
        b=PgUMFUovKNVYkK39uT4k7DFZpxMtgRb/XgifCt/3igEoE6nnwO+hVglfr0miOvJAe2
         2wsqg/H1CcgRZdbYsBL8q8XQ/H6+w1fAScj0I62NDKtw0RvcDJIVNYW4MObOaEhuuZwW
         l71VoKUT+/48GWEBWN78u8ct4y9vG875MPGqkIUTEtAJ39O7xHW3xn/g1khrs95l/IH+
         jb7jWtsJmVT9FqLN2uijEW8ZuVmxCvzb+DXOdQjyIdrNKR8FbRAqRx/yRZlRipR/hlZT
         PIDy7oouhG3f615sw4lALxYE1jsS5x5V4jyh4QSmfmMdM4H7hWGxrPplGzq9Pbg62Mhk
         7pgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtkFPbtHBhtaAL1qapHdHA75sxJtX4id39PY77MltZajj9K8w5mLEJC6lneaL/xD8tV1XYL8+exub5qnSW@vger.kernel.org, AJvYcCXkwyCEoyT7hBiUnaNd3TIzQSFpozlON5hqRVcsJf5UlPlWQ0YtaIOdMBZZ0353mGvQwWcQIn9LCx0H@vger.kernel.org
X-Gm-Message-State: AOJu0YwMnV50b07GSJ3H+tIqflMiLMFNQf9Ap5zabu5BCbr+d1KtXjqD
	HCfjQ3sYfPPns8aWerFvHo45Ck00PFS19ot9wjqa/aaV0ncZ8OyX
X-Gm-Gg: ASbGncvc3XGXm+F6m4PsBBuNeTsz/ynZQ1sHn+Z1qqSW2zmGKjQMIl7+e4OiDdwYuA/
	UmeFxDovybJlFZs12xnTgz2vlkTg9TIbq0u5DDSPsKanBiZMpBcfDKi3K7y/umrE9pW9TDtoccE
	u2Gtq2Q1GWxHK9vmgZIzjlBGWFXOIXWUwFfJdDUoLsSFJl6cn27yCowv+xa2uoRklmcG+++0P5T
	P9Dzkt7gDYh+0W6v5AMGqxjBXYECv2oCBsroizq+Pm5nLBCBFtJoynaraEHZIV1j2w/5A6GR1ib
	nt5l0zkT+VezYlycvn0h94OuzUpomxgJ4adRB7OqwBr3w61A7hayTlPClA==
X-Google-Smtp-Source: AGHT+IG4Aye/FWSkMyzZMixcZGhO6/RplJZBqme+gmKeeI8soR/n1mGEHeOt1o550g08XY5lUaRlGw==
X-Received: by 2002:a17:907:7293:b0:ac7:391b:e689 with SMTP id a640c23a62f3a-aca9d728cd2mr297232366b.59.1744218575778;
        Wed, 09 Apr 2025 10:09:35 -0700 (PDT)
Received: from localhost.localdomain ([78.209.27.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be913asm122151166b.47.2025.04.09.10.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:09:35 -0700 (PDT)
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
Subject: [PATCH v2 0/3] add support for RV8063 SPI rtc
Date: Wed,  9 Apr 2025 19:09:13 +0200
Message-Id: <20250409170916.47224-1-apokusinski01@gmail.com>
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
Changes since v1:
* pcf85063 driver: drop MODULE_ALIAS, add id_table
* dt-binding: add "pcf85063" to the commit message


Antoni Pokusinski (3):
  rtc: pcf85063: create pcf85063_i2c_probe
  rtc: pcf85063: add support for RV8063
  dt-bindings: rtc: pcf85063: add binding for RV8063

 .../devicetree/bindings/rtc/nxp,pcf85063.yaml |  33 +++-
 drivers/rtc/Kconfig                           |  21 ++-
 drivers/rtc/rtc-pcf85063.c                    | 175 +++++++++++++++---
 3 files changed, 192 insertions(+), 37 deletions(-)

-- 
2.25.1


