Return-Path: <linux-rtc+bounces-5962-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOpLMm/PjGnbtQAAu9opvQ
	(envelope-from <linux-rtc+bounces-5962-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Feb 2026 19:50:23 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDAB126F2C
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Feb 2026 19:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 984A6300F5F9
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Feb 2026 18:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E972352F9A;
	Wed, 11 Feb 2026 18:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXxZnhqV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A482F288C2F
	for <linux-rtc@vger.kernel.org>; Wed, 11 Feb 2026 18:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770835803; cv=none; b=GwvFWqGjCjqnA9/Cvp7g64hkTzx9b7DzYrvVw9sYsy6Brv4TwSQXWpwbFCJkkR4fpVVmWBgemtGtDWNNVcK4K1apAP8NK9qaB0Zg/Oas0wmeubja16spmDFFwWq/kPPbg1bonDytnXZefNHuS0moYbMhoXzkKdT4CRkpu+Ehi1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770835803; c=relaxed/simple;
	bh=J71dklxyEYDYf5YTi6cMq+9suDt7pHWpZ+XzWgD1P/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CLKiEjCVtwcVMQD/U/3I4MSJcMX7/tK8Sgj9KGdm064fbXhxERMVadJHcL0MUtvvrKD6UCOZTbV6h9UFKHO6eejZLkOAoyqYWENqte43vEhr15dwRDD5Kv+sctiRNRjfFCPBwkEIqBSr+eodhuFqg+gh6UDVDdlDXO5mQVlw4gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXxZnhqV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so27621765e9.2
        for <linux-rtc@vger.kernel.org>; Wed, 11 Feb 2026 10:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770835801; x=1771440601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T3VFsLlcQS6aLAnq2infiT9hJS84OXuJ8Yy2tiwsBck=;
        b=JXxZnhqV7/FeKo56f2TFWCcjFM6tOxQzxb+Ik+LqDkUKhuMxGCVqglaHaRJV2FAH9Z
         Sis9Vc4kw7Tnb0Cbbj9PqPeCfwzfF9/CEfld+MGa5tTKadiYexEDRp9dCIU3253Bd0w+
         kPV+zNqgwWMBX1bFS5giFBFY/Mup3XOhMz15wTkQmbE/qFuQTgv1GnrrLapap+3MF1n1
         RgnFRBUqp+l8HP0dsWFCNOdeEwdAeB5uDwgPjf5RuXDTIr1xQDX6hbM/Wnrs4szqzSNG
         mtTfYI4aX5+QRuAXDcesvdJxP0jnRaF3JB6CrW+0foaLf3nfR2QlE1H3rq3s6yVPEGd8
         1usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770835801; x=1771440601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3VFsLlcQS6aLAnq2infiT9hJS84OXuJ8Yy2tiwsBck=;
        b=a4mvTPgyzdVjaPVTV3zaTeTIWPeYxoePDFgmYDXIOcsiZYKqoCAX3AV6KZU8sH5x9L
         1+5f/a5ysTMWn+ol1G4NMZ5b3Ypry1UnZ7XUnEkDvmtKpNXOmyRMNNF80tcucPE7xMeD
         7nrGccMF1mo/K9Iq3SWZmRSlyyGxSKmv16EY9jazMkJxqY74FC4ps7ndsnVknVhuZvpc
         Ur4nLl9wmWvYDbn/+fmqXeEDw6dwwRDHt7dVoMakmk6j9HQ4k91stPnxZzJe2XGBkN/8
         qeq1NP9kL9t10lhzphyoH0DyvbwrhJXSJ687tFrxQwLyldXl8Zob269KuSob71030TQO
         eBew==
X-Forwarded-Encrypted: i=1; AJvYcCUcc7yEKDPu4X90nW7OzFCH0hOCDrQ4VRVc4ZNfBRCj60R/dcatATbbrrapunVCLxWkLzcPDmhYdG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuK3lQoCvqcT3ifn7gH6hW7RZHuwLLbO7YXh8X65/7K/gxr/08
	AojuaYtBCJh6LlMw4Z/HnlJyTqFglis1GSqyy45AZ8amik+Hc6hqrMou
X-Gm-Gg: AZuq6aKfmfo8GH2wO8bzOhGRvkjmHVAPFD9HZU7ZjI9ox4xtvSweH5+PsKNSUikrwO2
	BjAihYRGW/Ie9UAb4Ts+BTMx/x7gRtlC3qn6wz6wH5Rfa3nA7pPiHmAxnMZ9oxlslpZOQTJpar2
	pEzr2Nd8IxDbr6JV2YnFAflsX5QqDWH+KhLFDdCPUOwF7eTGFf47+pp3qoJxP5NcMY3qUWAOVER
	1vKOF3kz2wOKIfexNBCwx5WcVZGk2eli+QbcoijTG4jZw+gsqRM75QJZI6/9VZdid+csV5nsgwE
	LWIfcGAgDjotphlAHMZqQj2ujnBlRf9EyOcbmRFDkjrdwP9FSSZb+vaqCyofvVeH9PI5JjN6Vqq
	PaguBVIFwtBuQlfkkdel3Co6dHZ4hWeicR0M7P4CxOb4eArRpxb/EUr9kXY2Bt4l1A+SUt4HVSL
	NOTDn8NJVz3dtsmLew7oeQ23I=
X-Received: by 2002:a05:600c:3490:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-483656b14f9mr2608675e9.2.1770835800818;
        Wed, 11 Feb 2026 10:50:00 -0800 (PST)
Received: from xeon ([188.163.112.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm93175855e9.6.2026.02.11.10.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 10:50:00 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v1 0/2] rtc: max77686: convert to i2c_new_ancillary_device
Date: Wed, 11 Feb 2026 20:49:39 +0200
Message-ID: <20260211184941.6756-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5962-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3CDAB126F2C
X-Rspamd-Action: no action

Convert RTC I2C device creation from devm_i2c_new_dummy_device() to
i2c_new_ancillary_device() to enable the use of a device tree-specified
RTC address instead of a hardcoded value. If the device tree does not
provide an address, use hardcoded values as a fallback.

This addresses an issue with the MAX77663 PMIC, which can have the RTC at
different I2C positions (either 0x48, like the MAX77714, or 0x68, like
the MAX77620). The MAX77620 value is used as the default. The I2C position
of the MAX77663 is factory-set and cannot be detected from the chip
itself.

I have tested this patch on LG Optimus Vu P895 with max77663 PMIC and
non-default RTC position. RTC is registered correctly.

Svyatoslav Ryhel (2):
  dt-bindings: mfd: maxim,max77686: document optional RTC address
  rtc: max77686: convert to i2c_new_ancillary_device

 .../devicetree/bindings/mfd/maxim,max77686.yaml   | 15 +++++++++++++--
 drivers/rtc/rtc-max77686.c                        | 14 ++++++++++++--
 2 files changed, 25 insertions(+), 4 deletions(-)

-- 
2.51.0


