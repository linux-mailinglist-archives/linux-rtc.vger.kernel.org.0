Return-Path: <linux-rtc+bounces-5837-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAkZBvEzcmmadwAAu9opvQ
	(envelope-from <linux-rtc+bounces-5837-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 15:28:01 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EE50467EDB
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 15:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A13E1783BE1
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 13:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B793128CE;
	Thu, 22 Jan 2026 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PbERNwKO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB76285C84;
	Thu, 22 Jan 2026 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769088490; cv=none; b=ir96xF94ZnEjfMdXTFyYtSrFYOrLee3NuOrQQ8XlERHsnHOLyHSR1BA0yrwh7EpFHrlAV8iZ45eHuVsEl7fOKszgJk8Yy5eNfw/qwJezpNn5h6OKJAizLuOjXKe/KJUBy/AcEgNifY12Gm/fArY4G6eKvF5fun30nLcCPAp6xTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769088490; c=relaxed/simple;
	bh=m7LIJRQjtRPjg3Jb4SLO2oheEUiHU0Oiaf9+/81j4x0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxu6jWKnKLRy9tmr+/C6gktItupVDfLaZpAjBvLw/2WXtMqOBer69KEWO0jA5HI2IK5kUzK9SYVa6Z6LRmnnzb+KN79CeyXfsozyAs77w3VgZEzC/T0dmqldI8XqagvI3NM2LuDaYbuJC2LMF9/dvRdIacsE5JXkYLG2FZBoFDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PbERNwKO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2141EC116C6;
	Thu, 22 Jan 2026 13:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769088490;
	bh=m7LIJRQjtRPjg3Jb4SLO2oheEUiHU0Oiaf9+/81j4x0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PbERNwKOqMb1gkllP1Ia4/a6rgw/FsVGLb6AOK+9n7ZnovIUdQJv5tLmruzmFxLx2
	 CgM9MWrWM/xw1u202pN0TGQ2iPL4/OhbeM80WlgV/CJ0P3XwvPdEzGOBP88SEuTYUY
	 YK2g4eP/O/bJRiH7VkJg9mlFIAlMsNhkE9hQxp1EJUW/5cCsvLfkqsMuHc4YHgfrpk
	 lZimIe1FMddfT/+M2myffRzp4WyutSPBuAoHFUhHZHqUX27/ukZ/4k3wPLkNOZUXWW
	 /zxg6WQdhcttHWY3qfFJQ8AreARNqzvMgk8YDFn7i5jE2dtBAmN3Bf2+R9WC8S5b+B
	 zNytEfFpZcXJA==
Date: Thu, 22 Jan 2026 13:28:04 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>,
	Douglas Anderson <dianders@chromium.org>, kernel-team@android.com,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD and RTC due for the v6.20
 merge window
Message-ID: <20260122132804.GH3831112@google.com>
References: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-5837-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EE50467EDB
X-Rspamd-Action: no action

Enjoy!

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-rtc-v6.20

for you to fetch changes up to b31583a1a9ab32923734ceb5fc95e536dfacccf7:

  mfd: sec: Drop now unused struct sec_pmic_dev::irq_data (2026-01-20 15:37:48 +0000)

----------------------------------------------------------------
Immutable branch between MFD and RTC due for the v6.20 merge window

----------------------------------------------------------------
André Draszik (3):
      mfd: sec: Add rtc alarm IRQ as platform device resource
      rtc: s5m: query platform device IRQ resource for alarm IRQ
      mfd: sec: Drop now unused struct sec_pmic_dev::irq_data

 drivers/mfd/sec-common.c         | 45 ++++++++++++++++++++--------
 drivers/mfd/sec-core.h           |  2 +-
 drivers/mfd/sec-irq.c            | 64 ++++++++++++++++++----------------------
 drivers/rtc/rtc-s5m.c            | 21 +++++--------
 include/linux/mfd/samsung/core.h |  1 -
 5 files changed, 71 insertions(+), 62 deletions(-)

-- 
Lee Jones [李琼斯]

