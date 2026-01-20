Return-Path: <linux-rtc+bounces-5801-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDIdFWi0b2nHMAAAu9opvQ
	(envelope-from <linux-rtc+bounces-5801-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 17:59:20 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9714830D
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 17:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 90B64960E65
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Jan 2026 16:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCB446AECD;
	Tue, 20 Jan 2026 15:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u45QXdnb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D5646AEC7;
	Tue, 20 Jan 2026 15:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768924368; cv=none; b=IIH2yepQsWouVWhpigmmkFEYzJ5FbEAqWfYPHASv3SOSjAgYO041o86MHExuZs5/0r9aj5Eng7j32WzW7csOanBfWOWPowmPRRPN3E0pnt/qkYT4BXXKEEpOOTywHR1Y1OwiPxgNxQ3771/oNtdySHHvF/kKQyEC737eqnVoBsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768924368; c=relaxed/simple;
	bh=uG9SUZ9fmv9av9UYqizYrCWuhGaplTAmVrUN6tX0q+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXDoX5BOaBfAsYmK2/JWnkFHgYIT7dJKjW9mGWk/Wf1nAyBECLZ7ht4nSYb9BiuE2NJNMi88dRbDLVEf0DGuJwlPzTxUxr46Xj+J4QsMNr801ED/x6KQ77QSqwy95Qn3zMIugxPANVVAkjgyeSJodTLDc8a2I1sn2ytZoyTKV3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u45QXdnb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D0BC19422;
	Tue, 20 Jan 2026 15:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768924368;
	bh=uG9SUZ9fmv9av9UYqizYrCWuhGaplTAmVrUN6tX0q+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u45QXdnbVwJqCVCNuu6laAMvyjhuoF8aTfampzfriGuGVTnW9VIXzOb7MVDXTgDwV
	 gdlDjNjyoNC5WbmbNpqfKgf/ks2q8DMK3appC96mlOWFlMl06jyNUaw/vatQfKI0uz
	 7jmRaiePv6TgFVyX+9dEn84ii8VfuQscsUU5IsH1SYJNL9uwwYqwgFpiYV4V/DzjT/
	 gFaoyEfqdCRCbThRdfsxyGMYY68kGQLpT9sOJa1h56RdhkoyHvnvtyxJAVYWPxPrQo
	 UGYm41mQoLWl++rtkyuV9EQyL5ivtt31lYFRke9yvWRwDNgTP2hzhi3PwAiRI3j8T9
	 a3vnK9eZ0cbiA==
Date: Tue, 20 Jan 2026 15:52:41 +0000
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	tools@kernel.org, users@kernel.org
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>,
	Douglas Anderson <dianders@chromium.org>, kernel-team@android.com,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Samsung mfd/rtc driver alarm IRQ simplification
Message-ID: <20260120155241.GG1354723@google.com>
References: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
 <176892415694.2292562.7457528145774108517.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176892415694.2292562.7457528145774108517.b4-ty@kernel.org>
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5801-lists,linux-rtc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: AA9714830D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 20 Jan 2026, Lee Jones wrote:

> On Thu, 20 Nov 2025 14:38:03 +0000, André Draszik wrote:
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
>       (no commit info)
> [2/3] rtc: s5m: query platform device IRQ resource for alarm IRQ
>       commit: c70aee3dd85482c67720eb642d59ebbb9433faa5
> [3/3] mfd: sec: drop now unused struct sec_pmic_dev::irq_data
>       (no commit info)

Looks like b4 is having a bad day.

I just applied v3, not this set.

-- 
Lee Jones [李琼斯]

