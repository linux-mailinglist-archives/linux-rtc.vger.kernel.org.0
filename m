Return-Path: <linux-rtc+bounces-3915-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D075A84E14
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 22:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69B081B646C6
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 20:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB28B28EA79;
	Thu, 10 Apr 2025 20:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCtBvB98"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632B1204C22;
	Thu, 10 Apr 2025 20:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744316615; cv=none; b=rzIGfvt+SfSutg2s6PeKfosHhBob3RbRerZSvb2vhMCTIb2Hn/3rx8qWG/hGROe5WkhQ13TxpGPh/yz0wGT3/8qfAzLgp1oLqdu4iE/TtiBt1TxwXA8hSGCFGYD0+RWNnWQT6miA9BKnc9xSBE/HCMiTKecGrnW1g//H8fExXcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744316615; c=relaxed/simple;
	bh=0ysjkjMrCNE1qykfEFcYt8dHZoxl3XQiGN27+INjPqo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SbeD01tFpBLs0Wd5jqvMCdErAFD0PkO1WWyS8OkCNGCV3YRI2zEl/ji9tdZUGURMU1mC65ozp8rHhhmGfaKO+PfNier4hQeqYgSj1OFrIHMl/qtqze57QutfbXNF+XSiNhUGf1b/CZB3PKlt0Ftml6nt82oF7lLSucukxBdZQGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCtBvB98; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe574976so9642805e9.1;
        Thu, 10 Apr 2025 13:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744316612; x=1744921412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yf850S5YDeUoJJbjRWK1Kv8/zkHZ1xZyrcAz4CzuC98=;
        b=MCtBvB98tLjScNR8Ta3x27FO0pkFCSZCfb1VHTJkiDOtxj5u3eikGEM0oVF/7kcm4t
         q0GwMKbUvWwtA1OuLd1XyWPiX3t3MAu3+W60alOrnEG/q6usW06V45TvC3+Ym0TW+LhV
         qEiZV5WtLYOnx4l+0DQ9+R23RNgdrqRJMQ/9lQa0ibp6w8/R8EECMG4KWEpIBu1OZdMA
         QUA/jN4DkENEWRt+wv5wuFhwGAEYDk92GFYuXN7NwVFgdQIEvf1Zv1SV/uxg2xdFAhCy
         GJhJDcCCtzVAceHTYN2E9T/CdXVJKe+NbsgH8AX3jq3oJeaBXLm5bWRfELks+zTD4ZfG
         fsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744316612; x=1744921412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yf850S5YDeUoJJbjRWK1Kv8/zkHZ1xZyrcAz4CzuC98=;
        b=keefHxAK9kXSxmVdXqlpZ3LhQl9zlJ8ToWaqIo5bJMohg8c6EUDopiAASgsS3ADkZZ
         YA58ln4FVUojCOE8gZdl9X5ZRXx4Dd0PxeKDsJEnFPJNqpIALZ6BIOzpmNd/GAcRO9oD
         KygN6Wm9+YFAQW78qKfjI5g3JxkZI+ZCob2zRS4/O6TFGBbgDd7L4FyotXCHCq9fDIuq
         zt8UG7ir45EnipUj68iISelRUxQi9h+Jg3VGhhh4Eq78uwcjnoSqiwpOR3CD12dsYO+E
         mWut2ltrtHfmqzvj/ftrfxrOlM7hMf8vZhTW4RWBRFnu1ckB8G7KKCiByq7Ggfwn1izU
         4GYA==
X-Forwarded-Encrypted: i=1; AJvYcCWw7wHehsYRDq01m02q7AiHIqG+b00FEulYbYT6qHwPg7eQf0EqeXv9Utq021RE9gi8HGZ/vQqrKz4h@vger.kernel.org, AJvYcCXM1Gf6QMtKVRBKtX9CcZA+cc/TCR6BrdvR3W5kDwXolRcpOK18rFhTherss2A4Vgvrbk8B/ISRo778P3KD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/pXP+qhjkMGFPzfmaZF3jmjRb/BIdFPwwyPPRUuA6Lu6Bktom
	iOMZgFjSb04o7njhRy54yBYZoRbSnW48IG5SDf/OTETTWBVQliTw
X-Gm-Gg: ASbGnctuPsN9QMQH0gwSsQtwaiH0bSli7sryBF+TjZlxwfD28wZH9ykJs36jaf5gc/c
	aMQ3HN36gGHViNfDGgt7jm276Px1wIM47jSucNo0Ti1q61pbHpmZBDg9Lc94/BdIPAUnck3n1bj
	byqNRhqZcKL8ju7tD8baPx8AkK81Th0lUE2JJR3WoDEk5nDsXRXcicDsY6HXsg7mdSdk1xI1rug
	ISldou0t5XFBH5pZnnn3fChOKE6th007DGoYeHSM+FcY7X5eiPrcxwg0IWlvls+yPIzWlTi01kn
	tx6M7sHnTLMQpHI5JSPQPiltK3l1sxXzXFrQt1+cYatFlYt4e689OPpkxQ==
X-Google-Smtp-Source: AGHT+IGwjmKQx8mEBXlbkW8Q9mkXwfZ3BPT5Qu22yuokV4JJomMthx1ynZktMKLrCLWs0gpvxaFEOg==
X-Received: by 2002:a05:600c:83c6:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-43f3a7d872dmr273285e9.0.1744316611474;
        Thu, 10 Apr 2025 13:23:31 -0700 (PDT)
Received: from localhost.localdomain ([78.211.153.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c817dsm60998745e9.23.2025.04.10.13.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:23:30 -0700 (PDT)
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
Subject: [PATCH v3 0/3] add support for RV8063 SPI rtc
Date: Thu, 10 Apr 2025 22:23:14 +0200
Message-Id: <20250410202317.25873-1-apokusinski01@gmail.com>
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
Changes since v2:
* dt-binding: send as patch 1/3, not patch 3/3
* dt-binding: fix indentation in spi example
* dt-binding: fix order of enums: rv8063 before rv8263

Changes since v1:
* pcf85063 driver: drop MODULE_ALIAS, add id_table
* dt-binding: add "pcf85063" to the commit message


Antoni Pokusinski (3):
  dt-bindings: rtc: pcf85063: add binding for RV8063
  rtc: pcf85063: create pcf85063_i2c_probe
  rtc: pcf85063: add support for RV8063

 .../devicetree/bindings/rtc/nxp,pcf85063.yaml |  33 +++-
 drivers/rtc/Kconfig                           |  21 ++-
 drivers/rtc/rtc-pcf85063.c                    | 175 +++++++++++++++---
 3 files changed, 192 insertions(+), 37 deletions(-)

-- 
2.25.1


