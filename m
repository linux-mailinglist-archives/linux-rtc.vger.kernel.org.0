Return-Path: <linux-rtc+bounces-5800-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNlkCDCwb2nMKgAAu9opvQ
	(envelope-from <linux-rtc+bounces-5800-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 17:41:20 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D415447CB4
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 17:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 75A1C809B5B
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 16:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B70466B49;
	Tue, 20 Jan 2026 15:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/2zufsr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C8E466B45;
	Tue, 20 Jan 2026 15:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768924217; cv=none; b=RHZaYDzTh05b4M9euildMtgEDhpIp0sosyLEu44IXMf43qECrU0L3NRb4bwb5xPOq0+vELq3UGegIfpWx93yCoPZ369QDBmTm0rGpeJihgTYzZcK0dxNp6s2Qr/GAdYHcB/0KZ59Cx3hpoDIQhXDMuiUo0oKp3CI+ptcnW1Ujwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768924217; c=relaxed/simple;
	bh=8hGTla3jguuKER47536RO1Uzq03fB7ksJDGgFYzNj/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdnNvxxpNXd56ppiQT6O0GfTT76x9Elr68LlEPHgpnSSb7ImofUuyQ68Nb6wg+tEbvuoznjoFftNsuQ+VICN6SZeCXDa51I13jIUB09vtWHCgm+z12teefWF7V+10MziSTvicshV1UHLuHANnL3eM3kpzqSnW15hmpc3sHvnnM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/2zufsr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1469C16AAE;
	Tue, 20 Jan 2026 15:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768924216;
	bh=8hGTla3jguuKER47536RO1Uzq03fB7ksJDGgFYzNj/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/2zufsrp1H7QVsu3dAdn8em4wplw6c9+Xw4tCXjhfke5o/lTon8yms11b05tABCj
	 j5q9vYDSl2urbPYUEBqBHaU1FxgyFQ1wyWhhqO+0XWM3+wO2n0nLirvIePE4pkWUlw
	 fvNVON2qJKyr92GdEmHz+z4ttF4EcyO5MThBvBAq4EaAuPn11XCprdIDL2lc3aGkms
	 +bzKkNhqpypT8aSdkjSe9XPBz7pkypdbl9Lt5rsSzzkWlDPKKYOE8i8PHl6s1XcQVG
	 BKqVjywqV+Il8d9WaDH1sv60ERHl7+6QmBDhA+6iBzWkjV6zUA6Rp6GeZ54JcUlx4m
	 beSbcd1B3x/5Q==
Date: Tue, 20 Jan 2026 15:50:11 +0000
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>,
	Douglas Anderson <dianders@chromium.org>, kernel-team@android.com,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Samsung mfd/rtc driver alarm IRQ simplification
Message-ID: <20260120155011.GF1354723@google.com>
References: <20260113-s5m-alarm-v3-0-855a19db1277@linaro.org>
 <176892416020.2292562.12972171855041051987.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176892416020.2292562.12972171855041051987.b4-ty@kernel.org>
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5800-lists,linux-rtc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: D415447CB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 20 Jan 2026, Lee Jones wrote:

> On Tue, 13 Jan 2026 14:03:10 +0000, André Draszik wrote:
> > With the attached patches the Samsung s5m RTC driver is simplified a
> > little bit with regards to alarm IRQ acquisition.
> > 
> > The end result is that instead of having a list of IRQ numbers for each
> > variant (and a BUILD_BUG_ON() to ensure consistency), the RTC driver
> > queries the 'alarm' platform resource from the parent (mfd cell).
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/3] mfd: sec: add rtc alarm IRQ as platform device resource
>       commit: 153ae5c52b7063ac0926926d0cc9b53ee9d7fed2
> [2/3] rtc: s5m: query platform device IRQ resource for alarm IRQ
>       commit: c70aee3dd85482c67720eb642d59ebbb9433faa5
> [3/3] mfd: sec: drop now unused struct sec_pmic_dev::irq_data
>       commit: b31583a1a9ab32923734ceb5fc95e536dfacccf7

Submitted for testing.  Pull-request to follow.

For my own reference: ib-mfd-rtc-6.20

-- 
Lee Jones [李琼斯]

