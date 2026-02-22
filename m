Return-Path: <linux-rtc+bounces-6002-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EF+FC1/dmmktlgMAu9opvQ
	(envelope-from <linux-rtc+bounces-6002-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 11:41:35 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFC916EDA1
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 11:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04CAE3011BC3
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 10:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7D1189F30;
	Sun, 22 Feb 2026 10:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INTO7122"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD51226863
	for <linux-rtc@vger.kernel.org>; Sun, 22 Feb 2026 10:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771756891; cv=none; b=HfJKMKt9dZWiOghsCerRKvZiRV9gLvd3plWfbkRNq5I9iPpRBF/s/yxyieizl/TviLLzzveMqDIj2LFLqkk+xRwmLidLgHZvKS5s7lzR1msC44dowuD9cK3iUzl0/RzKPJJMpjM6YimepepUm426soVoGu/Wmrqyu8OpssFbOt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771756891; c=relaxed/simple;
	bh=FiNNBmyLQdXBFATIDB0b8nfQtkqDYNQ9fPbTqEZkvYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n9ArcozE/kEbE9azM8M6QDGyMYhnc0cwtOKu+GBftTI26aK/yylpeW3fgIG2RzlwPNQRw2921rgHz/McEfgPDgHlyrsHCoPUbFYJvYL8wO+ykNkDLa017XCh0rbehyEbFP41u37ZAqQ/q4TQabCzA1O/G2KrXDpQesFktElZx5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INTO7122; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so18925205e9.3
        for <linux-rtc@vger.kernel.org>; Sun, 22 Feb 2026 02:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771756889; x=1772361689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t98mLj8w4amE5ycgxlNBP+sdq7EJCJ2CztJb+0KFU28=;
        b=INTO7122p++mLbYa/2x98TGl1Q3dMkNRu7wBEownErQzzFONbO4WufoQeMSuKJOn9y
         /kS38GI1kl/irzqn6v4wGwgxWGey6O9V/DEBQrRfjF50ZVmWlHRWSHcizhkP+yyXfRyW
         hVTUCU6AF9u480zyJtlq/8P3BB3jeexsegjL2WeZI4pkM/Z36OaJzQ9HN3mmQ7GNJgug
         /Ls/IDBCnsEzjuEawuSwbjQaQ+M4dzvcL22jn67bP6QuZs2stbHfB7PxIUvv/9tAuWh3
         I2h2HmvavsVEAXL6Eyw6WS9/f7dpzQR+KrSnfgitjJ0UUV1D0NsH+cGeygTZFGsbcuUm
         mAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771756889; x=1772361689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t98mLj8w4amE5ycgxlNBP+sdq7EJCJ2CztJb+0KFU28=;
        b=EZHWMxGeXV4+ydX5AQ/qdEj+OoRcwUYPbFalWiKB7cPS/MYNP3DbodmzIKH6AyESxB
         ddxX5vXamC980GOSEREJ4aQz7jtpY5fbIn/1hLshonaNk6jF9F0vbtXd5Ly6Jom5eypA
         bqLitqMYVfFd4v7Vva0OLxyktDNDVTgmYisKuYaeHsDlgGe8mzrP3HO8OlPErkPeR/ZB
         UGRUzOH/w6J5Ot4B3Jun+3vzXivErsnU95IJkNNdBVGFTiJdAhm3b9XjvWoStYUJ0nAU
         gorDj7I0TV+zhu/0KqZUWCJGPJQW0qMW7O7iiYPGO9RMzfnp8y6ymqarkHKw8E2k2fxu
         DIiw==
X-Forwarded-Encrypted: i=1; AJvYcCUTOP1K4pzqjA4x+n1YWODw/Q0iA2+zNHRPwFmKp/K2COZ1fauYUauqd7JZ4embNMYIQ4eK7EPgUIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwojbdHKyCObFHbFJtQfv8EduLkUtdHgu34RkxerM0DG6/Z+Mug
	yJ+nEFUH8OcBAkniUpNCYPzzNnJOhmLVlBtAoQ6tTZlQmbHTQVaKiCzy
X-Gm-Gg: AZuq6aIVee8lqSiS0zokCS14SI/wJKkhq1ZdX2+it7uXsbU7n0yB2t7q2qySXz+sQLp
	HUrVMsZlPHbM10bxwD47HLamxS59ejLAaBe8SAC+j5cCauLRkIlO+bODNNDF4B+JekYQ8SKi++1
	+5o1cM7YIV2f9I/mG9xHAf5/XE4iRnlyPvVF+78WB+ZyqpY3d0YG1aTzIHqunnzQTzPGa88iOJC
	nkA40x2cfeiDOYWtiz7JpNeMyw+du54Bn9bQdvMUYO/8bgb2Yu/j2G74mlx/HopstJM+dduO/c/
	t2ux5Mvl8w3vLYndmBq51EttOLLpffA2WEnq7YbqkgCwE6MZDXu6wwN1t2stMZdKWCBxNhvJbUf
	u/P6fdUHlBSd39w2kzDPj1MS/63k6CIusOahK/K3AygXRU3ZDIpqXoWWR6tsxoRL2kNZGTc5ZVO
	RFXLGYm0YOuVYqgwzR7PSIQNfa8p/5lJmxDXNzCaoz1y0WTmavwEHr0A0eGQB0DHAK1r1C1Y5eV
	hmTm/bE
X-Received: by 2002:a05:600c:a00d:b0:482:df17:bbbc with SMTP id 5b1f17b1804b1-483a95e2535mr81859115e9.20.1771756888545;
        Sun, 22 Feb 2026 02:41:28 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3deb73bsm59542655e9.3.2026.02.22.02.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 02:41:28 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Junhui Liu <junhui.liu@pigmoral.tech>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Junhui Liu <junhui.liu@pigmoral.tech>
Subject: Re: [PATCH 0/7] rtc: sun6i: Add support for Allwinner A733 SoC
Date: Sun, 22 Feb 2026 11:41:26 +0100
Message-ID: <5061953.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6002-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jernejskrabec@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7AFC916EDA1
X-Rspamd-Action: no action

Hi!

Dne sreda, 21. januar 2026 ob 11:59:06 Srednjeevropski standardni =C4=8Das =
je Junhui Liu napisal(a):
> Add support for the Allwinner A733 RTC and its internal Clock Control
> Unit (CCU). Reuse the rtc-sun6i rtc driver while introducing a new
> SoC-specific RTC CCU driver to handle the hardware's evolved clock
> structure.
>=20
> To facilitate this addition and improve driver modularity, transition
> the binding between the RTC and its internal CCU from direct
> cross-subsystem function calls to the auxiliary bus. Also extract shared
> IOSC and 32kHz clock logic into a standalone ccu_rtc module for reuse
> across newer SoC generations.
>=20
> The A733 implementation supports hardware detection of three external
> crystal frequencies (19.2MHz, 24MHz and 26MHz), which is represented in
> the driver via read-only mux operations. Implement logic to derive a
> normalized 32kHz reference from these DCXO sources using fixed
> pre-dividers. Additionally, provide several new DCXO gate clocks for
> peripherals, including SerDes, HDMI, and UFS.

This work looks nice, but I have some questions/comments:
=2D you're missing RTC SPI clock, which is needed for RTC, at least accordi=
ng
  to vendor 5.15 DT. Could it be that this bit set by vendor U-Boot so you
  missed it during testing? Manual says that it's disabled by default.
=2D Vendor DT has strange RTC CCU phandles for UFS and HDMI. In first case
  uses RTC wakeup and in second DCXO, which doesn't make any sense. Did you
  do any experimentation with these clocks? It wouldn't be the first time
  that either code or manual contained some kind of error.

Btw, switch last two patches. With current order during bisection you would
get a complaint that A733 RTC CCU driver is not present.

Best regards,
Jernej



